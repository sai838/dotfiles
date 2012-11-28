# -------------------------------------------------------------
# environment

# history
export HISTCONTROL="ignoreboth"
export HISTFILESIZE="4096"
export HISTSIZE="4096"
export HISTFILE="~/dotfiles/.bash.d/.bash_history"


# -------------------------------------------------------------
# shell option

# interaction mode
if [[ "${PS1}" ]] ; then
    shopt -s cmdhist
    shopt -s histappend
    shopt -s checkwinsize
    shopt -s no_empty_cmd_completion
    shopt -u histappend
    shopt -q -s cdspell
    shopt -q -s checkwinsize
    shopt -s cmdhist
fi

# -------------------------------------------------------------
# terminal

# prompt
# function custom_prompt_command {
#     typeset _Retv=$?
#     typeset _PromptColor=""
#     if [[ ${_Retv} -eq 0 ]] ; then
#         _PromptColor=$BASH_PROMPT_OK
#     else 
#         _PromptColor=$BASH_PROMPT_NG
#     fi
#   export PS1="\[${_PromptColor}\]
# [ Host: \H | Time: $(/bin/date '+%Y-%m-%d %H:%M:%S') | User: \u | Retv: \$? ]
# [ Path: \w ]
# # \[\e[0m\]"
# }
function custom_prompt_command {
    typeset _Retv=$?

    typeset fS="\[\033[07m\]"
    typeset fs="\[\033[27m\]"
    typeset fB="\[\033[01m\]"
    typeset fN="\[\033[00m\]"
    typeset fD="\[\033[39m\]"

    typeset fY="\[\033[33m\]"
    typeset fR="\[\033[31m\]"
    typeset fG="\[\033[32m\]"

    typeset _RetC=""
    if [[ ${_Retv} -eq 0 ]] ;then
	_RetC=${fG}
    elif [[ ${_Retv} -eq 18 ]] ;then
	_RetC=${fG}
    else
	_RetC=${fR}
    fi	

    typeset ret="${_RetC}${fS} [ret:${_Retv}] ${fs}${fD}"
    typeset nowsh="${fS} [sh:\s] [lv:$SHLVL] [job:\j] ${fs}"
    typeset dirs="\u@\H:${fY}\w${fD}"

    export PS1="${fB}${ret}${nowsh}\n<\t> ${dirs}\n[\!]\$ ${fN}"
}

PROMPT_COMMAND="custom_prompt_command"

case ${TERM} in
    "xterm")
        stty -ixon -ixoff
        eval $(dircolors ~/dotfiles/.dir_colors)
        alias ls='ls --classify --color=auto --show-control-char'
        ;;
    "emacs")
        export LS_COLORS='no=00:fi=00:di=35:ln=36:ex=32'
        export TERM_LENGTH='90'
        alias ls='ls --classify --color --show-control-char -C'
        ;;
esac

# -------------------------------------------------------------
# complete

complete -d cd

# -------------------------------------------------------------
# alias

# for interactive operation
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'

# alias for misc
  alias grep='grep --color'

# alias for some shortcuts for different directory listings
  alias ls='ls -hF --color=always --show-control-chars'
  alias ll='ls -l'
  alias la='ls -A'
  alias l='ls -CF'

#alias for sc
  alias mkd='mkdir -vp'
  function e(){ emacs $* & }

# -------------------------------------------------------------
# change directory
if [[ "$__PWD__" != "" ]] ; then
    cd "$(echo $__PWD__ | nkf -s)"
else
    cd "$(pwd)"
fi

export INST_DIR=$inst_dir