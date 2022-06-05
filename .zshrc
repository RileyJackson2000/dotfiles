# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/riley/.oh-my-zsh"

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
plugins=(git colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration


# Updating PATH
PATH="/home/riley/.config/coc/extensions/coc-clangd-data/install/13.0.0/clangd_13.0.0/bin:/home/riley/Clones/llvm-project/build/bin:/home/riley/go/bin:/usr/local/go/bin:/home/riley/.cargo/bin:/usr/local/texlive/2020/bin/x86_64-linux:/usr/local/MATLAB/R2020b/bin:$PATH"

# latex PATH info

export MANPATH="/usr/local/texlive/2020/texmf-dist/doc/man:/usr/local/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH"
export GOPATH="/home/riley/go"
export GOROOT="/usr/local/go"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] &&  [ -s "$BASE16_SHELL/profile_helper.sh" ] &&  eval "$("$BASE16_SHELL/profile_helper.sh")"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export Projects=/home/riley/Projects
export School=/home/riley/Waterloo
export Work=/home/riley/Work

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

alias v=nvim
alias web="aws s3 sync /home/riley/rjackson2000.com s3://rjackson2000.com"
alias psudo='sudo env PATH="$PATH"'
alias ff='fzf -q ""'
alias t=tmux
alias g=gdb
alias p='python3.8'
alias sl=ls

# zsh-bd
. $HOME/.zsh/plugins/bd/bd.zsh

# dotfiles bare repo
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# fzf stuff
source /usr/share/doc/fzf/examples/completion.zsh #fixes ** completion

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# Shell init stuff

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

neofetch --logo --ascii_distro ubuntu_small
# awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
#     s="/\\";
#     for (colnum = 0; colnum<term_cols; colnum++) {
#         r = 255-(colnum*255/term_cols);
#         g = (colnum*510/term_cols);
#         b = (colnum*255/term_cols);
#         if (g>255) g = 510-g;
#         printf "\033[48;2;%d;%d;%dm", r,g,b;
#         printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
#         printf "%s\033[0m", substr(s,colnum%2+1,1);
#     }
#     printf "\n";
# }'
exa

PATH="/home/riley/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/riley/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/riley/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/riley/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/riley/perl5"; export PERL_MM_OPT;
