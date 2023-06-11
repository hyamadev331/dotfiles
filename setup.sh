# update
sudo apt update

export DOTFILE_HOME=$(pwd)

# install packages
sudo apt install --no-install-recommends -y \
    curl \
    git \
    vim \

# setup bash
ln -sf $DOTFILE_HOME/.bashrc ~/.bashrc
source ~/.bashrc

# setup Git
ln -sf $DOTFILE_HOME/.gitconfig ~/.gitconfig

# setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $DOTFILE_HOME/.vimrc ~/.vimrc
