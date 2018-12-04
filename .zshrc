# Path to your oh-my-zsh installation.
  export ZSH=/home/philipp/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="locutus"

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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# nvm
source ~/.nvm/nvm.sh

# z jumper
. /home/philipp/.z-source/z.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias saucec="/opt/sauce-connect/bin/sc -u philipp-sgalinski -k 7c238ef5-2fcb-4852-8ecd-32de80e6deed"
alias dfssh="ssh -p 24 sgalinski@80.67.16.114"
alias sossh="ssh -A ssh-484257-13084@itnetworks.softing.com"
alias pulldfdump="scp -P 24 sgalinski@80.67.16.114:/usr/local/domainfactory/frontend/dump-live.sql ."
alias pushdfdump="scp dump-live.sql deploy@deploy.sgalinski.de:domainfactory"
alias sgdeploy="ssh deploy@deploy.sgalinski.de"
alias upsatis="ssh root@gitlab.sgalinski.de /var/www/satis/buildSatis.sh"
alias sgssh="ssh root@sgalinski.de"
alias elessh="ssh -A ubuntu@18.196.177.210"
alias piassh="ssh -A u91029413@home707014798.1and1-data.host"
alias sysup="sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y"
alias dissh="ssh -A ssh-361329-5069119@134.119.225.202"
alias thssh="ssh -A deploy-vhosts@18.196.177.210"
alias ftssh="ssh -A p348529@p348529.mittwaldserver.info"
alias ftussh="ssh -A p400909@31.220.126.66"
alias jbssh="ssh -A jb-dev-01@dyncom.de"
alias vup="vagrant up"

autoload bashcompinit
bashcompinit
. /etc/bash_completion.d/sgc

#if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#	source /etc/profile.d/vte.sh
#fi

SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors
bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)

if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|konsole$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
fpath=($fpath "/home/philipp/.zfunctions")

