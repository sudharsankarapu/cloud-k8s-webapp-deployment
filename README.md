Overview
This project demonstrates the deployment of a simple static web application on a Kubernetes cluster. The deployment is designed for environments managed locally using Minikube, making it ideal for development and testing scenarios. The infrastructure includes proper monitoring with Prometheus, and the application is accessible as a Kubernetes service.

The deployment process has already been completed, and this guide provides the necessary steps for others to follow and replicate the deployment.
Repository Contents
File/Directory	Description
app.js	JavaScript file for the web application.
index.html	Static HTML page for the application.
main.tf	Terraform configuration for provisioning cloud infrastructure.
prometheus-configmap.yaml	Kubernetes ConfigMap for Prometheus monitoring configuration.
prometheus-deployment.yaml	Kubernetes Deployment manifest for Prometheus.
simple-web-app-deployment.yaml	Kubernetes Deployment manifest for the web application.
simple-web-app-service.yaml	Kubernetes Service manifest to expose the web application.

Steps to Deploy
1. Prerequisites
Ensure the following tools and accounts are available:
Cloud Provider Account: AWS, GCP, or Azure.
kubectl CLI: Configured to interact with your Kubernetes cluster.
Kubernetes Cluster: A functioning cluster where the application will be deployed.

2. Clone the Repository
Clone this repository to your local system to access the necessary configuration files:
git clone https://github.com/your-username/cloud-k8s-webapp-deployment.git
cd cloud-k8s-webapp-deployment

3. Deploy the Web Application
Apply the Kubernetes manifests to deploy the web application:
kubectl apply -f simple-web-app-deployment.yaml
kubectl apply -f simple-web-app-service.yaml

5. Verify that the pods and services are running:
kubectl get pods
kubectl get svc
Note the EXTERNAL-IP of the service, which will allow you to access the web application in a browser.

6. Configure Monitoring with Prometheus
Deploy Prometheus using the provided manifests:
kubectl apply -f prometheus-configmap.yaml
kubectl apply -f prometheus-deployment.yaml

7. Verify Prometheus is running:
kubectl get pods
kubectl get svc
Access Prometheus by retrieving its service's EXTERNAL-IP.

8. Access the Application
Open your web browser and navigate to the EXTERNAL-IP of the web application's service.
Post-Deployment Monitoring
Use Prometheus to monitor application health and Kubernetes cluster metrics.
Optionally integrate Grafana for visualization.
Future Enhancements
Automate infrastructure provisioning using Terraform (main.tf).
Add CI/CD pipelines for automated deployment and updates.
