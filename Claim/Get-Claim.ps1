class Claim {
    [string]$Tx         # hex encoded transaction
    [string]$TxId       # txid of resulting claim
    [int32]$NOut        # nout of the resulting claim
    [double]$Fee        # fee paid for the claim transaction
    [string]$ClaimId    # claim ID of the resulting claim
}