# .bashrc

# Norm
LINE_NUM=$((1 + RANDOM % $(wc -l ~/Documents/norm.txt | awk '{print $1}')))
sed "${LINE_NUM}q;d" ~/Documents/norm.txt

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Set the default text editor for man
export MANPAGER="nvim +Man!"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc
. "$HOME/.cargo/env"

# Check if we're in tmux and set custom orange PS1
if [ -n "$TMUX" ]; then
  ORANGE='\[\e[38;2;255;143;64m\]'
  RESET='\[\e[0m\]'
  export PS1="${ORANGE}\u@\h:\w\$${RESET} "
fi
