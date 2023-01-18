# Active Directory User Creation and Management

This script is designed to automate the process of creating new users in Active Directory and managing their group memberships. It utilizes an Excel spreadsheet as the source of information for creating the new users. The spreadsheet is an extract of the responses from a Microsoft Forms, that is automatically adapted by Power Automate before being added to the .xlsx file.

# Features

Creates new users in Active Directory based on information in an Excel spreadsheet
Generates random passwords for new users
Adds new users to specified Active Directory security groups (specified in the "GS" column of the Excel spreadsheet)
Sends an email to the new user with their account information

# Requirements

PowerShell version 5.0 or later
The Active Directory PowerShell module
The ImportExcel module
Power Automate to adapt the responses from Microsoft Forms before adding them to the Excel spreadsheet

# Usage

Prepare your data by creating a Microsoft Forms and configure Power Automate to adapt the responses before adding them to the Excel spreadsheet
Place your Excel spreadsheet in the specified OneDrive folder and update the path in the script.
Run the script with PowerShell.
The script will prompt you to enter a username and password, these credentials will be used to send the email.
A .Cred file will be generated in the specified folder, use it to import the credentials.
To automate the running of the script, you can set up a scheduled task to run the script at specific intervals or at specific times.
Please note that this script will create new users with password never expires, it's important to check your company security rules before implementing it.

It's important to make sure that the user who runs the script have enough privileges to create new users in AD and that your firewall is configured to allow the script to communicate with your email server.

Make sure that the Excel spreadsheet contains the following columns :

Prenom
Nom
Email
GS (optional, used to specify the Active Directory security groups the new user should be added to)

# Limitations

This script currently only supports creating new users in Active Directory.
The script does not currently support editing or deleting existing users.
The script does not support for multiple domains or forests.

# Contribute

This script is open source, if you wish to contribute, you can do so by submitting a pull request.

# License

This script is licensed under the MIT License.
