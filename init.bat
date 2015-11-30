echo source ~/.vim/kinit.vim > %USERPROFILE%\_vimrc
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
gvim +PluginInstall +quit
