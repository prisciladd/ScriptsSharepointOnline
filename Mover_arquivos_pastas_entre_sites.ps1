$SiteURL= "https://5phs4v.sharepoint.com"
$MoverDe = "/sites/Teste1/Shared Documents/$arquivo"
$MoverPara = "/sites/FlySafeConference/Shared Documents"

Connect-PnPOnline -url "https://5phs4v.sharepoint.com/" -Interactive

$file= read-host "Escreva o nome do arquivo para mover" 

Move-PnPFile -SourceUrl "/sites/EinsteinPOC/Shared Documents/$file" -TargetUrl "/sites/FlySafeConference/Shared Documents" -Overwrite -AllowSchemaMismatch -AllowSmallerVersionLimitOnDestination
