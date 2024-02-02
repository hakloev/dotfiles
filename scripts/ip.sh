#!/usr/bin/env bash

kind=${1:-internal}

ACTIVE_INTERFACE=$(route get 0.0.0.0 2>/dev/null | awk '/interface: /{print $2}')
LOCAL_IP=$(ifconfig -r $ACTIVE_INTERFACE | awk '/inet /{print $2}')

case $kind in
  internal)
    echo $LOCAL_IP
  ;;
  external)
    PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
    echo $PUBLIC_IP
  ;;
esac
