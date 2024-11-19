Project Title
Cloud-based Kubernetes Deployment of a Simple Web Application

Overview
This project deploys a simple web application on a Kubernetes cluster using Terraform for infrastructure provisioning and Prometheus for monitoring. The application is a static page hosted alongside an app.js script.

Repository Contents
.terraform/: Terraform working directory (not committed).
.terraform.lock.hcl: Lock file for Terraform dependencies.
app.js: A simple JavaScript file for the web application.
index.html: The static web page for the application.
main.tf: Terraform configuration to provision the Kubernetes cluster.
prometheus-configmap.yaml: ConfigMap for Prometheus configuration.
prometheus-deployment.yaml: Deployment file for Prometheus monitoring.
simple-web-app-deployment.yaml: Kubernetes Deployment for the web application.
simple-web-app-service.yaml: Kubernetes Service for the web application.
