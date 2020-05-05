# Azure DevOps CustomBuildTask

This Repo contains a really simple azure devops extension with just one build task. This build task uses the new PowerShell3 Task Executer. You can use this structure as template to create your own azure devops extension. This custom build task showcased here is only intended to be run on a windows machine.

## Prerequisites

Have a look at microsofts [tutorial](https://docs.microsoft.com/en-us/azure/devops/extend/develop/add-build-task?view=azure-devops#preparation-and-required-setup-for-this-tutorial) of how to create a custom build task. There they list everything needed to create and publish a custom build task.

## How To Adapt

1. Update the information inside of the [vss-extension.json](/vss-extension.json)
2. Update the information inside of the [task.json](https://github.com/Angr1st/CustomBuildTask/blob/master/TestTask/task.json)
3. Potentially look for an updated version of the [VstsTaskSdk](https://www.powershellgallery.com/packages/VstsTaskSdk) (current: 0.11.0)
  * Replace the content inside of the [VstsTaskSdk-Folder](/TestTask/ps_modules/VstsTaskSdk) with the new content
  * Send me a pr to update this repo 😅
4. Remove the [MinApp-Folder](/TestTask/MinApp) 
5. Update the [task.ps1](/TestTask/task.ps1) script for your purpose
6. Replace the icons [here](/images/logo.png) for the extension and [here](/TestTask/icon.png). Both need to be 128x128.

## How to package and publish

You can use the [pack_and_publish.ps1](/pack_and_publish.ps1) script to automate the publishing of your newly created extension. You can also pass in organisation to share your extension with. It will be published private by default.

## History

After I fixed the ps_module folder structure (removing the 0.11.0 and moving its contents directly into its parent folder) the build task works.
Also the task.ps1 shows you how to run another app using start-process cmdlet and using the correct options to retrieve its ExitCode.

