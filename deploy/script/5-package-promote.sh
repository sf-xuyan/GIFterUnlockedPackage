#!/bin/bash
packageVersionName=GIFter@0.1.0-1 # 04txxx could be found in sfdx-project.json

# promote the version so it can be installed in production org
sfdx force:package:version:promote --package ${packageVersionName}

# check if a version is already promoted
sfdx force:package:version:report --package ${packageVersionName}