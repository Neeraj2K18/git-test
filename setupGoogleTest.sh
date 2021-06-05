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
UNAME=$(uname)

if [ "$UNAME" == "Linux" ] ; then
	echo "Linux"
elif [ "$UNAME" == "Darwin" ] ; then
	echo "Darwin"
elif [[ "$UNAME" == CYGWIN* || "$UNAME" == MINGW* ]] ; then
	echo "Windows"
fi

##IMPORTANT##
#Check for requirements##
#git
#gnu gcc compiler
#gnu make
#cmake
echo -e "\ngit" 
git --version
echo -e "\ngcc" 
gcc --version
echo -e "\ngnu make" 
make --version
echo -e "\ncmake" 
cmake --version

read -r -p "Do you want to install googletest lib? [Y/N] " response

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
echo -e '\033[0;33m' "\n1>Clone googletest from github" '\033[0m'
git clone https://github.com/google/googletest.git

echo -e '\033[0;33m' "\n2>cd googletest and make build dir" '\033[0m'
cd googletest && mkdir build
cd build

echo -e '\033[0;33m' "\n\n3>build and make files.." '\033[0m'
cmake -G "MinGW Makefiles" ..
echo -e '\033[0;33m' "\n4>googletest lib compiling.." '\033[0m'
make -j4
read -p "Setup Completed! Press Enter to continue ..."

### END ###