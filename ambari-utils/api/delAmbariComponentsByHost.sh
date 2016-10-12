#!/bin/bash
check_usage() {
  if [ $# -lt 2 ]
  then
    echo "Usage:"
    echo "$0  <FQHN> <COMPONENT>"
    exit 1
  fi
}

check_usage $*
BASE_DIR=$(dirname $0)
source $BASE_DIR/setenv.sh
curl -k -u $AMBARI_ADMIN:$AMBARI_PASS -H "X-Requested-By: ambari" -i -X DELETE https://localhost:$AMBARI_PORT/api/v1/clusters/${AMBARI_CLUSER}/hosts/${1}/host_components/${2} 
