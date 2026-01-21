#include <iostream>

class Greeter {
public:
    void sayHello() {
        std::cout << "Hello from C++" << std::endl;
    }
};

void cpp_function() {
    Greeter g;
    g.sayHello();
}
