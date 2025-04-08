#!/usr/bin/env bash
export $(grep -v '^#' .env | xargs)

# avoid nginx var replacement
export host="\$host"
export remote_addr="\$remote_addr"

docker compose build

envsubst < k8s-config.yaml | kubectl apply -f -

sleep 10
kubectl get service
kubectl get pod

# kubectl exec -it app-7cc99dff94-kwpgq
# kubectl describe pod app-7cc99dff94-kwpgq
# kubectl logs -f app-7cc99dff94-kwpgq postgres-7c549b8bc7-6g6lj