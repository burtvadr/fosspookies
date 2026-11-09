# SPDX-License-Identifier: 0BSD
# shared helpers for bin/ scripts (POSIX sh)

# rows of the LOD0 table in recipes/core-recipe-v0.1.md, as "Name NN%"
formula() {
  awk -F'|' '
    NF == 4 && $3 ~ /%[ \t]*$/ && $2 !~ /Ingredient/ && $0 !~ /Total/ {
      name = $2; pct = $3
      gsub(/^[ \t]+|[ \t]+$/, "", name)
      gsub(/[^0-9.]/, "", pct)
      if (name != "" && pct != "") print name " " pct
    }' "$1"
}

isnum() {
  case ${1:-} in
    '' | *[!0-9.]*) return 1 ;;
    *) return 0 ;;
  esac
}

# ask <prompt> <default> - prompt on stderr, reply on stdout
ask() {
  printf '%s' "$1" >&2
  REPLY=''
  read -r REPLY || REPLY=''
  REPLY=${REPLY:-$2}
}
