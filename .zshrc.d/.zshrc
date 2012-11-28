# -------------------------------------------------------------
# prompt

autoload colors
colors

shell=${$(cygpath -u ${(q)0}):t}
nprom () {
    setopt prompt_subst

    # colors
    local Ln=$'\n'
    local fC=$'%{$fg[default]%}'
    local fY=$'%{$fg[yellow]%}'
    local fR=$'%{$fg[red]%}'
    local fG=$'%{$fg[green]%}'
    local fRet="%0(?,$fG,%18(?,$fG,$fR))"

    # line value 
    local ret="${fRet} [ret:%?] $fC"
    local nowsh="[sh:${shell}] [lv:%L] [job:%j]"
    local times="<%D/%*>"
    local dir="$fY%~$fC"
    local host="%n@%M"

    local line_top="%S${ret} ${nowsh} %s"
    local line_mid="${times} ${host}:${dir}"
    local line_tail="%% "

    # prompt 
    PROMPT="%B${line_top}${Ln}${line_mid}${Ln}${line_tail}%b"
    RPROMPT="%B[%h]%b"

    SPROMPT="%r is correct? [n,y,a,e]: "
}
nprom

export DROPBOX=/C/Users/sai/Dropbox

eval `dircolors ~/dotfiles/.dir_colors -b`
# -------------------------------------------------------------
# hist

HISTFILE=$HOME/dotfiles/.zshrc.d/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# 履歴を共有する
setopt append_history

# シェルプロセスごとに履歴を共有
setopt share_history

# 先頭が空白の場合履歴を追加しない
setopt hist_ignore_space

# 重複した履歴を保存しない
setopt hist_ignore_dups

# ヒストリを呼び出してから実行する間に一旦編集できるようにする
setopt hist_verify

# 全履歴の一覧を出力する
function history-all { history -E 1 } 

#pushdの履歴は残さない。
setopt pushd_ignore_dups

# hist filter
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# -------------------------------------------------------------
# compleat
typeset -U fpath
fpath=($fpath ~/scripts/zle)

autoload -U compinit
compinit -u

# 補完の時に大文字小文字を区別しない (但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
zstyle ':completion:*:default' menu select=1

# 履歴による予測入力 (man zshcontrib)
autoload -U predict-on

#cdの設定
#ディレクトリ名だけで移動する。
setopt auto_cd

#自動でpushdする
setopt auto_pushd

# -------------------------------------------------------------
# alias

# short cut dirs


# for interactive operation
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'

# alias for some shortcuts for different directory listings
  alias ls='ls -hF --color=tty --show-control-chars'
  alias ll='ls -l'
  alias la='ls -A'
#  alias l='ls -CF'

# short cut
  #alias l="lv -Ou8 -Pu8"
  alias l="less"
  alias j="jobs"
  alias mkd="mkdir -p"
  alias bk="cp -ai"
  alias c="cat"
  alias nkfu="nkf -wLu"
  alias nkfw="nkf -w8Lw"

# -------------------------------------------------------------
# function

# short cut
  function e(){ /usr/bin/emacs $* }
  function nte(){ emacs $* & }
  function mint() { mintty & }
  function di(){ diff -u $* }
  function dil(){ diff -u $* | l }
# windows short cut
  function ex(){ explorer $(cygpath -w $1) } 
  function h(){ hamana.exe $(cygpath -w $1) & }
# makefile
  fucntion makec(){ make clean }
  function build(){ make }
  function rebuild(){ make clean && make }


  
# -------------------------------------------------------------
# other
bindkey -e
export EDITOR=emacs

# ファイル作成時のパーミッション
umask 022

# screen 時に ssh, telnet でログインしたホスト名を window 名にする
if [ "$TERM" = "screen" ]; then
    function ssh() {
        echo -n "^[k$1^[\\"
        /usr/bin/ssh $1
    }
fi

# 端末設定
stty    erase   '^H'        # Ctrl+H に 1 文字削除
stty    intr    '^C'        # Ctrl+C に割り込み
stty    susp    '^Z'        # Ctrl+Z にサスペンド

 
# set env
export PATH=$PATH:$HOME/bin:$HOME/script:./
export today=`date +%Y%m%d`

# z jump
source ~/dotfiles/.zshrc.d/z/z.sh
precmd() {
    _z --add $(pwd -P)
}

# migemo
alias mig='/home/script/junk/mig.sh'


