## this file contain the script both bash and zsh needed

if command -v lsd > /dev/null 2>&1; then
  alias ls="lsd"
  alias ll='lsd -l'
  alias la='lsd -a'
else
  alias ls="ls --color=auto"
  alias ll='ls -l'
  alias la='ls -a'
fi
command -v z > /dev/null 2>&1 && alias cd="z"
command -v fuck > /dev/null 2>&1 && eval $(thefuck --alias)
alias grep='grep --colour=auto'
alias egrep='grep -E --colour=auto'
alias fgrep='grep -F --colour=auto'
alias cp="cp -i" # confirm before overwriting something
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB
alias c='clear'
alias lneofetch='neofetch | lolcat'
alias vi=vim
alias more=less
alias journalclean='sudo journalctl --vacuum-size=50M'

#alias cat='bat -P'
#alias bat='bat -P'

# miniconda3
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh && export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## set environment variable
export EDITOR=vim
command -v nvim > /dev/null 2>&1 && export EDITOR=nvim

[[ -r $HOME/.alias_desktop.sh ]] && source $HOME/.alias_desktop.sh
