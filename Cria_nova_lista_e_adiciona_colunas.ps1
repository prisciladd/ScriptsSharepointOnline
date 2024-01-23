$SiteURL= "https://5phs4v.sharepoint.com/sites/Teste1"

#Conecta em um site Sharepoint com autenticação multifator
Connect-PnPOnline -url $SiteURL -Interactive

#Cria uma nova lista
New-PnPList -Title "Sites" -Template "GenericList"

#Adiciona campos do tipo especificado na lista
Add-PnPField -DisplayName "Name" -InternalName "Name" -Type "Text" -List "Sites"
Add-PnPField -DisplayName "URL" -InternalName "url" -Type "Text" -List "Sites"
Add-PnPField -DisplayName "Proprietário" -InternalName "proprietario" -Type "Text" -List "Sites"
Add-PnPField -DisplayName "Área" -InternalName "area" -Type "Text" -List "Sites"
Add-PnPField -DisplayName "Hub" -InternalName "hub" -Type "Text" -List "Sites"