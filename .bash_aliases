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
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
