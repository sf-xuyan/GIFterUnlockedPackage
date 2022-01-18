# GIFter

The GIF-to-Chatter app for Lightning Platform you didn't know you needed!

This repo is developed and maintained for the [Quick Start: Unlocked Packages](https://trailhead.salesforce.com/content/learn/projects/quick-start-unlocked-packages) Trailhead project.

It was originally created by [Wade Wegner](https://github.com/wadewegner).

![image](images/gifter.png)

# Key steps in Trailhead
1. Create a GIPHY App
Go to: https://developers.giphy.com/dashboard/?create=true
Select `API Selected`, and `Next` Step
Give the new app an App Name and App Description, then click `Create New App`
Copy the displayed `API Key`

2. Replace key in GIPHY.resource
Open the file `force-app/main/default/staticresources/GIPHY.resource`
Replace YOUR_GIPHY_API_KEY with your Api Key
```javascript
var apiKey = "YOUR_GIPHY_API_KEY";
```
Save the GIPHY.resource file

3. Setup SFDC environment and Browse the app 
```bash
# Connect to a DevHub org
sfdx auth:web:login --setdefaultdevhubusername --setalias DevHub

# Create a scratch org
sfdx force:org:create --setdefaultusername --definitionfile config/project-scratch-def.json
# Successfully created scratch org: 00D6D0000002ImjUAE, username: test-fxy83waexots@example.com

# Push all your source from the force-app folder to scratch org
sfdx force:source:push

# Assign permission set to defualt user
sfdx force:user:permset:assign --permsetname GIFter

# Browse to the GIFter app from the App Launcher
sfdx force:org:open --path lightning/n/GIFter
```

4. Packaging the app
```bash
sfdx force:package:create --name GIFter --description "Using GIPHY to find GIFs and post to Chatter" --path force-app --packagetype Unlocked --targetdevhubusername DevHub
# Successfully created a package. 0Ho5j000000fxWICAY
```

# Get started with the customized repo
1. clone the [GIFterUnlockedPackage Repo](https://github.com/sf-xuyan/GIFterUnlockedPackage) to your local system
2. auth your devhub org (enable devhub & 2gp)
3. replace your key in `force-app/main/default/staticresources/GIPHY.resource` file
4. set the variables in `deploy/script/0-reset-env.sh`
5. optionally run the shell script to `reset the environment`, which means delete existing package in devhub
```bash
bash deploy/script/0-reset-env.sh
```
6. set the variables in `deploy/script/1-scratch-org-setup.sh`
7. run the shell script to `create a scrach org in your devhub org`
```bash
bash deploy/script/1-scratch-org-setup.sh
```
8. set the variables in `deploy/script/2-package-create.sh`
9. run the shell script to `create a package`
```bash
bash deploy/script/2-package-create.sh
```
10. set the variables in `deploy/script/3-version-create.sh`
11. run the shell script to `create a version for the package`
```bash
bash deploy/script/3-version-create.sh
```
12. set the variables in `deploy/script/4-sandbox-deploy.sh`
13. run the shell script to `deploy the package to sandbox or DE org`
```bash
bash deploy/script/4-sandbox-deploy.sh
```
14. set the variables in `deploy/script/5-package-promote.sh`
15. run the shell script to `promote a package for installation in prod org`
```bash
bash deploy/script/5-package-promote.sh
```