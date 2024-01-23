#Conectar no Sharepoint Online
Connect-SPOService -url "https://5phs4v-admin.sharepoint.com/"

#Criar um novo site
#storageQuota é medida em megabytes

New-SPOSite -url "https://5phs4v.sharepoint.com/sites/Teste1" -owner "prisciladadalt@5phs4v.onmicrosoft.com" -storageQuota 2 
