#______________________________________________________#

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/.histfile
EDITOR=lvim
VISUAL=lvim

#______________________________________________________

# environment variables 


export PATH=/home/ahmed/.local/bin:/home/ahmed/.cargo/bin:$PATH
export PATH=:/home/ahmed/.surrealdb$PATH
export PATH=/home/ahmed/.local/share/rtx/installs/node/20.2.0/bin$PATH
export PATH=/usr/local/go/bin$PATH
export PATH=/home/ahmed/downloads/tars/zig-linux-x86_64-0.10.1$PATH
export PATH=/usr/lib/jvm/jdk-20/bin$PATH

set JAVA_HOME="/usr/lib/jvm/jdk-20"


#______________________________________________________

# tree symbols
alias tsym="echo "├ ─ │ └"" 

# deno
alias dd="deno run --check" 

# obsidian
alias obs="cp -r ~/templates/.obsidian .; cp -r ~/templates/.obsidian.vimrc ." 

# vim
alias svim=" sudo vim"

# aliases
alias sk=" sioyek"

# surreal db
alias sur="surreal" 

# ranger
alias r="ranger"

# bash
alias o="bash open ."

# rust and cargo
alias cr="cargo run"
alias cn="cargo new"

# sioyek pdf
alias sk="sioyek & disown"

# docker
alias docker="sudo docker "
# make
alias m="make -s "

# nodejs
alias n="node . "

# python
alias rp="python3 main.py "

alias tok="cat ~/data/token "

# git
alias gpu="git push"
alias gpl="git pull"
alias gf="git fetch"
alias gc="git commit"
alias gm="git merge"
alias ga="git add"

alias ..="z .. "

alias rf="rm -rf "

alias dr="dotnet run "
alias dn="dotnet new "

#alias vim=  lvim 

alias ctp="cp /home/ahmed/Templates/c-temp "
alias cptp="cp /home/ahmed/Templates/cpp-temp "

alias ls='ls --color=auto'
alias ll="ls -l "
alias lla="ls -la "
alias grep="grep --color= auto "
alias cat="bat "
alias c="clear "
alias manim="python -m manimlib --uhd -w -c black --video_dir ~/code/manim 	"
alias t="tldr "
alias pl="pdflatex "
alias ip="ip -c "
 
#______________________________________________________

bindkey -v
#______________________________________________________

PROMPT='%F{blue}%1/%F{green}  '
#❯
#______________________________________________________

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

#______________________________________________________


function ranger-cd {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}


 bindkey -s '^o' 'ranger-cd\n'
#______________________________________________________



# plugins
source ~/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#______________________________________________________


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#

# conda config --set auto_activate_base false

__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# <<< conda initialize <<<


# -----------------------------------> ZOXIDE <---------------------------------  
