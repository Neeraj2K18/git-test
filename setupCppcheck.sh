#!/bin/bash

# BAT / CMD goto function
function goto
{
    label=$1
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

### START ###
echo -e "Script starting....."
read -r -p "Do you want to install Cppcheck lib? [Y/N] " response

#Check for the response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo -e "\n Installing....."
	goto "$Start"
else
    echo -e "\n No, Exit..... "
	exit 1
fi

#Start Label
: Start
echo -e '\033[0;33m' "\n1>clone Cppcheck from github" '\033[0m'
git clone https://github.com/danmar/cppcheck.git

echo -e '\033[0;33m' "\n2>cd Cppcheck and make build dir" '\033[0m'
cd cppcheck && mkdir build
cd build

echo -e '\033[0;33m' "\n\n3>build and make files.." '\033[0m'
cmake -G "MinGW Makefiles" ..
echo -e '\033[0;33m' "\n4>cppcheck lib compiling.." '\033[0m'
cmake --build .
#echo -e '\033[0;33m' "\n4>googletest lib compiling.." '\033[0m'
#make -j4
read -p "Setup Completed! Press Enter to continue ..."

### END ###