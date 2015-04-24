OH_MY_ZSH_DIR := $(HOME)/.oh-my-zsh
ZSH_CONFIG := $(HOME)/.zshrc

TMUX_CONFIG := $(HOME)/.tmux.conf

VIM_CONFIG := $(HOME)/.vimrc
VIM_DIR := $(HOME)/.vim
VIM_BUNDLE := $(VIM_DIR)/bundle

USER_BIN_DIR := $(HOME)/sbin
TODO_BIN := $(USER_BIN_DIR)/todo.sh
TODO_CONF_DIR := $(HOME)/.todo
TODO_ACTIONS_DIR := $(HOME)/.todo.actions.d

WHEN_CONF_DIR := $(HOME)/.when

all: prepare_zsh prepare_tmux prepare_vim prepare_todo prepare_when

$(HOME)/%: %
	ln -fs $(PWD)/$< $@

# for zsh
prepare_zsh: $(ZSH_CONFIG) $(OH_MY_ZSH_DIR)

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

#for todo.txt
prepare_todo: $(TODO_BIN) $(TODO_CONF_DIR) $(TODO_ACTIONS_DIR)

$(TODO_BIN):  | $(USER_BIN_DIR)
	ln -s $(PWD)/todotxt/todo.sh $(TODO_BIN)

$(USER_BIN_DIR):
	mkdir -p $(USER_BIN_DIR)

$(TODO_CONF_DIR):
	mkdir -p $(TODO_CONF_DIR)
	ln -s $(PWD)/todotxt/config $(TODO_CONF_DIR)/config
	ln -s $(PWD)/todotxt/conky-config $(TODO_CONF_DIR)/conky-config

$(TODO_ACTIONS_DIR):
	mkdir -p $(TODO_ACTIONS_DIR)
	ln -s $(PWD)/todotxt/actions/add $(TODO_ACTIONS_DIR)/add

#for when
prepare_when: $(WHEN_CONF_DIR)

$(WHEN_CONF_DIR):
	mkdir -p $(WHEN_CONF_DIR)
	ln -s $(PWD)/when/preferences $(WHEN_CONF_DIR)/preferences

