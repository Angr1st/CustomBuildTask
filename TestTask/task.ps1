[CmdletBinding()]
param()

Trace-VstsEnteringInvocation $MyInvocation
try {
    Import-VstsLocStrings "$PSScriptRoot\task.json"

    # Get inputs.
    $filePath = Get-VstsInput -Name 'filepath'

    $amount = Get-VstsInput -Name 'amount'

    $intamount = $amount -as [int]

    $yesNo = Get-VstsInput -Name 'yesno' -AsBool

    
    # Run MinApp
    $process = Start-Process -FilePath "$PSScriptRoot\MinApp\MinApp.exe" -PassThru -NoNewWindow -ArgumentList "--filepath",$filePath,"--yesno",$yesNo,"--amount",$intamount

    $process.WaitForExit()

    $errorCode = $process.ExitCode

    $failed = $false
    # Fail on $LASTEXITCODE
    if ($errorCode -ne 0) {
        $failed = $true
        Write-VstsTaskError -Message (Get-VstsLocString -Key 'PS_ExitCode' -ArgumentList $errorCode)
    }
    
    # Fail if any errors.
    if ($failed) {
        Write-VstsSetResult -Result 'Failed' -Message "Error detected" -DoNotThrow
    }
} finally {
    Trace-VstsLeavingInvocation $MyInvocation
}