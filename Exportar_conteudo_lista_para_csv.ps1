$SiteURL= "https://5phs4v.sharepoint.com/sites/Teste1"
$Lista = "Sites"

#Conecta em um site Sharepoint com autenticação multifator
Connect-PnPOnline -url $SiteURL -Interactive

$relatorio = @()

$ItemsLista= (Get-PnPListItem -List $Lista)
  
ForEach($ItemLista in $ItemsLista)
{  
$relatorio += New-Object PSObject -property $([ordered]@{ 
        "Nome" = $ItemLista["Name"]
        "URL" = $ItemLista["url"]
        "Proprietário" = $ItemLista["proprietario"]
        "Área" = $ItemLista["area"]
        "Hub" = $ItemLista["hub"]  
})
}
  
$relatorio | Export-CSV "C:\Lista$Lista.CSV" -Encoding UTF8 -NoTypeInformation