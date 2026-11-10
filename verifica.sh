#!/bin/bash
verifica() {
  nslookup "$1" "$3" | grep "$2" > /dev/null
  if [ "$?" -ne 0 ]; then
    echo "Bogus IP for $1 in /etc/hosts!"
  fi
}

cat /etc/hosts | while read ip name rest
do
  if [ -z "$ip" ]; then
    continue
  fi
  case "$ip" in
    \#*) continue ;;
  esac
  verifica "$name" "$ip" 8.8.8.8
done
exit 0

#salut
echo "razvan a fost aici"
