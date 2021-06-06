cppcheck --enable=all --suppress=missingIncludeSystem ./*.cpp

gcov --coverage main.c
./run.sh

>clang++ -std=c++17 -Wall main.cpp
>g++ -std=c++17 -Wall main.cpp
>./main.exe