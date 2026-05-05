# MuchTodo Containerization & Kubernetes Modernization

This repository contains the complete containerization and orchestration solution for the MuchTodo backend application, fulfilling the Month 2 DevOps assessment requirements.

## 🛠 Project Components
1. **Docker**: Multi-stage Dockerfile optimized for security and size.
2. **Docker Compose**: Local development environment with MongoDB and API.
3. **Kubernetes**: Full orchestration including Deployments, Services (NodePort), and Ingress.
4. **Automation**: Bash scripts for seamless environment management.

---

## 🚀 Deployment Instructions

### 1. Local Development (Docker Compose)
To run the application locally without Kubernetes:
```bash
sudo ./scripts/docker-run.sh
```
- **Access**: The API will be available at `http://localhost:8080

### 2. Kubernetes Deployment (Kind)
To deploy the full stack to a Kind cluster:
```bash
sudo ./scripts/k8s-deploy.sh
```
This script handles:
- Cluster creation.
- Namespace isolation (`muchtodo-ns`).
- Persistent storage for MongoDB.
- Backend deployment with 2 replicas.

### 3. Cleanup
To destroy the Kubernetes resources:
```bash
sudo ./scripts/k8s-cleanup.sh
```

---

## 📂 Repository Structure
- `evidence/`: Screenshots of successful builds and deployments.
- `kubernetes/`: YAML manifests for all K8s resources.
- `scripts/`: Automation utilities.
- `Dockerfile`: Optimized multi-stage build.

## ✅ Verification Evidence
The `evidence/` folder contains the following mandatory verification:
- **Docker build completion**.
- **Docker Compose status and health check**.
- **Kind cluster creation**.
- **Kubernetes pod, service, and ingress status**.
