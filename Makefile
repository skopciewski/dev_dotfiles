OH_MY_ZSH_DIR := $(HOME)/.oh-my-zsh
ZSH_CONFIG := $(HOME)/.zshrc
TMUX_CONFIG := $(HOME)/.tmux.conf
VIM_CONFIG := $(HOME)/.vimrc
VIM_DIR := $(HOME)/.vim
VIM_BUNDLE := $(VIM_DIR)/bundle

$(HOME)/%: %
	ln -fs $(PWD)/$< $@

all: prepare_zsh prepare_tmux prepare_vim

prepare_zsh: $(ZSH_CONFIG) $(OH_MY_ZSH_DIR)

$(OH_MY_ZSH_DIR):
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

prepare_tmux: $(TMUX_CONFIG)

prepare_vim: $(VIM_CONFIG) $(VIM_BUNDLE)

$(VIM_BUNDLE): | $(VIM_DIR)
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +VundleInstall +qall

$(VIM_DIR):
	mkdir -p $(VIM_DIR)/swap
	mkdir -p $(VIM_DIR)/undo
