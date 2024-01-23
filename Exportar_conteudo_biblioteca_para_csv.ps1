$SiteURL= "https://5phs4v.sharepoint.com/sites/Teste1"
$Biblioteca = "Documents"

#Conecta em um site Sharepoint com autenticação multifator
Connect-PnPOnline -url $SiteURL -Interactive

#Cria array vazio
$TodosArquivos = @()

#Pega documentos dentro da biblioteca Documents
$ItemsBiblioteca = (Get-PnPListItem -List $Biblioteca)
   
ForEach($Item in $ItemsBiblioteca)
{
    $TodosArquivos += New-Object PSObject -property $([ordered]@{ 
    "Nome do arquivo/pasta"  = $Item.FieldValues["FileLeafRef"]            
    "Tipo do arquivo" = $Item.FieldValues["File_x0020_Type"]
    "Data de Criação"   = $Item.FieldValues["Created"]
    "Data de modificação"   = $Item.FieldValues["Modified"]
    })
 
}

$TodosArquivos | Export-CSV "C:\Arquivos$Biblioteca.CSV" -NoTypeInformation -Encoding UTF8
