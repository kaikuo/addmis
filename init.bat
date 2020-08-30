git clone --depth=1 https://github.com/kaikuo/addmis.git %USERPROFILE%/.vim
echo source ~/.vim/kinit.vim > %USERPROFILE%\_vimrc
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
gvim +PluginInstall +quit
