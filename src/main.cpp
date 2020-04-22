#include <iostream>
#include <boost/format.hpp>
#include <boost/locale.hpp>
#include <boost/program_options.hpp>
#include <boost/algorithm/string.hpp>
#include <string>
#include <map>
#include <vector>
#include <thread>
#include "../inc/t_queue.h"
#include <boost/filesystem.hpp>
#include "../inc/time.hpp"
#include "../inc/read_write.hpp"
#include "../inc/sort.hpp"

namespace bl = boost::locale::boundary;
namespace po = boost::program_options;

std::mutex mtx;

void merge_dict(t_queue<std::map<std::string, int>> &dict_tq) {
    std::map<std::string, int> first_map;
    std::map<std::string, int> second_map;
    std::vector<std::map<std::string, int>> merge_pair;

    while (true) {

        mtx.lock();
        if (dict_tq.get_size() >= 2) {
            merge_pair = dict_tq.pop2();
        } else {
            mtx.unlock();
            break;
        }
        mtx.unlock();
        first_map = merge_pair[0];
        second_map = merge_pair[1];

        for (const auto &x : second_map) {
            first_map[x.first] += x.second;
        }
        dict_tq.push_back(first_map);
    }
}

void count_words_thr(t_queue<std::string> &str_tq, std::map<std::string, int> &dict) {
    while (true) {
        std::string str_txt = str_tq.pop();
        if (str_txt == "asdfgh") {
            str_tq.push_back(str_txt);
            break;
        }
        bl::ssegment_index map(bl::word, str_txt.begin(), str_txt.end());
        // Define a rule
        map.rule(bl::word_letters);
        for (bl::ssegment_index::iterator it = map.begin(), e = map.end(); it != e; ++it) {
            ++dict[*it];
        }
    }
}

void read_str_from_dir_thr(std::string &in, t_queue<std::string> &str_tq) {
    t_queue<std::string> tq;
    std::vector<std::string> root;
    root.push_back(in);
    read_from_dir(root, &tq);


    std::string str_txt;
    while (tq.get_size()) {
        str_txt = std::string(tq.pop());
        boost::algorithm::to_lower(str_txt);
        boost::locale::normalize(str_txt);
        boost::locale::fold_case(str_txt);
        str_tq.push_back(str_txt);
    }
    str_tq.push_back(std::string("asdfgh"));
}

int main(int argc, char *argv[]) {
    boost::locale::generator gen;
    std::locale::global(gen("en_us.UTF-8"));
    std::string conf_file;
    if (argc == 1) {
        conf_file = "config.dat";
    } else if (argc == 2) {
        conf_file = argv[1];
    } else {
        std::cerr << "Insufficient amount of arguments.\n";
        exit(1);
    }

    std::ifstream conf(conf_file, std::ios::in);

    if (!conf.is_open()) {
        std::cerr << "Could not open the configuration file. Set your working directory to ..\n";
        exit(2);
    }

    std::string in, out_a, out_n;
    int thr, merge_thr;

    po::options_description config_parser;
    config_parser.add_options()
            ("in", po::value<std::string>(&in)->default_value("data_in/"))
            ("out_a", po::value<std::string>(&out_a)->default_value("data_out/result_by_name.txt"))
            ("out_n", po::value<std::string>(&out_n)->default_value("data_out/result_by_number.txt"))
            ("thr", po::value<int>(&thr)->default_value(1))
            ("merge_thr", po::value<int>(&merge_thr)->default_value(1));

    po::variables_map vm;
    store(parse_config_file(conf, config_parser), vm);
    notify(vm);
    if (thr < 1) {
        std::cerr << "Insufficient number of threads." << std::endl;
        exit(3);
    }

    auto start_load = get_current_time_fenced();

    t_queue<std::string> str_tq;


    auto start_merge = get_current_time_fenced();
    auto finish_merge = get_current_time_fenced();

    auto start_count = get_current_time_fenced();

    auto start_time = get_current_time_fenced();

    std::map<std::string, int> dict;
    std::vector<std::thread> v;


    if (thr == 1) {

        v.emplace_back(read_str_from_dir_thr, std::ref(in), std::ref(str_tq));

        v.emplace_back(count_words_thr, std::ref(str_tq), std::ref(dict));

        for (auto &t: v) {
            t.join();
        }
    } else {
        start_count = get_current_time_fenced();
        std::map<std::string, int> dicts[thr];
        t_queue<std::map<std::string, int>> dict_tq;
        std::vector<std::thread> m;

        v.emplace_back(read_str_from_dir_thr, std::ref(in), std::ref(str_tq));

        for (int i = 0; i < thr; ++i) {
            v.emplace_back(count_words_thr, std::ref(str_tq), std::ref(dicts[i]));
        }
        for (auto &t: v) {
            t.join();
        }

        for (const auto& d : dicts) {
            dict_tq.push_back(d);
        }

        start_merge = get_current_time_fenced();

        for (int i = 0; i < merge_thr; ++i) {
            m.emplace_back(merge_dict, std::ref(dict_tq));
        }

        for (auto &t: m) {
            t.join();
        }

        dict = dict_tq.pop();
    }

    auto finish = get_current_time_fenced();

    auto count_time = start_merge - start_count;
    auto merge_time = finish - start_merge;

    std::cout << "Counting: " << static_cast<float>(to_ms(count_time)) / 1000 << std::endl;
    std::cout << "Merge: " << static_cast<float>(to_ms(merge_time)) / 1000 << std::endl;
    std::cout << "Total: " << static_cast<float>(to_ms(merge_time + count_time)) / 1000 << std::endl;

    write_file(out_a, dict);
    std::vector<std::pair<std::string, int>> vec = sort_by_value(dict);
    write_file(out_n, vec);

    return 0;
}
