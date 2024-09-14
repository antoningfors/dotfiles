# Prompt string [user@host pwd]$ 
PS1="[\u@\h \w]\$ "

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$PATH:$HOME/.local/bin:$HOME/bin"
fi

# macOS specific settings
if [ $(uname -s) = 'Darwin' ]; then
  # Add homebrew to path
  if ! [[ "$PATH" =~ "/opt/homebrew/bin" ]]; then
    PATH="$PATH:/opt/homebrew/bin"
  fi
fi

export PATH

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Apparently helps with window resizing
shopt -s checkwinsize

# If any aliases file in home directory load them
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
