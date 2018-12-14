#!/bin/bash

FILE_NAME='/vagrant/servers'

if [[ ! -e ${FILE_NAME} ]]; then
	echo "cannot open file : ${FILE_NAME}"	>&2 
	exit 1
fi

for SERVER in $(cat ${FILE_NAME})
do
    echo "pinging ${SERVER}..." &> /dev/null
    ping -c 1 ${SERVER} &> /dev/null
    if [[ "${?}" -ne 0  ]]
    then
	echo "${SERVER} down"
    else
	echo "${SERVER} up"
    fi
done
