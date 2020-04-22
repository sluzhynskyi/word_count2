#ifndef WORD_COUNT_T_QUEUE_H
#define WORD_COUNT_T_QUEUE_H

#include <deque>
#include <iostream>
#include <mutex>
#include <thread>
#include <string>
#include <condition_variable>

template<class T>
class t_queue {
private:
    std::deque<T> queue;
    mutable std::mutex mut;
    std::condition_variable cond_variable;

public:
    t_queue() = default;

    ~t_queue() = default;

    t_queue(const t_queue<T> &q) = delete;

    const t_queue &operator=(const t_queue<T> &q) = delete;

    void push_back(T d) {
        {
            std::lock_guard<std::mutex> lg(mut);
            queue.push_back(d);
        }
        cond_variable.notify_one();
    }

    T pop() {
        std::unique_lock<std::mutex> lg(mut);
        cond_variable.wait(lg, [this]() { return queue.size() != 0; });
        T d = queue.front();
        queue.pop_front();
        return d;
    }

    std::vector<T> pop2() {
        std::unique_lock<std::mutex> lg(mut);
        cond_variable.wait(lg, [this]() { return queue.size() >= 2; });
        std::vector<T> v_d;
        v_d.push_back(queue.front());
        queue.pop_front();
        v_d.push_back(queue.front());
        queue.pop_front();
        return v_d;
    };

    T peek() {
        T d = queue.front();
        return d;
    };

    size_t get_size() const {
        std::lock_guard<std::mutex> lg(mut);
        return queue.size();
    }
};

#endif //WORD_COUNT_T_QUEUE_H
