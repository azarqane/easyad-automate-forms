# Active Directory User Creation via Microsoft Forms

This script is designed to automate the process of creating new users in Active Directory via a Microsoft Forms. The responses from the form are automatically adapted by Power Automate and then added to an Excel spreadsheet, which is used as the source of information for creating the new users. Additionally, this script manages the group memberships of the created users. Additionally, there is a second script called export_cred.ps1 which is used to create the essential .Cred file for authentication of the account used in the PowerShell Send-MailMessage command.

# Features

Creates new users in Active Directory based on information from a Microsoft Forms
Generates random passwords for new users
Adds new users to specified Active Directory security groups (specified in the "GS" column of the Excel spreadsheet)
Sends an email to the new user with their account information
Utilizes a second script (export_cred.ps1) to create the essential .Cred file for authentication of the account used in the PowerShell send-mail command

# Requirements

PowerShell version 5.0 or later
The Active Directory PowerShell module
The ImportExcel module
Power Automate to adapt the responses from Microsoft Forms before adding them to the Excel spreadsheet

# Usage

Prepare your data by creating a Microsoft Forms and configure Power Automate to adapt the responses before adding them to the Excel spreadsheet
Place your Excel spreadsheet in the specified OneDrive folder and update the path in the script.
Run the script with PowerShell.
The script will prompt you to enter a username and password, use export_cred.ps1 script to generate the .Cred file in the specified folder
Use the .Cred file to import the credentials for the send-mail command
To automate the running of the script, you can set up a scheduled task to run the script at specific intervals or at specific times.
Please note that this script will create new users with password never expires, it's important to check your company security rules before implementing it.

It's important to make sure that the user who runs the script have enough privileges to create new users in AD and that your firewall is configured to allow the script to communicate with your email server.

Make sure that the Excel spreadsheet contains the following columns :

Name
Lastname
Email (the email address of the new user, who will receive their account information)
GS (optional, used to specify the Active Directory security groups the new user should be added to)

# Limitations

This script currently only supports creating new users in Active Directory.
The script does not currently support editing or deleting existing users.
The script does not support for multiple domains or forests.
Contribute

This script is open source, if you wish to contribute, you can do so by submitting a pull request.

# License

This script is licensed under the MIT License.
