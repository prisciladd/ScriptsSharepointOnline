Install-Module Microsoft.Graph -Scope CurrentUser
Import-Module Microsoft.Graph

get-module

Find-MgGraphCommand -command Get-MgUser | Select -First 1 -ExpandProperty Permissions

Connect-MgGraph -Scopes "User.Read.All", "Group.ReadWrite.All" -UseDeviceAuthentication
help Connect-MgGraph -online

Get-MgUser

$user = Get-MgUser -Filter "displayName eq 'Marcio Veronesi Fukuda'"

$user.DisplayName

$user.GivenName

$user.Id

$user.JobTitle

$user.Mail

$user.OfficeLocation

$user.Surname

$user.UserPrincipalName

Get-MgUserJoinedTeam -UserId $user.Id

$team = Get-MgTeam -TeamId ebef8117-2b30-47ef-96d5-affff21e8c88