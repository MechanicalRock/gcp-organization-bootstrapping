# GCP Organisation Bootstrapping

## Purpose

When setting up a new GCP environment, we want to build on solid foundations.

## Outcomes This Repo

1. A project that's sole purpose is to provide future project vending, (real chicken and the egg problem here)

## Setup

### Assumptions

1. You have a GCP Organisation currently set up
2. You are currently authenticated via GCloud to a user with sufficient permissions:
   1. Organisation Admin
   2. Project Creator
   3. Billing Account User

### Deploy

1. Decide on a name for the vending project, (`<project-name>`)
2. Have the organisation ID handy: `gcloud organizations list`, (`<organisation-id>`)
3. Run `./bootstrap-vending-project.sh <project-name> <organisation-id>`
4. Copy the last line from the output, should look like `295264075638@cloudservices.gserviceaccount.com`
5. Open the Google Cloud console, and add an IAM Member at the organisation level using the copied console output
6. Give the IAM Member `Project Creator` and `Billing Account User` roles
7. Copy `config.yaml` and edit it to suit your needs
8. Run `gcloud deployment-manager deployments update <deployment-name> --config <path-to-config-yaml>`
