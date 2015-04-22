function _alibas_completion() {
  compadd -U -2 -V _ web1 admin@web1 web2 admin@web2 web3 admin@web3
  ret=0
}
compdef _alibas_completion alibas
