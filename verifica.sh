#!/bin/bash
cat /etc/hosts | while read ip name rest
do
  if [ -z "$ip" ]; then
    continue
  fi
  case "$ip" in
    \#*) continue ;;
  esac
  nslookup "$name" 8.8.8.8 | grep "$ip" > /dev/null
  if [ "$?" -ne 0 ]; then
    echo "Bogus IP for $name in /etc/hosts!"
  fi
done
exit 0
