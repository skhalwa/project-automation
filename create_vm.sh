#!/bin/bash

# Create a snapshot
snapshot_name="vm-vmss-snapshot"
resource_group="shubh-resources"
vm_name="shubh-vm"
snapshot_sku="Standard_LRS"

az vm disk create \
  --name "$snapshot_name" \
  --resource-group "$resource_group" \
  --vm-name "$vm_name" \
  --sku "$snapshot_sku"

# Create an image from the snapshot
image_name="example-image"
image_resource_group="shubh-resources"
image_location="uk south"
image_sku="Standard_LRS"

az image create \
  --name "$image_name" \
  --resource-group "$image_resource_group" \
  --location "$image_location" \
  --source "$snapshot_name" \
  --sku "$image_sku"
