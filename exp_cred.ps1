#run this to create the .Cred file
$Credential = Get-Credential
$Credential | Export-CliXml -Path "X:\path to ondrive folder\credentials.Cred"

