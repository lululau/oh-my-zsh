function gemcd() {
  cd "$GEM_HOME/gems/$1"
}

function _gemcd_completion() {
  _values _ $(ls "$GEM_HOME/gems")
  ret=0
}

compdef _gemcd_completion gemcd

