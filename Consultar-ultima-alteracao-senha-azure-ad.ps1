#accept any prompts for untrusted repositories 
Install-module MSOnline

#then enter your O365 Global Admin details
Connect-MSOLService 

Get-MsolUser -UserPrincipalName 'ava527@einstein.br' | Select LastPasswordChangeTimestamp