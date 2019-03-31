function Invoke-LbryRequest {
    <#
    .SYNOPSIS
        Base API Request Constructor
    .DESCRIPTION
        Invokes Request to LBRY API
    .PARAMETER Uri
        URI to LBRY instance
    .PARAMETER Method
        HTTP Method. Default: GET
    .PARAMETER Params
        Parameters
    .PARAMETER BasicAuth
        Credentials to connect to lbrycrd (as ["username","password"]
    .EXAMPLE
        Invoke-LbryRequest "http://localhost:5279" -Params getinfo -BasicAuth test, test
    #>
    [CmdletBinding()]
    param (
        [Parameter()][string]
        $Uri='http://localhost:5279',
        [Parameter()][string]
        $Method='GET',
        [Parameter()][string[]]
        $BasicAuth,
        [Parameter()][string[]]
        $Params
    )

    $reqId = 0
    
    $body = @'{
    "id": ++$reqId,
    "jsonrpc": '2.0',
    "method": $Method,
    "params": $Params}'

    $output = @()

    if ($BasicAuth){
        $output = Invoke-RestMethod $Uri -Credential $BasicAuth -Body $body -ContentType 'application/json'
    } else {
        $output = Invoke-RestMethod $Uri -Body $body -ContentType 'application/json'
    } 
    
    if($output.results -and $output -is [pscustomobject]){
        $output.results
    } else {
        $output
    }
}

function Invoke-LbryCRD 
{
    <#
    .SYNOPSIS
        Powershell binding to lbrycrd API
    .DESCRIPTION
        Calls Lbrycrdd-cli API
    .EXAMPLE
        Invoke-LbryCRD -Action getinfo
    #>
    [CmdletBinding()]
    Param (
        $Uri='http://localhost:9245/',
        $Method='GET',
        $Params,
    )

    Write-Output{ Invoke-LbryRequest $Uri $Method $Params }

}

function Invoke-LbrySDK {
    <#
    .SYNOPSIS
        LBRYNet API Binding
    .DESCRIPTION
        Calls LBRY-SDK
    .PARAMETER Uri
        URI to running instance
    .PARAMETER Method
        HTTP Method. Default: HTTP
    .PARAMETER Params
        API Call
#>
    [CmdletBinding()]
    Param (
        $Uri='http://localhost:5279/',
        $Method='GET',
        $Params
    )
    Invoke-LbryRequest{$Uri, $Method, $Params} | Write-Output

}