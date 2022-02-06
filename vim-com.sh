#! /bin/bash
echo "Get latest vim files ...."
cd /home/foxleoly/workspace/vim
git pull
cd src
echo "clean VIM folder...."
sudo make clean
sudo make distclean
echo "Compile VIM  ...."
# uname="$(uname -s)"
# check the uname output
cmds=""
if [ $(uname -s) == "Linux" ]
then 
echo "OS:==> $(uname -s)"
cmds="./configure --prefix=/home/foxleoly/workspace/tools/vim --enable-gui=no --without-x --enable-cscope --enable-multibyte --enable-python3interp=yes  --with-python3-command=python3 --enable-pythoninterp=yes  --with-python-command=python2"
else
# configure command setup for mac
     echo "OS:==> $(uname -s)"
     cmds="./configure --prefix=/home/foxleoly/workspace/tools/vim --enable-gui=no --without-x --enable-cscope --enable-multibyte --enable-python3interp=yes  --with-python3-command=python3 --enable-pythoninterp=yes  --with-python-command=python2"
fi
echo "execute below command :=======>\n $cmds"
sleep 3s
output="$(exec $cmds)"
echo "$output"
sudo make 
echo "Sleep 3s for install ...."
sleep 3s
sudo make install
vim_ver="$(vim --version | grep compiled)"
echo "$vim_ver"
