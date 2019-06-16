#!/bin/bash


KUBERNETES_CLIENT=`which kubectl`

echo 'create volume'
${KUBERNETES_CLIENT} apply -f volume/

echo 'deploying config maps ...'
${KUBERNETES_CLIENT} create configmap sp-manager-bin --from-file=configs/manager/bin/
${KUBERNETES_CLIENT} create configmap sp-manager-conf --from-file=configs/manager/conf/

echo 'deploying Stream Processor manager profile and services...'
${KUBERNETES_CLIENT} apply -f manager.yaml




