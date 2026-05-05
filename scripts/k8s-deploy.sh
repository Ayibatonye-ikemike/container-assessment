#!/bin/bash
set -e

echo "Building the Docker image..."
sudo docker build -t muchtodo-backend:latest .

echo "Creating Kind cluster..."
sudo kind create cluster --name muchtodo-cluster

echo "Loading image into Kind..."
sudo kind load docker-image muchtodo-backend:latest --name muchtodo-cluster

echo "Applying Kubernetes manifests..."
sudo kubectl apply -f kubernetes/namespace.yaml
sudo kubectl apply -f kubernetes/mongodb/
sudo kubectl apply -f kubernetes/backend/

echo "Waiting for pods to be ready..."
sudo kubectl wait --for=condition=ready pod -l app=backend -n muchtodo-ns --timeout=90s

echo "Deployment complete! Verify with: kubectl port-forward service/backend-service 8080:8080 -n muchtodo-ns"
