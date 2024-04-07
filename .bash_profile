# functions
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# evals
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(ssh-agent -s)" # https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
eval "$(pyenv init -)"
eval "$(pyenv init --path)"

# aliases
alias grep="ggrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,node_modules,__pycache__} --exclude=\*.swp"
alias vi=vim
alias python=python3
alias pip=pip3
alias venv='python -m venv .venv'
alias k=kubectl

# exports
export CLICOLOR=1
export LSCOLORS=Exgxbxfxcxegedabagacad
export PS1="[\A] \[\033[1;34m\]\w\[\033[0m\]\[\033[32m\]\$(parse_git_branch)\[\033[0m\] $ "
export HISTCONTROL=ignoreboth:erasedups

# HOME
#export JAVA_HOME=$HOMEBREW_PREFIX/Cellar/openjdk/20/
#export JAVA_HOME=/Users/thanakij/Library/Java/JavaVirtualMachines/corretto-11.0.19/Contents/Home/
#export ANDROID_HOME=~/Library/Android/sdk

# PATH
#export PATH=$ANDROID_HOME/platform-tools:$PATH
#export PATH=~/Library/Python/3.9/bin:$PATH
export PATH=$HOMEBREW_PREFIX/opt/curl/bin:$PATH
export PATH=$HOMEBREW_PREFIX/opt/libpq/bin:$PATH
export PATH=$HOMEBREW_PREFIX/opt/node@20/bin:$PATH
export PATH=$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH
export PATH=$HOMEBREW_PREFIX/opt/postgresql@15/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH
source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
. "$HOME/.cargo/env"

# LIBRARY_PATH, LD_LIBRARY_PATH
export C_INCLUDE_PATH=$HOMEBREW_PREFIX/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOMEBREW_PREFIX/include:$CPLUS_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOMEBREW_PREFIX/Cellar/glib/2.80.0_1/include/glib-2.0:$CPLUS_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOMEBREW_PREFIX/Cellar/glib/2.80.0_1/lib/glib-2.0/include:$CPLUS_INCLUDE_PATH
export LIBRARY_PATH=$HOMEBREW_PREFIX/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$HOMEBREW_PREFIX/lib:$LD_LIBRARY_PATH

# LDFLAGS, CPPFLAGS, PKG_CONFIG_PATH
export LDFLAGS=""
export CPPFLAGS=""
# brew info curl
LDFLAGS+=" -L$HOMEBREW_PREFIX/opt/curl/lib"
CPPFLAGS+=" -I$HOMEBREW_PREFIX/opt/curl/include"
# brew info libpq
LDFLAGS+=" -L$HOMEBREW_PREFIX/opt/libpq/lib"
CPPFLAGS+=" -I$HOMEBREW_PREFIX/opt/libpq/include"
export PKG_CONFIG_PATH=$HOMEBREW_PREFIX/opt/libpq/lib/pkgconfig:$PKG_CONFIG_PATH
# brew info node@20
LDFLAGS+=" -L$HOMEBREW_PREFIX/opt/node@20/lib"
CPPFLAGS+=" -I$HOMEBREW_PREFIX/opt/node@20/include"
# brew info openjdk
CPPFLAGS+=" -I$HOMEBREW_PREFIX/opt/openjdk/include"
# brew info postgresql@15
LDFLAGS+=" -L$HOMEBREW_PREFIX/opt/postgresql@15/lib"
CPPFLAGS+=" -I$HOMEBREW_PREFIX/opt/postgresql@15/include"
export PKG_CONFIG_PATH=$HOMEBREW_PREFIX/opt/postgresql@15/lib/pkgconfig:$PKG_CONFIG_PATH

# load .env
# - https://gist.github.com/mihow/9c7f559807069a03e302605691f85572#gistcomment-4298352
set -a; source .env; set +a

# completion
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
#[[ -r "$HOMEBREW_PREFIX/opt/docker-completion/etc/bash_completion.d/docker " ]] && . "$HOMEBREW_PREFIX/opt/docker-completion/etc/bash_completion.d/docker"
#source $HOMEBREW_PREFIX/etc/bash_completion.d/*
#source <(kubectl completion bash)
source <(ngrok completion)

# git
git config --global init.defaultBranch main
git config --global user.name "Thanakij Pechprasarn"
git config --global user.email pechpras@gmail.com
