#Conectar no Sharepoint Online
Connect-SPOService -url "https://5phs4v-admin.sharepoint.com/"

#Adicionar usuário no grupo
$SiteUrl = "https://5phs4v.sharepoint.com/sites/Teste1"
$Grupo = "owners"

Add-SPOUser -group $Grupo -LoginName "AdeleV@5phs4v.onmicrosoft.com" -Site $SiteUrl
Add-SPOUser -group $Grupo -LoginName "AlexW@5phs4v.onmicrosoft.com" -Site $SiteUrl
Add-SPOUser -group $Grupo -LoginName "DiegoS@5phs4v.onmicrosoft.com" -Site $SiteUrl