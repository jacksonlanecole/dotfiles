#!/bin/bash
# -----------------------------------------------------------------------------
#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
#
# Author : Jackson Cole
# Email  : <jackson@jacksoncole.io>
# Notes  :
#     The theming here is heavily based on the oh-my-zsh theme agnoster, found
#     here: https://github.com/agnoster/agnoster-zsh-theme.git

# Revisions:
#     2019 06 27 -> Initial implementation
# -----------------------------------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'

[[ -z "$TERMINAL" ]] && source $HOME/.profile
shopt -s autocd cdspell

# #############################################################################
# Prompt Related Stuff
# -----------------------------------------------------------------------------
# colors
# -----------------------------------------------------------------------------
# Foregrounds
BLACK=$(tput setaf 0)
BLUE=$(tput setaf 4)
RED=$(tput setaf 9)
YELLOW=$(tput setaf 3)
GREEN=$(tput setaf 2)
WHITE=$(tput setaf 256)

BG_BLACK=$(tput setab 0)
BG_BLUE=$(tput setab 4)
BG_RED=$(tput setab 9)
BG_YELLOW=$(tput setab 3)
BG_GREEN=$(tput setab 2)
BG_WHITE=$(tput setab 256)

RESET=$(tput sgr0)
BOLD=$(tput bold)
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Prompt Component: git
# -----------------------------------------------------------------------------
git_prompt() {
    if [ ! $(command -v git) ]; then
        return
    fi

    local git_prompt
    local branch
    local dirty
    local mode

    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        color_bg="$BG_BLACK"
        color_fg="$GREEN"
        color_end="$RESET"

        branch=$(parse_git_branch)

        if [ -n "$branch" ] ; then
            git_prompt="($branch)"
        fi

        if $(git_has_untracked) ; then
            color_fg="$YELLOW"
            git_prompt="$git_prompt U"
        fi

        if $(git_is_dirty) ; then
            color_fg="$YELLOW"
            git_prompt="$git_prompt ●"
        fi

        if $(git_has_staged) ; then
            git_prompt="$git_prompt +"
        fi

        mode=$(git_mode $(parse_git_path))
        if [ -n "$mode" ]; then
            color_fg="$BG_YELLOW"
            git_prompt="$git_prompt $mode"
        fi
    fi

    git_prompt="$color_bg$color_fg$git_prompt$color_end"

    printf "$git_prompt"
}

git_has_staged() { # -> bool
    if [[ $(git diff --cached) != "" ]]; then
        true
    else
        false
    fi
}

git_is_dirty() { # -> bool
    if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]; then
        true
    else
        false
    fi
}

git_has_untracked() { # -> bool
    if [[ $(git status --porcelain | grep "^??") != "" ]]; then
        true
    else
        false
    fi
}

parse_git_branch() { # -> str
    printf "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
}

parse_git_path() { # -> str
    printf "$(git rev-parse --git-dir 2>/dev/null)"
}

git_mode() { # -> str
    local repo_path=$1
    local mode
    if [ -e "$repo_path/BISECT_LOG" ]; then
        mode="<B>"
    elif [ -e "$repo_path/MERGE_HEAD" ]; then
        mode=">M<"
    elif [ -e "$repo_path/rebase" ]; then
        mode=">R>"
    fi

    printf "$mode"
}
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Prompt
# -----------------------------------------------------------------------------
PS1='\u\[$RED$BOLD\]@\[$RESET\]\h \[$BG_BLUE\]\[$BLACK\] \w \[$RESET\]\[$BLUE\] \[$BOLD\]$(git_prompt) \[$RESET\]\n\[$BOLD\]> \[$RESET\]'

bind 'TAB':menu-complete
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

screenfetch
