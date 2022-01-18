#!/bin/bash
devHubName=DevHub
path=force-app
packageName=GIFter
packagetype=Unlocked # (Managed|Unlocked)
# if variable value contains spaces, please use "${description}" rather than ${description} -> https://askubuntu.com/questions/850971/bash-variable-expansion-behavior-when-using-single-or-double-spaces
description='Using GIPHY to find GIFs and post to Chatter'

# create package - If you don't have a namespace defined in your sfdx-project.json file, use --nonamespace.
sfdx force:package:create -n ${packageName} -d "${description}" -t ${packagetype} -r ${path} -v ${devHubName} --nonamespace