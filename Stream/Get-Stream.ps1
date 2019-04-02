class Stream {
    [boolean]$Completed
    [string]$FileName
    [string]$DownloadDir
    [double]$PointsPaid
    [boolean]$Stopped
    [string]$StreamHash
    [string]$StreamName
    [string]$SuggestedFileName
    [string]$SdHash
    [string]$DownloadPath
    [string]$MimeType
    [string]$Key
    [int32]$TotalBytes
    [int32]$WrittenBytes
    [int16]$BlobsComplete
    [int16]$StreamBlobs
    [string]$Status
    [string]$ClaimId
    [string]$Outpoint
    [string]$TxId
    [int32]$ClaimNout
    [hashtable]$Metadata
    [string]$ChannelClaimId
    [string]$ChannelName
    [string]$ClaimName
}

function Get-Stream {
    param(
        [Parameter(Mandatory = $false)]
        [string]$Uri,
        [Parameter(Mandatory = $false)]
        [string]$Filename,
        [Parameter(Mandatory = $false)]
        [int16]$Timeout
    )
    return Invoke-RestMethod -Uri "$Uri/get/$Filename" -TimeoutSec $Timeout | Format-Custom Stream
}
