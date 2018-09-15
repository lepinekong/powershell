
function downloadFile {
    param ( 
        [string]$url,
        [string]$folder, 
        [string]$subFolder
    )

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $webRequest = [net.WebRequest]::Create($url)
    $uri = $webrequest.GetResponse().ResponseUri.Segments
    [string]$fileName=$uri[3]

    $target_folder="$folder\$subFolder"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $Webcli=New-Object System.Net.WebClient
    if (!(Test-Path `"$target_folder\$fileName`")) {$Webcli.DownloadFile("$url","$target_folder\$fileName")}
}
