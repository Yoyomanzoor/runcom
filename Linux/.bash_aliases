# User-defined functions and aliases to run at bash startup

alias open="xdg-open"

# perform ls after cd
function cdls()
{
    builtin cd "$*"
    RESULT=$?
    if [ "$RESULT" -eq 0 ]; then
        ls -a
    fi
}

# Go to chang lab notebook
function gtNotebook()
{
    builtin cd /home/yoyo/Documents/GitHub/Chang-Lab-Notebook
}

# Knit Rmarkdown files
function knit() 
{
	R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc'); rmarkdown::render('$1')"
}

# Send notes and code to Chang Lab Notebook
# Finds files that have 4 digits, then ".", then any number of digits, then ".", then any number of digits, for html and Rmd files.
function sendRmd()
{
	if [ $(ls [0-9][0-9][0-9][0-9].[0-9]*.[0-9]*.html 2>/dev/null | head -c1 | wc -c ) -ne 0 ]; then
		echo "html files found."
		mv [0-9][0-9][0-9][0-9].[0-9]*.[0-9]*.html ~/Documents/GitHub/Chang-Lab-Notebook/notebook
	else
		echo "No valid html files. Make sure files are named correctly."
	fi
	if [ $(ls [0-9][0-9][0-9][0-9].[0-9]*.[0-9]*.Rmd 2>/dev/null | head -c1 | wc -c ) -ne 0 ]; then
		echo "Rmd files found."
		mv [0-9][0-9][0-9][0-9].[0-9]*.[0-9]*.Rmd ~/Documents/GitHub/Chang-Lab-Notebook/code/R-notebooks
	else
		echo "No valid Rmd files. Make sure files are named correctly."
	fi
}

# shh to uchicago
function sshinit() {
	sshfs $1@midway2.rcc.uchicago.edu:/project2/ebchang/Yoyo ~/Midway
	ssh $1@midway2.rcc.uchicago.edu
}

alias sshuc="ssh $1@midway2.rcc.uchicago.edu"
alias gitlog="git log --graph --oneline --all --decorate"

notebook="~/Documents/GitHub/Chang-Lab-Notebook/notebook"


