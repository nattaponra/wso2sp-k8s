#!/bin/bash


KUBERNETES_CLIENT=`which kubectl`


echo 'deploying config maps ...'
${KUBERNETES_CLIENT} create configmap sp-manager-bin --from-file=confs/manager/bin/
${KUBERNETES_CLIENT} create configmap sp-manager-conf --from-file=confs/manager/conf/

echo 'deploying Stream Processor manager profile and services...'
${KUBERNETES_CLIENT} apply -f manager.yaml