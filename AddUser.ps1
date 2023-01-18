# Import the Excel worksheet
$worksheet = Import-Excel -Path "path to one drive folder" 
# Iterate through each row of the worksheet
foreach ($row in $worksheet) {
    # Generate a random password
    $password = (-join (11..99 | Get-Random -Count 1)) + (-join (33..47  | Get-Random -Count 1| % {[char]$_})) + (-join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_}))
    # Concatenate the name and last name columns
    $name = $row.Name + " " + $row.Lastname
    # Split the "GS" column into an array
    $groups = $row.GS.Trim().Replace("[", "").Replace("]", "") -split ","
    # Create the samAccountName
    $samAccountName = $row.Name.Substring(0,1) + "." + $row.Lastname
    # Check if user already exists in AD
    $user = Get-ADUser -Filter "SamAccountName -eq '$samAccountName'"
    # The path to the OU
    $uo = "path to OU"
    # Import the .Cred file for authentication
    $Credential = Import-CliXml -Path "Path to the .Cred file"
    # Sender email and SMTP server details
    $exped = "sender mail"
    $smtpexped = "smtp server of sender"
    $port = "port smtp"
    # Set the security protocol
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    # If the user does not exist in AD
    if ($user -eq $null) {
        
        # Create the new user
        New-ADUser -Name $name -SamAccountName $samAccountName -GivenName $row.Name -Surname $row.Lastname -UserPrincipalName "$($samAccountName)@domaine.com" -DisplayName $name -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true -Path $uo -PasswordNeverExpires $true
        
        # Send an email to the new user with their account information
        Send-MailMessage -SMTPServer $smtpexped -Port $port -Credential $Credential -To $row.Email -From $exped -Subject "object $samAccountName" -Body "Mail with user's account ($password and $samAccountName)" -UseSsl
}
Copy code
# Iterate through each group specified in the "GS" column
foreach ($group in $groups) { 
    # Add the new user to the specified group
    Add-ADGroupMember -Identity $group -Members $samAccountName
} 
}


