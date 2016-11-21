# If not running interactively, do not do anything
[[ $- != *i* ]] && return

# Force a color prompt
force_color_prompt=yes

# If exists, Source my rvm stuff
if [ -f ~/.profile ]; then
	source ~/.profile
fi

# if exists, Source functions used by bash
if [ -f ~/.bash_functions ]; then
	source ~/.bash_functions
fi

# If exists, Source prompt and color
if [ -f ~/.bash_prompt ]; then
	source ~/.bash_prompt
fi

# If exists, load bash_aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ "$(uname)" == "Darwin" ]; then
	# If exists, load apple centric config file
	if [ -f ~/.bash_config_apple ]; then
		source ~/.bash_config_apple
	fi
fi

if [ "$(uname)" == "Linux" ]; then
	# If exists, load linux centric config file
	if [ -f ~/.bash_config_linux ]; then
		source ~/.bash_config_linux
	fi
fi


# Add the GOPATH since some of my tools use GO
export GOPATH=$HOME/.gocode
export PATH="/usr/local/sbin:$PATH"
