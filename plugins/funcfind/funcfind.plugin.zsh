function funcfind() {
  for i in "${fpath[@]}"
  do
      [ -e "$i" ] && find "$i" -name "$1"
  done
}
