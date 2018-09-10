$folder = @"C:\rebol\.system.user\.data\.activities"
$expression = replace $folder "\" "\\"

$afterThisDate = (Get-Date).AddDays(-2)
$Dir = get-childitem $folder -Include *.red, *.ps1 -recurse | Sort-Object -Property LastWriteTime -Descending
$List = $Dir | Where-Object {$_.lastwritetime -gt $afterThisDate}
$List | format-table name, LastWriteTime, @{Label="Directory"; Expression={$_.Directory -replace "C:\\rebol\\.system.user\\.data\\.activities", ""}}    
