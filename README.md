# addmis is a simple plugin for my self functions
what you need to use Vundle and my key binddings:

Clone plugins
==============

clone my plugin

`git clone https://github.com/kaikuo/addmis.git %USERPROFILE%/.vim`

clone vundle.vim plugin

`git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim`


On windows
============

backup your current vimrc files:

`copy %USERPROFILE%\_vimrc %USERPROFILE%\_vimrc.bak`


make new vimrc file

`echo source ~/.vim/kinit.vim > %USERPROFILE%\_vimrc`

On Linux/Unix
==============

`echo source ~/.vim/kinit.vim > ~/.vimrc`

Final step
=============

execute:

:VundleInstall

gvim +PluginInstall +quit

vim +PluginInstall +quit

vim ~/.vim/config.vim 

to Change Your name for doxygenToolkit, etc

download and delete $VIM/gvimrc

http://files.kaoriya.net/vim/
