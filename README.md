# CI-CD for counter-service
## Description
This repository contains configuration files for a CI-CD pipeline for a Flask application(counter-service).

## Repository Structure

```bash
.
├── Dockerfile
├── README.md
├── __pycache__
│   └── counter-service.cpython-310.pyc
├── counter-service.py
├── helm
│   ├── Chart.yaml
│   ├── charts
│   ├── templates
│   │   ├── NOTES.txt
│   │   ├── _helpers.tpl
│   │   ├── deployment.yaml
│   │   ├── hpa.yaml
│   │   ├── ingress.yaml
│   │   ├── service.yaml
│   │   ├── serviceaccount.yaml
│   │   └── tests
│   │       └── test-connection.yaml
│   └── values.yaml
└── requirements.txt
```

# Components

- [Counter-service app](#counter-service-app)
- [Dockerfile](#dockerfile)
- [Helm chart](#helm-chart)
- [Github Actions CI-CD workflow](#github-actions-ci-cd-workflow)


## Counter-service app
The file [counter-service.py](counter-service.py) listen in port 80 and including the logic of counting counts(GET and/or POST requests) and return them while accessing with HTTP GET request.

## Dockerfile

The file [Dockerfile](Dockerfile) is a Dockerfile that is used to build the image of the application. It uses the official [Python alphine 3.19 image](https://hub.docker.com/layers/library/python/alpine3.19/images/sha256-e82522145a995c3e85f873be18743f47de9d28ad8e017dad648bf6a4f47d908d?context=explore) as a base image and installs the necessary dependencies for the application(flask python package). It also copies the application code and define the application that will be running when running docker container from the builded image.

## Helm chart
The folder `helm` including the helm chart for deploying the `counter-service` flask application after eks is deployed successfully.

## Github Actions CI-CD workflow

The GitHub Actions CI-CD workflow is defined in the [.github/workflows/CI-CD.yaml](.github/workflows/CI-CD.yaml) file. This workflow is triggered on push events to the main branch and also allows for manual triggering using the workflow_dispatch event.

The workflow consists of the following stages:

- **Checkout**: The workflow checks out the code in the repository.
- **Build and Push Image**: The workflow builds the Docker image using the Dockerfile and pushes it to the Amazon Elastic Container Registry (ECR).
- **Deploy to EKS**: The workflow deploys the application to an Amazon Elastic Kubernetes Service (EKS) cluster using the Helm chart defined in the helm directory.

The workflow uses the following environment variables:

- **AWS_REGION**: The AWS region where the ECR repository and EKS cluster are located.
- **ECR_REPOSITORY**: The name of the ECR repository where the Docker image is pushed.
- **HELM_CHART_PATH**: The path to the Helm chart directory.
- **APP**: The name of the application being deployed.

The workflow also uses the aws and helm actions to interact with AWS and Kubernetes resources.








