# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/software/Anaconda3-5.3.0-el7-x86_64/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/software/Anaconda3-5.3.0-el7-x86_64/etc/profile.d/conda.sh" ]; then
        . "/software/Anaconda3-5.3.0-el7-x86_64/etc/profile.d/conda.sh"
    else
        export PATH="/software/Anaconda3-5.3.0-el7-x86_64/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PS1="\[\e[0;31m\][\u\[\e[m\e[2;31m\]@\h\[\e[m\] \[\e[1;36m\]\W]\[\e[m\]\$ "

# export PS1="\e[0;31m[\u\e[m\e[2;31m@\h\e[m \e[1;36m\W]\e[m\$ "
# oldps1
# export PS1="[\u@\h \W]\$"

export PATH="/home/$USER/bin:$PATH"
export PATH="$PATH:/home/$USER/.local/bin"

function gotoRNASeq() {
    cd /project2/ebchang/Yoyo/RNASeqAlign
}

function gotoProj2() {
    cd /project2/ebchang/Yoyo
}

function startGit() {
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa
}

function knit() {
    R -e "rmarkdown::render('$1')"
}

function jupyter() {
    IP=$(/sbin/ip route get 8.8.8.8 | awk '{print $NF;exit}')
    jupyter-notebook --no-browser --ip=$IP
}

function jupyterlab() {
    IP=$(/sbin/ip route get 8.8.8.8 | awk '{print $NF;exit}')
    jupyter-lab --no-browser --ip=$IP
}

if [ "$HOSTNAME" = penguin ]; then
    echo
    echo 'attaching to X11... 🍻'
    xhost +SI:localuser:root
fi


alias squeueCheck="watch -n 5 'squeue --user=smanzoor'"
alias squeueCancel="scancel --user=smanzoor"

alias gitlog="git log --graph --oneline --all --decorate"
alias list="ls -Aohp"
alias fs="du -hS | sort -h"

