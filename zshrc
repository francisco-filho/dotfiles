# history configuration
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# The following lines were added by compinstall
zstyle :compinstall filename '/home/francisco/.zshrc'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# spaceship
export SPACESHIP_PROMPT_SEPARATE_LINE=true
export SPACESHIP_CHAR_SYMBOL="› "
export SPACESHIP_VI_MODE_SHOW=false

autoload -U promptinit; promptinit
prompt spaceship

# keys
bindkey -e
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
# ctrl + dir
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# tmux
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# alias
export LS="lsd"
alias ls="$LS"
alias ll="$LS -alF"
alias la="$LS -A"
alias l="$LS -CF"
alias v='nvim'
alias vim='nvim'
alias pye='source $HOME/data-science/venv/bin/activate'
alias morfar='source $HOME/data-science/venv/bin/activate'
alias syu="sudo pacman -Syu"
alias ip="ip -c"
alias spyder="GTK_THEME=\"Adwaita\" spyder"
alias vmware="GTK_THEME=\"Adwaita\" vmware-view"
alias virsh="virsh --connect qemu:///system"
alias activate="source venv/bin/activate"

# path
export IBM_CLOUD_HOME=$HOME/bin/IBM_Cloud_CLI
export JAVA_HOME=/usr/lib/jvm/default
export MAVEN_HOME=$HOME/opt/apache-maven-3.8.4
export HADOOP_HOME=/opt/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export SPARK_HOME=$HOME/opt/spark
export EDITOR=nvim
export LUA_LSP_SERVER=/home/francisco/repos/lua-language-server

export PATH=$PATH:$HOME/bin:$MAVEN_HOME/bin:$IBM_CLOUD_HOME
export PATH=$PATH:$HADOOP_HOME/bin:$SPARK_HOME/bin
export PATH=$PATH:$LUA_LSP_SERVER/bin

#autostart
#neofetch

alias luamake=/home/francisco/repos/lua-language-server/3rd/luamake/luamake

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview-window up'
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
