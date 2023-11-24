Clear-Host

#Update-Module -Name PnP.PowerShell

#Parâmetros
$Letra= "z"
$CSVFile = "C:\SiteUsers-$Letra.csv"
$AdminAccount= "usuario@dominio.br"
$UserData=@()

#Connect to SPO
Connect-SPOService -url "https://contoso-admin.sharepoint.com" #Conecta na url admin do sharepoint

$Sites = Get-SPOSite -Limit ALL | Where-Object {$_.URL -like '*contoso.sharepoint.com/*/z*'} | Sort-Object URL #busca todos os sites que iniciem com a letra z

Foreach ($Site in $Sites)
    {
    Connect-PnPOnline -Url $Site.Url -Interactive

    # Para coletar as informações é necessário que o usuario seja admin do site esta linha atribui o papel admin para o usuario
    Set-SPOUser -site $Site.Url -LoginName $AdminAccount -IsSiteCollectionAdmin $True 

    #Capturar todos os usuários da site collection
    $Users = Get-SPOUser -Limit ALL -Site $Site.Url
  
    #Loop pelos usuários e captura propriedades
    ForEach ($User in $Users)
    {
        $UserData += New-Object PSObject -Property @{
            "Índice" = $Letra
            "Site Url" = $Site.Url
            "Login ID" = $User.LoginName
        }
    }

    #Remove usuário como ADM
    Set-SPOUser -site $Site.Url -LoginName $AdminAccount -IsSiteCollectionAdmin $False
}
    
#Export data to CSV File
$UserData | Export-Csv -Path $CSVFile -NoTypeInformation -Encoding UTF8

#Read more: https://www.sharepointdiary.com/2017/02/sharepoint-online-get-all-users-using-powershell.html