param(
    [string][Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()]$patToken,
    [string]$shareWith
)

$path = npm prefix -g
$tfxcli = Join-Path $path "node_modules\tfx-cli\_build\tfx-cli.js"

Invoke-Expression -Command "node $tfxcli extension create"
if ([string]::IsNullOrEmpty($shareWith)) {
    Invoke-Expression -Command "node $tfxcli extension publish -t $patToken"
}
else {
    Invoke-Expression -Command "node $tfxcli extension publish -t $patToken --share-with $shareWith"
}
