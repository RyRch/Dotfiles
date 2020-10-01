#!/bin/bash
blih -u reda.rouich@epitech.eu repository create "$1"
blih -u reda.rouich@epitech.eu repository setacl "$1" ramassage-tek r
blih -u reda.rouich@epitech.eu repository getacl "$1"
git clone git@git.epitech.eu:/reda.rouich@epitech.eu/$1
