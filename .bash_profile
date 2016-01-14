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
alias musicrip='/usr/local/bin/youtube-dl --extract-audio --audio-format mp3'
# This can be used to trim the intro off of songs.
# ffmpeg -ss 30 -i inputfile.mp3 -acodec copy outputfile.mp3
#clamav
alias scan='clamscan -v -i'
# Create a tar.gz file
alias tarup='tar -cvzf'
# Check if running or get PID
alias spock="ps -clf | grep $i"
alias phaser="kill -9 $i"
# Check if you have been hacked by username or email
alias pwned="curl https://haveibeenpwned.com/api/v2/breachedaccount/"
#Perform a site test using ApacheBench / Benchmarks for speed
#alias bench="ab -n $i -c $i address"
# Add HUB as an overlay to Git
# https://github.com/github/hub
eval "$(hub alias -s)"
## Use this to clone all of the repositories for a user.
# USER=IWriteThings;PAGE=1; curl "https://api.github.com/users/$USER/repos?page=$PAGE&per_page=100" | grep -e 'git_url*' | cut -d \" -f 4 | xargs -L1 git clone


# If exists, load bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Darwin - Macintosh - Apple
# If we are running on Mac, we need to do Mac things.
if [ "$(uname)" == "Darwin" ]; then
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
	# Run all updates for Mac
	alias doupdate='brew update; brew upgrade --all; softwareupdate -a -i -v; vim +PluginUpdate +qall;freshclam; ~/.tmux/plugins/tpm/bin/update_plugins all;'
	# Extra Stuff
	source ~/.bash_work_aliases
	# Setting PATH for Python 3.5
	# The orginal version is saved in .bash_profile.pysave
	PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
	export PATH
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
	# Set the vim installed by homebrew as our editor of choice
	export EDITOR=/usr/bin/vim
	# Use xclip like pbcopy under the mac
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
fi

# Add the GOPATH since some of my tools use GO
export GOPATH=$HOME/.gocode
