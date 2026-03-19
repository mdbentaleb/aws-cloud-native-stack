# ☁️ AWS Cloud-Native Automated Stack

### **Architecting Scalable Infrastructure with Nginx, Docker & AWS**

## 📌 Project Overview

This project demonstrates a professional **DevOps workflow** by deploying a containerized Flask application behind an Nginx Reverse Proxy on **AWS EC2**. The core focus is on **Security** and **Automation**, utilizing AWS-native features for configuration management.

## 🏗️ Architecture & Features

  * **Reverse Proxy:** Nginx handles incoming traffic on port 80 and routes it to the application.
  * **Containerization:** Multi-container setup managed by **Docker Compose**.
  * **Security (IAM Roles):** Zero-credential architecture. The EC2 instance uses an **IAM Role** to securely fetch configurations from S3, avoiding hardcoded Access Keys.
  * **Config Management:** S3 acts as a centralized store for production-ready Nginx configurations.
  * **Automated Provisioning:** A custom Bash script (`setup.sh`) handles the entire environment setup, from installing dependencies to pulling cloud configs.

## 📂 Repository Structure

```text
.
├── app/                   # Flask Web Application
│   ├── app.py             # Main Logic
│   └── Dockerfile         # Optimized Python Image
├── nginx/                 # Proxy Configuration
│   └── default.conf       # Custom Nginx Rules
├── scripts/               # DevOps Automation
│   └── setup.sh           # One-click Cloud Provisioning
└── docker-compose.yml     # Container Orchestration
```

## 🚀 How it Works (The DevOps Flow)

1.  **Infrastructure:** EC2 instance is launched with a specific IAM Policy (`AmazonS3ReadOnlyAccess`).
2.  **Automation:** The `setup.sh` script installs Docker and AWS CLI.
3.  **Cloud Sync:** The script pulls the `default.conf` from a private **S3 Bucket** (verifying the IAM Role identity).
4.  **Deployment:** Docker Compose builds the images and starts the services in a private network.

