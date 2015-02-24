OH_MY_ZSH_DIR := $(HOME)/.oh-my-zsh
ZSH_CONFIG := $(HOME)/.zshrc

$(HOME)/%: %
	ln -fs $(PWD)/$< $@

all: prepare_zsh

prepare_zsh: $(ZSH_CONFIG) $(OH_MY_ZSH_DIR)

$(OH_MY_ZSH_DIR):
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
