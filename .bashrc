#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='exa'
PS1='[\u@\h \W]\$ '
[ -r /home/strix/.byobu/prompt ] && . /home/strix/.byobu/prompt   #byobu-prompt#

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

eval "$(starship init bash)"
complete -c man which
bind TAB:menu-complete

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


PATH=${PATH}:${HOME}/Scripts
export PATH
export GOOGLE_APPLICATION_CREDENTIALS=/run/media/strix/ATLANTIC/important-documents/sparta-7350d.json
export QT_AUTO_SCREEN_SCALE_FACTOR=1
source /home/strix/.config/broot/launcher/bash/br
