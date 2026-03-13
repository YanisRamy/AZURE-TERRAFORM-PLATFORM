# Azure Terraform Platform - Cloud Infrastructure with ArgoCD & Grafana

![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC)
![Azure](https://img.shields.io/badge/Cloud-Azure-0078D4)
![Kubernetes](https://img.shields.io/badge/Orchestration-Kubernetes-326CE5)
![ArgoCD](https://img.shields.io/badge/GitOps-ArgoCD-EF7B4D)
![Grafana](https://img.shields.io/badge/Monitoring-Grafana-F46800)
![Prometheus](https://img.shields.io/badge/Metrics-Prometheus-E6522C)

## Overview

A complete cloud infrastructure platform deployed on Microsoft Azure using Terraform modules, GitOps with ArgoCD and full observability with Prometheus and Grafana.

This project demonstrates professional-grade Infrastructure as Code practices using HCL, GitOps deployment workflows and real-time Kubernetes monitoring.

---

## Architecture Diagram

![Architecture Diagram](screenshots/terraform-platform-diagram.svg)

---

## Infrastructure

- **Resource Group** : rg-terraform-platform-dev
- **Virtual Network** : vnet-tfplatform-dev (10.0.0.0/8)
- **AKS Subnet** : 10.240.0.0/16
- **AKS Cluster** : aks-tfplatform-dev (2 nodes, Standard_B2s_v2)
- **ACR** : acrtfplatformdev.azurecr.io

---

## Screenshots

### Terraform Plan - 6 resources to create
![Terraform Plan](screenshots/01-terraform-plan.png)

### Terraform Apply - Infrastructure created successfully
![Terraform Apply](screenshots/02-terraform-apply.png)

### AKS Nodes - 2 nodes Ready
![kubectl nodes](screenshots/03-kubectl-nodes.png)

### ArgoCD Pods - All Running
![ArgoCD Pods](screenshots/04-argocd-pods.png)

### ArgoCD - Connected
![ArgoCD Connected](screenshots/05-argocd-connected.png)

### ArgoCD - App Healthy and Synced
![ArgoCD Healthy](screenshots/06-argocd-healthy.png)

### Grafana - Home Dashboard
![Grafana Home](screenshots/07-grafana-home.png)

### Grafana - Kubernetes Metrics Dashboard
![Grafana Dashboard](screenshots/08-grafana-dashboard.png)

---

## Tech Stack

| Component | Technology |
|-----------|-----------|
| IaC | Terraform 1.14+ with HCL modules |
| Cloud | Microsoft Azure |
| Container Orchestration | Kubernetes (AKS) |
| Container Registry | Azure Container Registry (ACR) |
| GitOps | ArgoCD v3.3.3 |
| Metrics | Prometheus (kube-prometheus-stack) |
| Dashboards | Grafana |
| Package Manager | Helm v3 |
| Networking | Azure VNet + Subnets |

---

## Project Structure
```
AZURE-TERRAFORM-PLATFORM/
├── terraform/
│   ├── modules/
│   │   ├── network/        # VNet and Subnets
│   │   ├── aks/            # Kubernetes Cluster
│   │   └── acr/            # Container Registry
│   └── environments/
│       └── dev/            # Dev environment config
├── argocd/
│   └── todo-app.yml        # ArgoCD Application manifest
├── apps/
│   └── todo-app/
│       ├── deployment.yml
│       └── service.yml
├── screenshots/
└── README.md
```

---

## Getting Started

### Prerequisites

- Azure CLI + active subscription
- Terraform 1.14+
- kubectl
- Helm v3

### 1. Clone the repo
```bash
git clone https://github.com/YanisRamy/AZURE-TERRAFORM-PLATFORM.git
cd AZURE-TERRAFORM-PLATFORM
```

### 2. Deploy infrastructure with Terraform
```bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

### 3. Connect kubectl to AKS
```bash
az aks get-credentials --resource-group rg-terraform-platform-dev --name aks-tfplatform-dev
kubectl get nodes
```

### 4. Install ArgoCD
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

### 5. Deploy app via GitOps
```bash
kubectl apply -f argocd/todo-app.yml
```

### 6. Install Prometheus + Grafana
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
```

---

## Infrastructure Summary

| Resource | Name | Status |
|----------|------|--------|
| Resource Group | rg-terraform-platform-dev | Created |
| Virtual Network | vnet-tfplatform-dev | Created |
| AKS Cluster | aks-tfplatform-dev | Running |
| ACR | acrtfplatformdev.azurecr.io | Created |
| ArgoCD | argocd namespace | Healthy |
| Prometheus | monitoring namespace | Running |
| Grafana | monitoring namespace | Running |
