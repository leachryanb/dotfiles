if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

[[ -s "/Users/rleach/.rvm/scripts/rvm" ]] && source "/Users/rleach/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

__h_old_ps1=$PS1

__h_git_prompt()
{
  local branch=`git branch 2>/dev/null|grep -e '*'|sed -e 's/^* //'`

  if [ "$branch" ]
  then
    local git_dir=$(git rev-parse --git-dir)

    if [ $git_dir = .git ]
    then
      git_dir=$PWD
    else
      git_dir=$(dirname $git_dir)
    fi

    local repo_name=$(basename $git_dir)
    local repo_dir="${PWD:$((${#git_dir} + 1))}"

    PS1="\\[\\e[0;32m\\]$repo_name \\[\\e[0;36m\\]$branch\\[\\e[0m\\] $repo_dir\\\$ "
  else
    PS1="$__h_old_ps1"
  fi
}

PROMPT_COMMAND=__h_git_prompt

ulimit -n 2048

export PATH=/opt/subversion/bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH
export EDITOR='subl -w'



alias ep='cd ~/EP'
alias buzz='cd ~/EP/buzz'
alias notes='cd ~/dailies'
alias pub='cd ~/leachryanb.github.com'
alias editbash='subl ~/.bash_profile'
alias ll='ls -l'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m '
alias gcam='git commit -am '
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git merge'
alias gfa='git fetch --all'
