$SiteURL= "https://5phs4v.sharepoint.com/sites/Teste1"

#Conecta em um site Sharepoint com autenticação multifator
Connect-PnPOnline -url $SiteURL -Interactive


Add-PnPListItem -List "Sites" -Values @{"Name" = "Medical Suite"; 
"url"="https://5phs4v.sharepoint.com/sites/medicalsuite";
"proprietario"="pri027@5phs4v.sharepoint.com";
"area"="portal medico";
"hub"=""}
