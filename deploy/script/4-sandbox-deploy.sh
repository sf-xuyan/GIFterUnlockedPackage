#!/bin/bash

export FORCE_SPINNER_DEPLAY=
export FORCE_SHOW_SPINNER=

#Change parameters below according to needs
sandboxOrgName=sixdeep # target org alias
packageVersionName=GIFter@0.1.0-1 # package@versionNumber -> match in packageAliases of sfdx-project.json
packagePassword=Pa55word
permsetname=GIFter
navigationURLPath=lightning/n/GIFter

BLUE=`tput setaf 4`
RESET=`tput sgr0`

invokeCmd() {
  echo "CMD: ${BLUE}$1${RESET}"
  eval $1
}

function executeCommands(){
  # invokeCmd "sfdx texei:package:dependencies:install -u $sandboxOrgName -r"

  invokeCmd "sfdx force:package:install --wait 30 --publishwait 30 --package ${packageVersionName} -k ${packagePassword} -r -u ${sandboxOrgName}"

  invokeCmd "sfdx force:user:permset:assign -n $permsetname -u $sandboxOrgName"

  # invokeCmd "sfdx force:apex:execute -f data-import/sandbox/CreateSchedulable.cls -u $sandboxOrgName"

  # invokeCmd "sfdx force:org:open -u $sandboxOrgName"
  invokeCmd "sfdx force:org:open -u $sandboxOrgName -p $navigationURLPath"

  invokeCmd "echo Tasks done!"
}

read -p "${sandboxOrgName}: <- Are you sure to deploy | ${packageVersionName} | package to this org? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  executeCommands
fi