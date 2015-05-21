OH_MY_ZSH_DIR := $(HOME)/.oh-my-zsh
ZSH_CONFIG := $(HOME)/.zshrc
ZSH_CONFIG_LOCAL := $(HOME)/.zshrc_local

TMUX_CONFIG := $(HOME)/.tmux.conf

VIM_CONFIG := $(HOME)/.vimrc
VIM_DIR := $(HOME)/.vim
VIM_BUNDLE := $(VIM_DIR)/bundle

all: prepare_zsh prepare_tmux prepare_vim 

$(HOME)/%: %
	ln -fs $(PWD)/$< $@

# for zsh
prepare_zsh: $(ZSH_CONFIG) $(ZSH_CONFIG_LOCAL) $(OH_MY_ZSH_DIR)

$(ZSH_CONFIG_LOCAL):
	touch $(ZSH_CONFIG_LOCAL)

$(OH_MY_ZSH_DIR):
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# for tmux
prepare_tmux: $(TMUX_CONFIG)

# for vim
prepare_vim: $(VIM_CONFIG) $(VIM_BUNDLE)

$(VIM_BUNDLE): | $(VIM_DIR)
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +VundleInstall +qall

$(VIM_DIR):
	mkdir -p $(VIM_DIR)/swap
	mkdir -p $(VIM_DIR)/undo
