#! /bin/bash
VIM_FOLDER="$HOME/workspace/github/vim"
INST_FOLDER="$HOME/workspace/tools/vim"
INST_FOLDER_MAC="/Users/foxleoly/tools/vim"

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
    cmds="./configure --prefix=$INST_FOLDER --enable-gui=yes --without-x --enable-cscope --enable-multibyte --enable-python3interp=yes  --with-python3-command=python3 --enable-pythoninterp=yes  --with-python-command=python2 --enable-luainterp=yes --enable-fail-if-missing"
else
# configure command setup for mac
    echo "OS:==> $(uname -s)"
    # todo: change the cmds for macOS
    # cmds="./configure --prefix=$INST_FOLDER_MAC --enable-gui=no --without-x --enable-cscope --enable-multibyte --enable-python3interp=yes  --with-python3-command=python3 --enable-pythoninterp=yes  --with-python-command=python2"
    cmds="./configure --prefix=$INST_FOLDER_MAC --enable-gui=no --without-x --enable-cscope --enable-multibyte --enable-python3interp=yes  --with-python3-command=python3 --enable-fail-if-missing --enable-luainterp=yes --with-lua-prefix=/usr/local/Cellar/lua/5.4.7"
fi
echo "execute command :=======> $cmds"
sleep 3s
# compile comands
output="$(exec $cmds)"
echo "$output"
sudo make -j
echo "Sleep 3s for install ...."
sleep 3s
sudo make install -j
vim_ver="$(vim --version | head -n 3)"
echo "$vim_ver"
