
#Conectar no Sharepoint Online
Connect-SPOService -url "https://5phs4v-admin.sharepoint.com/"

#Remover usuário do grupo
Remove-SPOUser -LoginName "AlexW@5phs4v.onmicrosoft.com" -Site "https://5phs4v.sharepoint.com/sites/Teste1"
