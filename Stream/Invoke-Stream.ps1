function Invoke-Stream {
    <#
        .SYNOPSIS
            Publish stream
        .DESCRIPTION
            Make a new name claim and publish associated data to lbrynet,
            update over existing claim if user already has a claim for name.
            Fields required in the final Metadata are: 'title' 'description' 'author' 'language' 'license' 'nsfw'
            Metadata can be set by either using the metadata argument or by setting individual arguments fee, title, description, author, language, license, license_url, thumbnail, preview, nsfw, or sources.
            Individual arguments will overwrite the fields specified in metadata argument.
    #>
    param(
        [Parameter(Mandatory = $false)][string]$Name, # Name of the content (can only consist of a-z A-Z 0-9 and -(dash))
        [Parameter(Mandatory = $false)][double]$Bid, # Decimal amount to back the claim
        [Parameter(Mandatory = $false)][hashtable]$Metadata, # ClaimDict to associate with the claim.
        [Parameter(Mandatory = $false)][string]$FilePath, # path to file to be associated with name. If provided, a lbry stream of this file will be used in 'sources'. If no path is given but a sources dict is provided, it will be used. If neither are provided, an error is raised.
        [Parameter(Mandatory = $false)][hashtable]$Fee, # Dictionary representing key fee to download content: { 'currency': currency_symbol, 'amount': decimal, 'address': str, optional } supported currencies: LBC, USD, BTC If an address is not provided a new one will be automatically generated. Default fee is zero.
        [Parameter(Mandatory = $false)][string]$Title, # title of the publication
        [Parameter(Mandatory = $false)][string]$Description, # description of the publication
        [Parameter(Mandatory = $false)][string]$Author, # author of the publication. The usage for this field is not the same as for channels. The author field is used to credit an author who is not the publisher and is not represented by the channel. For example, a pdf file of 'The Odyssey' has an author of 'Homer' but may by published to a channel such as '@classics', or to no channel at all
        [Parameter(Mandatory = $false)][string]$Language, # language of the publication
        [Parameter(Mandatory = $false)][string]$License, # publication license
        [Parameter(Mandatory = $false)][string]$LicenseUrl, # publication license url
        [Parameter(Mandatory = $false)][string]$Thumbnail, # thumbnail url
        [Parameter(Mandatory = $false)][string]$Preview, # preview url
        [Parameter(Mandatory = $false)][boolean]$NSFW, # whether the content is nsfw
        [Parameter(Mandatory = $false)][string]$ChannelName, # name of the publisher channel name in the wallet
        [Parameter(Mandatory = $false)][string]$ChannelId, # claim id of the publisher channel, does not check for channel claim being in the wallet. This allows publishing to a channel where only the certificate private key is in the wallet.
        [Parameter(Mandatory = $false)][string]$ChannelAccountId, # one or more account ids for accounts to look in for channel certificates, defaults to all accounts.
        [Parameter(Mandatory = $false)][string]$AccountId, # account to use for funding the transaction
        [Parameter(Mandatory = $false)][string]$ClaimAddress        # address where the claim is sent to, if not specified new address will automatically be created
    )

}