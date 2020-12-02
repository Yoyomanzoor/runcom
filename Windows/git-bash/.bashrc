# .bashrc

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

function lookup() {
	grep -rnw . -e $1
}
