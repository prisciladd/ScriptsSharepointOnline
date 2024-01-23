$SiteURL= "https://5phs4v.sharepoint.com/sites/Teste1"

#Conecta no Sharepoint Online
Connect-SPOService -url "https://5phs4v-admin.sharepoint.com/"

#Conecta na API Microsoft Graph do Microsoft Entra Antigo Azure AD.
#Para conexão é necessário especificar o escopo como somente leitura ou edição.
Connect-MgGraph -Scopes "User.Read.All", "Group.ReadWrite.All" -UseDeviceAuthentication

Get-MgUser | Select Mail | Export-Csv -path "C:\Usuarios.csv" -NoTypeInformation

$usuarios= Import-Csv -Path C:\Usuarios.csv

$grupo = "members"

forEach ($usuario in $usuarios){

    Add-SPOUser -group $grupo -LoginName $usuario.Mail -Site $SiteURL
}
