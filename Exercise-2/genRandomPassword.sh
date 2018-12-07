#!/bin/bash

#This script describes different ways of genrating random password

#Genrate random password using : RANDOM
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

#Genrate random password using : 3 RANDOMS no.s
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

#Genrate random password using : date (seconds)
PASSWORD=$(date +%s)
echo "${PASSWORD}"

#Genrate random password using : date (nano-seconds)
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

#Genrate random password using : sha1sum/sha256sum + head
PASSWORD=$(date +%sN | sha256sum | head -c 32)
echo "${PASSWORD}"

#Genrate random password using : sha256sum + special ch. + fold + shuf
SPECIAL_CHARACTER=$(echo "!@#$%^&*()_-+=" | fold -w1 | shuf | head -c 1)
PASSWORD1=$(date +%sN | sha256sum | head -c 32)
PASSWORD="${PASSWORD1}${SPECIAL_CHARACTER}"
echo "${PASSWORD}"
