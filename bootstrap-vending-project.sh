#!/bin/bash

set -eo pipefail

gcloud projects create --no-enable-cloud-apis --name=$1 --organization=$2 --set-as-default --labels=type=project-vending
gcloud services enable deploymentmanager.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable servicemanagement.googleapis.com

PROJECT_NUM=$(gcloud projects list | grep ${1} | awk '{print $3}')
echo "${PROJECT_NUM}@cloudservices.gserviceaccount.com"
