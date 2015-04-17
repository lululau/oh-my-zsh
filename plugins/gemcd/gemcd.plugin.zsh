function gemcd() {
  cd "$(rvm gemdir)/gems/$1"
}

function _gemcd_completion() {
  _values _ $(ls "$(rvm gemdir)/gems")
  ret=0
}

compdef _gemcd_completion gemcd

