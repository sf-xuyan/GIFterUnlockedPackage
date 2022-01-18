#!/bin/bash
devHubName=DevHub
packageName=GIFter # GIFter could be found in sfdx-project.json
packageVersionName=GIFter@0.1.0-1 # 04txxx could be found in sfdx-project.json

echo "Before delete existing package in ${devHubName}"

# list all packages in the Dev Hub org
sfdx force:package:list -v ${devHubName}

# [delete unwanted packages](https://help.salesforce.com/s/articleView?id=release-notes.rn_sfdx_packaging_delete_unwanted_packages.htm&type=5&release=228)
# delete package version in devhub
sfdx force:package:version:delete -p ${packageVersionName} -v ${devHubName}

# delete package in devhub
sfdx force:package:delete -p ${packageName}

echo "After delete existing package in ${devHubName}"

# list all packages in the Dev Hub org
sfdx force:package:list -v ${devHubName}