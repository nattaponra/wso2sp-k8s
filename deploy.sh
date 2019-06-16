#!/bin/bash


KUBERNETES_CLIENT=`which kubectl`

echo 'create volume'
${KUBERNETES_CLIENT} apply -f volume/

echo 'deploying config maps ...'
${KUBERNETES_CLIENT} create configmap sp-manager-bin --from-file=configs/manager/bin/
${KUBERNETES_CLIENT} create configmap sp-manager-conf --from-file=configs/manager/conf/
${KUBERNETES_CLIENT} create configmap sp-worker-bin --from-file=configs/worker/bin/
${KUBERNETES_CLIENT} create configmap sp-worker-conf --from-file=configs/worker/conf/
${KUBERNETES_CLIENT} create configmap mysql-dbscripts --from-file=configs/dbms/

echo 'deploying Stream Processor manager profile and services...'
${KUBERNETES_CLIENT} apply -f dbms.yaml
${KUBERNETES_CLIENT} apply -f manager.yaml
${KUBERNETES_CLIENT} apply -f worker.yaml
${KUBERNETES_CLIENT} apply -f receiver.yaml
${KUBERNETES_CLIENT} apply -f dashboard.yaml