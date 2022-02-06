#! /bin/bash
VIM_FOLDER="/home/foxleoly/workspace/vim"
INST_FOLDER="/home/foxleoly/workspace/tools/vim"
INST_FOLDER_MAC="/home/foxleoly/workspace/tools/vim"

echo "Get latest vim files ...."
cd $VIM_FOLDER
git pull
cd src
echo "clean VIM folder...."
sudo make clean
sudo make distclean
echo "Compile VIM  ...."
# uname="$(uname -s)"
# check the uname output
# cmds=""
if [ $(uname -s) == "Linux" ]
then 
    echo "OS:==> $(uname -s)"
    cmds="./configure --prefix=$INST_FOLDER --enable-gui=no --without-x --enable-cscope --enable-multibyte --enable-python3interp=yes  --with-python3-command=python3 --enable-pythoninterp=yes  --with-python-command=python2"
else
# configure command setup for mac
    echo "OS:==> $(uname -s)"
    # todo: change the cmds for macOS
    cmds="./configure --prefix=$INST_FOLDER_MAC --enable-gui=no --without-x --enable-cscope --enable-multibyte --enable-python3interp=yes  --with-python3-command=python3 --enable-pythoninterp=yes  --with-python-command=python2"
fi
echo "execute command :=======> $cmds"
sleep 3s
# compile comands
output="$(exec $cmds)"
echo "$output"
sudo make 
echo "Sleep 3s for install ...."
sleep 3s
sudo make install
vim_ver="$(vim --version | grep compiled)"
echo "$vim_ver"
