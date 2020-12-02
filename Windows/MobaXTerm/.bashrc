# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# export PATH="/home/$USER/bin:$PATH"
# export PATH="$PATH:/home/$USER/.local/bin"

function knit() {
    R -e "rmarkdown::render('$1')"
}

alias gitlog="git log --graph --oneline --all --decorate"
alias list=" ls -Ahpl1"
alias fs="du -hal . | sort -n"

