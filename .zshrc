# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# for nvim terminal
ZSH_DISABLE_COMPFIZ="true"

# Path to your oh-my-zsh installation.
export ZSH="/home/rr/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"


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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions colored-man-pages)

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

# vim mode
# bindkey -v

LC_ALL="en_US.UTF-8"

alias ..="cd .."
alias ...="cd ../../"
alias cdd="cd ~/Documents"
alias cdm="cd ~/Medias/"
alias cdp="cd ~/Pictures/"
alias cds="cd ~/Documents/Projects/Dotfiles/Suckless/"
alias cde="cd ~/Documents/Epitech/"
alias nv="nvim"
alias ls="lsd --group-dirs first"
alias tree="lsd --tree"
alias us="setxkbmap us"
alias fr="setxkbmap fr"
alias nez="ruby ~/Programs/CliProg/NormEZ/NormEZ.rb"
alias sec="cd .Others"
alias cdn="cd ~/Documents/Notes/"
alias ydl="youtube-dl"
alias pvp="protonvpn"
alias cdo="cd ~/Downloads/"
alias tb="taskbook"
alias nv="sudo -E nvim"
alias cda="cd ~/Medias/Audios/Songs"

if [ "$TERM" = "linux" ]; then
    alias startx="startx >/dev/null 2>&1"
    alias ls="lsd --icon never"
    alias tree="tree"
    echo -en "\e]P0282828" #black
    echo -en "\e]P8282828" #darkgrey
    echo -en "\e]P1cc241d" #darkred
    echo -en "\e]P9cc241d" #red
    echo -en "\e]P298971a" #darkgreen
    echo -en "\e]PA98971a" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBd79921" #yellow
    echo -en "\e]P4548588" #darkblue
    echo -en "\e]PC458588" #blue
    echo -en "\e]P5458588" #darkmagenta
    echo -en "\e]PDb16286" #magenta
    echo -en "\e]P6689d6a" #darkcyan
    echo -en "\e]PE689d6a" #cyan
    echo -en "\e]P7a89984" #lightgrey
    echo -en "\e]PFa89984" #white
    clear #for background artifacting
fi
