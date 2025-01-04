# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_MODE="awesome-patched"
POWERLEVEL9K_MODE="nerdfont-complete"


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
plugins=(git)

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

export TERMINAL="alacritty"
alias sudo='sudo '
alias nv='nvim'
alias na='nautilus . &'
alias raj='joshuto'
alias ra='ranger'
alias his='history'
alias ty='typora'
alias om='/home/zme/software/omniverse-launcher-linux.AppImage'
alias tm='tmux'
alias lg='lazygit'
alias blender='/opt/blender-4.1.1-linux-x64/blender'
alias py='python3'
alias python='python3'

alias cb='colcon build'
alias cbp='colcon build --packages-select'
alias sz='source ./install/setup.zsh'
# 启动通配符(*)
setopt nonomatch



alias po="export https_proxy=127.0.0.1:7897 && export http_proxy=127.0.0.1:7897 && export ftp_proxy=127.0.0.1:7897 && ALL_PROXY=127.0.0.1:7897"
alias pf="unset http_proxy https_proxy ftp_proxy ALL_PROXY"

# 指定X11服务器的UNIX域套接字文件的路径，通常在需要在X11环境中运行图形界面应用程序
XSOCK=/tmp/.X11-unix
# 允许所有用户访问X11服务
# xhost +
# xhost限制访问：限制可连接到X服务器的客户端。例如，可以使用以下命令只允许本地用户连接
# xhost +localhost



# git config --global http.proxy 'http://127.0.0.1:7890'
# git config --global https.proxy 'https://127.0.0.1:7890'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Allow deciding whether your shell should change to ranger’s directory on quit
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

source ~/.fzf.zsh
export PATH=$PATH:/usr/local/cuda-12.4/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.4/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.4/extras/CUPTI/lib64
export PATH="$PATH:/usr/local/llvm/bin"
# >>> fishros initialize >>>
source /opt/ros/foxy/setup.zsh
# <<< fishros initialize <<<

export PATH="/opt/Qt5.12.9/Tools/QtCreator/bin:$PATH"
export PATH="/opt/Qt5.12.9/5.12.9/gcc_64:$PATH"
export LD_LIBRARY_PATH="/opt/Qt5.12.9/5.12.9/gcc_64/lib:$LD_LIBRARY_PATH"


source ~/.bashrc

# # 3号机器
# export ROS_DOMAIN_ID=4
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE="fcitx"



# fnm
FNM_PATH="/home/zme/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/zme/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export PATH=$PATH:/usr/local/go/bin
