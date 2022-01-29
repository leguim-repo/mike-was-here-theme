local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='💀'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
    local user_symbol='🔰'
fi

# for disable typical prompy of (venv)
export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtualenv_prompt_info(){
[[ -n ${VIRTUAL_ENV} ]] || return
echo "${ZSH_THEME_VIRTUALENV_PREFIX:=🧪}"
}

function get_platform(){
case "$OSTYPE" in
  solaris*) echo "🌞" ;;
  darwin*)  echo "🍏" ;; 
  linux*)   echo "🐧" ;;
  bsd*)     echo "🍎" ;;
  msys*)    echo "🦠" ;;
  cygwin*)  echo "🥦" ;;
  *)        echo "🎲" ;;
esac
}

local current_dir='%{$terminfo[bold]$FG[135]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local cpu='$(get_platform)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

local clock='%{$terminfo[bold]$fg[blue]%}%D{[%X]} %{$reset_color%}'

PROMPT="${FG[129]}╭─|%{$reset_color%}${user_host}${clock}${current_dir}${git_branch}
${FG[129]}╰─|${venv_prompt}%{$reset_color%}${FG[220]}%B ${user_symbol}%b${FG[129]} ${cpu} ├─➤%{$reset_color%} "
RPROMPT="%B${return_code}%b"

# ❌ ✘
# ✅ ✔
# ⌬ ⎔ 🕉🧪

ZSH_THEME_GIT_PROMPT_PREFIX="${FG[220]}(%{$reset_color%} ${FG[207]}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b${FG[220]})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$reset_color%}${FG[160]}❌%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$reset_color%}${FG[082]}✅%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="${FG[082]}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${FG[166]}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="${FG[160]}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="${FG[220]}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${FG[082]}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${FG[190]}✭%{$reset_color%}"



#ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
#ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX


