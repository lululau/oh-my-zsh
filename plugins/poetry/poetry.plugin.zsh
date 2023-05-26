# Return immediately if poetry is not found
if (( ! $+commands[poetry] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `poetry`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_poetry" ]]; then
  typeset -g -A _comps
  autoload -Uz _poetry
  _comps[poetry]=_poetry
fi

function poe() {
  if [ "$1" = "active" -o "$1" = "a" -o "$1" = use ]; then
    source $(poetry env info --path)/bin/activate
  elif [ "$1" = "deactive" -o "$1" = "d" -o "$1" = unuse ]; then
    deactivate
  else
    poetry "$@"
  fi
}

function poea() {
  poe active
}

if [[ ! -f "$ZSH_CACHE_DIR/completions/_poe" ]]; then
  typeset -g -A _comps
  autoload -Uz _poe
  _comps[poe]=_poe
fi

poetry completions zsh >| "$ZSH_CACHE_DIR/completions/_poetry" &|
