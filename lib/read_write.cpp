#include "../inc/read_write.hpp"
#include "boost/locale.hpp"
#include "boost/algorithm/string.hpp"

namespace fs = boost::filesystem;

std::vector<std::string> get_file_list(const std::string &path) {
    std::vector<std::string> m_file_list;
    if (fs::is_directory(path) && !fs::is_empty(path)) {
        fs::path apk_path(path);
        fs::recursive_directory_iterator end;

        for (auto &p : boost::filesystem::directory_iterator(path)) {
            m_file_list.push_back(p.path().string());
        }
    }
    return m_file_list;
}

void reading_from_archive(const std::string &buffer, t_queue<std::string> *tq) {
    struct archive *a;
    struct archive_entry *entry;
    la_int64_t r;
    off_t entry_size;
    a = archive_read_new();
    archive_read_support_format_all(a);
    archive_read_support_filter_all(a);
    archive_read_support_format_raw(a);
    // read from buffer, not from the file
    r = archive_read_open_memory(a, buffer.c_str(), buffer.size());
    for (;;) {
        r = archive_read_next_header(a, &entry);
        if (r == ARCHIVE_EOF) {
            break;
        }
        if (r < ARCHIVE_OK) {
            break;
        }
        if (r < ARCHIVE_WARN) {
            break;
        }
        // Do nothing if not txt files
        if (boost::filesystem::path(archive_entry_pathname(entry)).extension() == ".txt") {
            entry_size = archive_entry_size(entry);
            std::string output(entry_size, char{});
            r = archive_read_data(a, &output[0], output.size());
            if (output.size() < 10000000) {
                // write explicitly to the other buffer
                tq->push_back(boost::locale::fold_case(boost::locale::normalize(output)));
            }
        }
    }
    archive_read_close(a);
    archive_read_free(a);
}

void read_from_dir(const std::vector<std::string> &files, t_queue<std::string> *tq) {
    for (const auto &file_name : files) {
        std::ostringstream buffer_ss;
        if (fs::exists(file_name)) {
            if (fs::is_directory(fs::path(file_name))) {
                read_from_dir(get_file_list(file_name), tq);
            } else {
                std::ifstream raw_file(file_name, std::ios::binary);
                buffer_ss << raw_file.rdbuf();
                std::string buffer{buffer_ss.str()};
                if (fs::path(file_name).extension() == ".txt") {
                    if (buffer.size() < 10000000) {
                        std::cout << file_name << std::endl;
                        tq->push_back(boost::locale::fold_case(boost::locale::normalize(buffer)));
                    }
                } else {
                    std::cout << file_name << std::endl;
                    reading_from_archive(buffer, tq);
                }
            }

        } else {
            std::cerr << "File: " << file_name << " is't exists" << std::endl;
            exit(1);
        }
    }
}
