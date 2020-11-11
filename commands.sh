#!/usr/bin/env bash

# Set subscription-id 
az account set -s nameOrsubscriptionID

# Create a resource group
az group create -l northeurope -n flaskProjectGroup

# Create a webapp in a specific region, a specific resource group, and the free pricing tiers  
az webapp up -l northeurope -n flask-ml-project -g flaskProjectGroup --sku F1
