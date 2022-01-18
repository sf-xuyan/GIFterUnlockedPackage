#!/bin/bash
export FORCE_SPINNER_DEPLAY=
export FORCE_SHOW_SPINNER=

#Change parameters below according to needs
devHubName=DevHub
scratchOrgName=GIFter
scratchDefPath=config/project-scratch-def.json
permsetname=GIFter # multiple permission set split by ','
navigationURLPath=lightning/n/GIFter

BLUE=`tput setaf 4`
RESET=`tput sgr0`

invokeCmd() {
  echo "CMD: ${BLUE}$1${RESET}"
  eval $1
}

executeCommands(){
  invokeCmd "sfdx force:config:set defaultdevhubusername=$devHubName"

  invokeCmd "sfdx force:org:delete -u $scratchOrgName -p"

  # ERROR running force:org:create: xxx limit exceeded
  # Then query the limit by -> sfdx force:limits:api:display -u DevHub
  # query all the ActiveScratchOrg -> sfdx force:data:soql:query --query='SELECT Id, Name, OrgName, CreatedDate, Description, ScratchOrg, SignupUsername FROM ActiveScratchOrg' -u DevHub
  # And then delete the one you don't want -> sfdx force:data:record:delete -s ActiveScratchOrg -i $ID
  
  invokeCmd "sfdx force:org:create -s -f $scratchDefPath -a $scratchOrgName -v $devHubName"

  invokeCmd "sfdx force:config:set defaultusername=$scratchOrgName"

  # invokeCmd "sfdx texei:package:dependencies:install -r"

  invokeCmd "sfdx force:source:push"

  invokeCmd "sfdx force:user:permset:assign -n $permsetname -u $scratchOrgName"

  # invokeCmd "sfdx force:data:tree:import --plan ./data-import/scratch-org/what_ever_data.json"

  # invokeCmd "sfdx force:apex:execute -f data-import/scratch-org/Run_A_Batch.cls"

  # invokeCmd "sfdx force:apex:execute -f data-import/scratch-org/CreateSchedulable.cls"

  # invokeCmd "sfdx force:org:open"
  invokeCmd "sfdx force:org:open -u $scratchOrgName -p $navigationURLPath"

  #  This command is useful for CI environment, optional for developer environment.
  #  It needs to install jq tool in advance.
  #invokeCmd sfdxAuthUrl="$(sfdx force:org:display --verbose --json | jq -r .result.sfdxAuthUrl)"

  invokeCmd "echo Tasks done!"
}

read -p "${scratchOrgName}: <- Are you sure to delete and recreate this existing scratch org?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  executeCommands
fi