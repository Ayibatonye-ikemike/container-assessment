#!/bin/bash
echo "Deleting MuchTodo Kubernetes cluster..."
sudo kind delete cluster --name muchtodo-cluster
