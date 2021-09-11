#!/bin/bash

print_metric(){
  echo "# HELP $1 $2 "
  echo "# TYPE $1 $3"
  echo "$1 $4"
}

(curl -s https://www.preinscriptions.uninet.cm > /dev/null)
status=$?

if [ "$status" -eq 0 ];then
  check_site=1
else
  check_site=0
fi

print_metric "site_preinscriptions_check" "Check if preinscription's site is available" "gauge" "$check_site"
