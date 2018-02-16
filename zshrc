# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/Users/JacksonCole/anaconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:/Users/JacksonCole/Ureka/bin:/Users/JacksonCole/Ureka/bin:/Users/JacksonCole/Ureka/python/bin:/Users/JacksonCole/Ureka/misc:/Users/JacksonCole/bin:/Users/JacksonCole/bin/openprograms:/Users/JacksonCole/bin/terminaldimensions:/Users/JacksonCole/bin/pyrafscripts:/Users/JacksonCole/bin/classready:/Users/JacksonCole/bin/useful:/Users/JacksonCole/bin/useful/constants/:/Users/JacksonCole/bin/Astro-PAL-1.07:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/Users/JacksonCole/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
#

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias vim="/usr/local/bin/mvim" aliases vim to macvim, currently not a huge fan of that

plugins=(… zsh-completions)
autoload -U compinit && compinit -i

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

################################################################################
# Personal aliases
eval "$(thefuck --alias)"	# Not really sure what this does...
PWS="/Users/JacksonCole/Documents/Everything/sites/jacksoncole.io"
################################################################################

################################################################################
# University of Wyoming REU Aliases
alias wy="cd /Users/JacksonCole/Documents/Everything/Academia/university_of_wyoming"
alias reu_journal="vim /Users/JacksonCole/Documents/Everything/Academia/university_of_wyoming/uw_astronomy_reu/UW_REU.master_document/University_of_Wyoming-Astronomy_REU-Jackson_L_Cole.tex"

alias myvnc="ssh -l jcole -L 5924:zulu.uwyo.edu:5924 zulu.uwyo.edu" #zulu.uwyo.edu"
alias myvnc2="vncviewer localhost:24 &"

alias horatio="ssh -XY observer@10.214.214.131"
alias pyrafipython="/Users/JacksonCole/Ureka/python/bin/ipython"
################################################################################

################################################################################
# Education aliases
alias lastsemester="cd /Users/JacksonCole/Documents/Everything/Academia/MTSU/year/2016-2017/2017_spring"
alias openlastsemester="open /Users/JacksonCole/Documents/Academia/Education/MTSU/year/2016-2017/2017_spring"

CS="/Users/JacksonCole/Documents/Everything/Academia/MTSU/year/2017-2018/2018_spring"
WALLINCODE="$HOME/Documents/Everything/Academia/research/undergraduate/wallin/WallinCode"
ASTRONOMY="/Users/JacksonCole/Documents/Everything/Astronomy/astronomy_club"
alias opencurrentsemester="open /Users/JacksonCole/Documents/Academia/Education/MTSU/year/2017-2018/2018_spring"

CLASSNOTES="/Users/JacksonCole/Documents/Everything/Academia/MTSU/year/mtsu.notes"
################################################################################

################################################################################
# Computing aliases
alias matlab='/Applications/MATLAB_R2017a.app/bin/matlab -nodesktop -nosplash'
alias sed='gsed'
################################################################################
#
################################################################################
# Astronomy aliases
alias pyrafsetup='ur_setup && pyraf'
################################################################################

################################################################################
# Noting function
noting() {
cd ~/Documents/Everything/notes/$*
}


##############################################
# Personal Functions

# The following defines a function that allows me to quickly generate notes.
n() {
	echo "Begin note as .txt or .md? Type .txt or .md and press [ENTER]: "
	read extension
	find ~/Documents/Everything/notes | grep -i $* > /dev/null

	if [ $? != 0 ] ; then
		FILE=~/Documents/Everything/notes/sort_later/"$*"$extension
		echo "Beginning note in notes/sort_later. You can sort it later..."
		$EDITOR $FILE
		echo "Restarting Google Drive to update..."
		rgoogle
	else
		echo "The following notes exist:"
		find ~/Documents/Everything/notes/ | grep -i $*
		echo "Please navigate to one of these notes or change the title of the note you wish to write. Exiting..."
	fi
}

journal.today() {
	TODAY=$(date +%m-%d-%Y)
	FILE=~/Documents/Everything/notes/journal/"$TODAY".md

	if [ ! -e "$FILE" ] ; then
    		touch "$FILE"
		echo "# $TODAY" >> $FILE
		echo "Beginning the journal entry for $TODAY."
	elif [ -e "$FILE" ] ; then
    		echo "Continuing the journal entry for $TODAY."
	fi

	$EDITOR $FILE

	echo "Restarting Google Drive to update..."
	rgoogle
}

nls() {
	ls -c ~/Documents/Everything/notes/ | grep "$*"
}

ur_setup() {
    eval `/Users/JacksonCole/.ureka/ur_setup -sh $*`
}
ur_forget() {
    eval `/Users/JacksonCole/.ureka/ur_forget -sh $*`
}
