#!/bin/bash
set -o errexit

BASEDIR=$(dirname "$0")
echo "${BASEDIR}"


# desired cluster name; default is "k3d-default"
K3D_CLUSTER_NAME="${K3D_CLUSTER_NAME:-k3d-default}"

startme(){
  k3d cluster create ${K3D_CLUSTER_NAME} --config ${BASEDIR}/../config/k3d-default.yaml
}

stopme(){
  k3d cluster delete ${K3D_CLUSTER_NAME}
}

case "$1" in
  start)      startme ;;
  stop)       stopme ;;

  *) echo "usage: $0 start | stop " >&2
    exit 1
    ;;
esac
