#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/strix/.byobu/prompt ] && . /home/strix/.byobu/prompt   #byobu-prompt#
