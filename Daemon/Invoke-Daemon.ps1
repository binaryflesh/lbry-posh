function Invoke-Daemon {
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
        $Uri = 'http://localhost:5279',
        [Parameter()][string]
        $Method = 'GET',
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
    "params": $Params
}'

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

<#
@(
    $Verbs = @("get", "publish", "report_bug", "resolve", "status", "stop", "version", "stream_cost_estimate")
    $Account = @("account_add","account_balance","account_create","account_decrypt","account_encrypt", "account_fund","account_lock","account_list","account_max_address_gap","account_remote", "account_send","account_set","account_unlock")
    $Address = @("address_is_mine","address_list","address_unused")
    $Blob = @("blob_announce","blob_delete","blob_get","blob_list","blob_reflect", "blob_reflect_all")
    $Block = @("block_show")
    $Channel = @("channel_export","channel_import","channel_list","channel_new")
    $Claim = @("claim_abandon","claim_list","claim_list_by_channel","claim_list_mine", "claim_new_support","claim_send_to_address","claim_show","claim_tip")
    $File = @("file_delete","file_list","file_reflect","file_set_status")
    $Peer = @("peer_list","peer_ping")
    $Get::RoutingTable() = @("routing_table_get")
    $Settings = @("settings_get","settings_set")
    $Transaction = @("transaction_list","transaction_show")
    $UTXO = @("utxo_list","utxo_release")
    $Wallet = @("wallet_send")
)


<#
publish
Make a new name claim and publish associated data to lbrynet, update over existing claim if user already has a claim for name. Fields required in the final Metadata are: 'title' 'description' 'author' 'language' 'license' 'nsfw' Metadata can be set by either using the metadata argument or by setting individual arguments fee, title, description, author, language, license, license_url, thumbnail, preview, nsfw, or sources. Individual arguments will overwrite the fields specified in metadata argument.

ARGUMENTS
name
str name of the content (can only consist of a-z A-Z 0-9 and -(dash))
bid
decimal amount to back the claim
metadata
optionaldict ClaimDict to associate with the claim.
file_path
optionalstr path to file to be associated with name. If provided, a lbry stream of this file will be used in 'sources'. If no path is given but a sources dict is provided, it will be used. If neither are provided, an error is raised.
fee
optionaldict Dictionary representing key fee to download content: { 'currency': currency_symbol, 'amount': decimal, 'address': str, optional } supported currencies: LBC, USD, BTC If an address is not provided a new one will be automatically generated. Default fee is zero.
title
optionalstr title of the publication
description
optionalstr description of the publication
author
optionalstr author of the publication. The usage for this field is not the same as for channels. The author field is used to credit an author who is not the publisher and is not represented by the channel. For example, a pdf file of 'The Odyssey' has an author of 'Homer' but may by published to a channel such as '@classics', or to no channel at all
language
optionalstr language of the publication
license
optionalstr publication license
license_url
optionalstr publication license url
thumbnail
optionalstr thumbnail url
preview
optionalstr preview url
nsfw
optionalbool whether the content is nsfw
channel_name
optionalstr name of the publisher channel name in the wallet
channel_id
optionalstr claim id of the publisher channel, does not check for channel claim being in the wallet. This allows publishing to a channel where only the certificate private key is in the wallet.
channel_account_id
optionalstr one or more account ids for accounts to look in for channel certificates, defaults to all accounts.
account_id
optionalstr account to use for funding the transaction
claim_address
optionalstr address where the claim is sent to, if not specified new address will automatically be created
RETURNS
(dict) Dictionary containing result of the claim
{
    'tx' : (str) hex encoded transaction
    'txid' : (str) txid of resulting claim
    'nout' : (int) nout of the resulting claim
    'fee' : (decimal) fee paid for the claim transaction
    'claim_id' : (str) claim ID of the resulting claim
}
#>#>