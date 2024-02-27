# update
sudo apt update

export DOTFILE_HOME=$(pwd)

# install packages
sudo apt install --no-install-recommends -y \
    curl\
    xsel\
    git \
    vim \
    zsh \

# setup Git
ln -sf $DOTFILE_HOME/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILE_HOME/git/.commit_messages ~/.commit_messages

# setup bash
#ln -sf $DOTFILE_HOME/bash/.bashrc ~/.bashrc
#source ~/.bashrc

# setup zsh and Zim
ln -sf $DOTFILE_HOME/zsh/.zshrc ~/.zshrc
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
ln -sf $DOTFILE_HOME/zsh/.zimrc ~/.zimrc
exec zsh -l

# setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $DOTFILE_HOME/vim/.vimrc ~/.vimrc

# setup neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
mkdir -p ~/.config/nvim
ln -sf $DOTFILE_HOME/neovim/init.vim ~/.config/nvim/init.vim

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim