#include "my_code.hpp"
#include <iostream>
boy::boy(const std::string &name) : name(name){}

void boy::say(){std::cout << name << std::endl;}