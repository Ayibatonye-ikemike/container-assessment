# MuchTodo Containerization & Kubernetes Modernization

This project involves the containerization and orchestration of the MuchTodo backend application as part of the Month 2 DevOps assessment.

## Project Overview
- **Application**: Golang-based API (MuchTodo).
- **Database**: MongoDB.
- **Infrastructure**: Local Kubernetes cluster using Kind.

## Key Features
- **Multi-stage Docker Build**: Optimized image size and security by running as a non-root `techuser`.
- **Kubernetes Orchestration**: Deployment manifests for high availability (2 replicas for backend).
- **Automation**: Custom shell scripts for cluster creation, deployment, and cleanup.

## How to Run

### 1. Prerequisites
Ensure you have Docker and Kind installed on your system.

### 2. Deployment
Run the automated deployment script:
```bash
sudo ./scripts/k8s-deploy.sh
```

### 3. Verification
Check the status of the resources:
```bash
kubectl get all -n muchtodo-ns
```

Test the API connectivity:
```bash
kubectl port-forward service/backend-service 8080:8080 -n muchtodo-ns
curl http://localhost:8080/health
```

## Evidence
Screenshots documenting successful deployment and database connectivity can be found in the `evidence/` directory.
