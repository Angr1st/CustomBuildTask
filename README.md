# Azure DevOps CustomBuildTask
This Repo contains a really simple azure devops extension with just one build task. This build task uses the new PowerShell3 Task Executer. You can use this structure as template to create your own azure devops extension.

## History
After I fixed the ps_module folder structure (removing the 0.11.0 and moving its contents directly into its parent folder) the build task works.
Also the task.ps1 shows you how to run another app using start-process cmdlet and using the correct options to retrieve its ExitCode.

