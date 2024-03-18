# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# 修改zcompdump生成的文件目录
source /etc/profile
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
 
# 记录历史命令的文件
HISTFILE=~/.history
# 内存中记录历史命令条数
HISTSIZE=10000
# 历史文件中保存的历史命令数
SAVEHIST=10000
# 不同的终端会话历史命令合并到同一历史文件
setopt appendhistory
 
# 在source $ZSH/oh-my-zsh.sh之前配置升级相关内容
# 始终回复否从不升级，可以通过 omz update 进行更新
DISABLE_AUTO_UPDATE=true
# 始终回复是并自动升级
#DISABLE_UPDATE_PROMPT=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
ZSH_THEME="bira"
#ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zsh-autosuggestions
plugins=(
        zsh-syntax-highlighting
        docker
        z
        colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#prompt_context(){}

# systemctl
alias syse='sudo systemctl enable --now'
alias sysd='sudo systemctl disable --now'
alias sysr='sudo systemctl restart'
alias syss='sudo systemctl status'
 
# tmux
alias tl='tmux ls'
alias tlw='tmux list-windows'
alias tlp='tmux list-panes'
alias tka='tmux kill-server'
alias tks='tmux kill-session'
alias ta='tmux a -t dev || tmux new -t dev'
 
# docker
alias dp='docker ps'
alias dr='docker restart'
alias dl='docker logs'  
alias dlf='docker logs -f'
alias dei='docker exec -it'
alias din='docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'
alias runlike='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock assaflavie/runlike -p'
# 清理相关
alias dsd='docker system df'
alias dcp='docker container prune'
alias dvp='docker volume prune'
alias dip='docker image prune'
alias dsp='docker system prune'
alias dspa='docker system prune -a'
 
# other
alias dh='du -h ./ -d 1' # 查看当前目录占用
alias psg='ps aux | grep' 
alias ng='netstat -autnp | grep'
alias wget='wget -c' # 支持断点续传
alias now='date "+%Y-%m-%d %H:%M:%S"' # 查看并格式化当前时间
alias size='f(){ du -sh $1* | sort -hr; }; f' # 查看文件/目录大小 - size /
alias sek='f(){ find / -name $1; }; f' # 在根目录查找文件 - sek test
alias sekc='f(){ find ./ -name $1; }; f' # 在当前目录查找文件 - sekc test
alias ipe='curl ipinfo.io/ip' #  查看当前公网ip
