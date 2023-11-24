Clear-Host

#Par�metros
$Letra= "z"
$CSVFile = "C:\SitePages-$Letra.csv"
$relatorio = @() # Inicializa o array para o relat�rio csv
$AdminAccount= "usuario@dominio.br"

#Connect to SPO
Connect-SPOService -url "https://contoso-admin.sharepoint.com" #Conecta na url admin do sharepoint

$Sites = Get-SPOSite -Limit ALL | Where-Object {$_.URL -like '*contoso.sharepoint.com/*/z*'} | Sort-Object URL #busca todos os sites que iniciem com a letra z


Foreach ($Site in $Sites)
    {
    Connect-PnPOnline -Url $Site.Url -Interactive

     # Para coletar as informa��es � necess�rio que o usuario seja admin do site esta linha atribui o papel admin para o usuario
    Set-SPOUser -site $Site.Url -LoginName $AdminAccount -IsSiteCollectionAdmin $True

    #Captura todas as P�ginas do Site
    $SitePages = Get-PnPListItem -List "P�ginas do Site"
 
    $PagesDataColl = @()
    
    #Coleta dados das p�ginas como Titulo, URL e outras propriedades    
    ForEach($Page in $SitePages)
    {
        $Data = New-Object PSObject -Property ([Ordered] @{
        PageName  = $Page.FieldValues.Title
        RelativeURL = $Page.FieldValues.FileRef})
        $PagesDataColl += $Data

        #Exportar dados para Arquivo CSV
        $Page | Export-Csv -Path $CSVFile -NoTypeInformation
    }

    #somar total de p�ginas
    $sum = $PagesDataColl.Count

    #Adicione os dados do site e o n�mero de p�ginas ao relat�rio
    $relatorio += [PSCustomObject]@{
        "�ndice" = $Letra
        "Nome do Site" = $Site.Url
        "N�mero de P�ginas" = $sum
}
    
    # Exporte os dados da p�gina do site para um arquivo CSV
    $PagesDataColl | Export-Csv -Path "$CSVFile" -NoTypeInformation -Append -Force -Encoding UTF8

    #Remove usu�rio como ADM
    Set-SPOUser -site $Site.Url -LoginName $AdminAccount -IsSiteCollectionAdmin $False

    write-host $Site.Url $sum
}

# Exporte o relat�rio para um arquivo CSV
$relatorio | Export-Csv -Path "$CSVFile" -NoTypeInformation -Encoding UTF8

#Read more: https://www.sharepointdiary.com/2020/11/sharepoint-online-get-all-pages-using-powershell.html#ixzz8INf8s3YW