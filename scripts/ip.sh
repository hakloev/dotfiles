#!/bin/sh

ACTIVE_INTERFACE=$(route get 0.0.0.0 2>/dev/null | awk '/interface: /{print $2}')
LOCAL_IP=$(ifconfig -r $ACTIVE_INTERFACE | awk '/inet /{print $2}')

PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

if [ -z "${PUBLIC_IP}" ] || [ "${LOCAL_IP}" == "${PUBLIC_IP}" ]; then
  echo "${LOCAL_IP}"
else
  echo "${LOCAL_IP}/${PUBLIC_IP}"
fi
