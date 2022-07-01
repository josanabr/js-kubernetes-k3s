#!/usr/bin/env bash
#
# Funciones auxiliares para Bash
#
# Author: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2022-06-25
#
# Codigo del 'assert()' tomado de https://tldp.org/LDP/abs/html/debugging.html#ASSERT
#
assert() {
  E_PARAM_ERR=98
  E_ASSERT_FAILED=99


  if [ -z "$2" ]          #  Not enough parameters passed
  then                    #+ to assert() function.
    return $E_PARAM_ERR   #  No damage done.
  fi

  lineno=$2

  if [ ! $1 ] 
  then
    echo "Assertion failed:  \"$1\""
    echo "File \"$0\", line $lineno"    # Give name of file and line number.
    exit $E_ASSERT_FAILED
  # else
  #   return
  #   and continue executing the script.
  fi  
}
