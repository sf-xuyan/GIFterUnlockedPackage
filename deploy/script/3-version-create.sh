#!/bin/bash
devHubName=DevHub
path=force-app # match path in packageDirectories
packageName=GIFter # match package in packageDirectories
packagePassword=Pa55word

# create version
sfdx force:package:version:create -p ${packageName} -d ${path} -k ${packagePassword} --wait 30 -v ${devHubName}

########## Response Info ##########
# sfdx-project.json has been updated.
# Successfully created the package version [08c5j000000blQPAAY]. Subscriber Package Version Id: 04t5j000000DBT9AAO
# Package Installation URL: https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5j000000DBT9AAO
# As an alternative, you can use the "sfdx force:package:install" command.
