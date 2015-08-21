# Force a color prompt
force_color_prompt=yes
# Source my rvm stuff
source ~/.profile
# Source functions used by bash
source ~/.bash_functions
# Source prompt and color
source ~/.bash_prompt

# Start TMUX on all
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux -2

# Aliases
alias ..='cd ..'
alias disk='df -H'
alias news='newsbeuter'
## Pull from youtube
alias musicrip='youtube-dl --extract-audio --audio-format mp3'
#clamav
alias scan='clamscan -v -i'
# Create a tar.gz file
alias tarup='tar -cvzf'

# If exists, load bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Darwin - Macintosh - Apple
# If we are running on Mac, we need to do Mac things.
if [ "$(uname)" == "Darwin" ]; then
	export GOPATH=/Users/aaron/.gocode
	# Allow bash completion with brew
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		    . `brew --prefix`/etc/bash_completion
	fi
	# Get rid of the homebrew icon
	export HOMEBREW_NO_EMOJI=1
	# Set the vim installed by homebrew as our editor of choice
	export EDITOR=/usr/local/bin/vim
	# initialize jenv for managing multiple environments
	eval "$(jenv init -)"
	# Extra Stuff
	source ~/.bash_work_aliases
fi

# Linux - Ubuntu
# Linux boxes need love too
if [ "$(uname)" == "Linux" ]; then
	export TERM="xterm-256color"
	eval `dircolors ~/.dircolors`
	# Colorize this thing
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	# some more ls aliases
	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'
fi
