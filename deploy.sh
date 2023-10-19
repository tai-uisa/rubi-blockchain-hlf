#!/usr/bin/env bash

kubectl apply -f k8s/namespaces
kubectl apply -f k8s/secrets/uisa.rubi.dev.br
kubectl apply -f k8s/secrets/assovale.rubi.dev.br
kubectl apply -f k8s/storage/pv
kubectl apply -f k8s/storage/pvc
kubectl apply -f k8s/job
kubectl wait --timeout=120s --for=condition=complete --namespace rubi-dev-br job.batch/setup
kubectl delete -f k8s/job
kubectl apply -k k8s
kubectl wait --timeout=180s --for=condition=Ready --namespace rubi-dev-br pods --all
