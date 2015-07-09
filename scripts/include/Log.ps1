$Global:LogFilePath = "$PSScriptRoot\setup_log.txt"

function Log($message, $color)
{
    if (-not ($color))
    {
        $color = "Cyan"
    }

    $timeStamp = Get-Date -UFormat '%Y%m%d-%H:%M:%S'
    $messageWithTimeStamp = $timeStamp + ' ' + $message 
    Write-Host $messageWithTimeStamp -ForegroundColor $color
    if($Global:LogToFile)
    {
        Write-Output $messageWithTimeStamp | Out-File -FilePath $Global:LogFilePath -Append
    }
}