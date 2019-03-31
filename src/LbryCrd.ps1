# TODO: invoke lbrycrdd
# TODO: if daemon not stated, start daemon
# TODO: Cross compabibility ^
# TODO: support all lbrycrdd-cli.exe actions
<#
    $actions = @(
        "abandonclaim","abandonsupport","claimname","getclaimbyid","getclaimsforname",
        "getclaimsfortx","getclaimsintrie","getclaimtrie","getnameproof","gettotalclaimednames",
        "gettotalclaims","gettotalvalueofclaims","getvalueforname","listnameclaims","supportclaim",
        "updateclaim","getbestblockhash","getblock","getblockchaininfo","getblockcount","getblockhash",
        "getblockheader","getchaintips","getdifficulty","getmempoolinfo","getrawmempool","gettxout",
        "gettxoutproof","gettxoutsetinfo","verifychain","verifytxoutproof","getinfo","help","stop","generate",
        "generatetoaddress","getblocktemplate","getgenerate","gethashespersec","getmininginfo","getnetworkhashps",
        "prioritisetransaction","setgenerate","submitblock","addnode","clearbanned","disconnectnode","getaddednodeinfo",
        "getconnectioncount","getnettotals","getnetworkinfo","getpeerinfo","listbanned","ping","setban","createrawtransaction",
        "decoderawtransaction","decodescript","fundrawtransaction","getrawtransaction","sendrawtransaction","signrawtransaction",
        "createmultisig","estimatefee","estimatepriority","estimatesmartfee","estimatesmartpriority","validateaddress","verifymessage",
        "abandontransaction","addmultisigaddress","backupwallet","dumpprivkey","dumpwallet","encryptwallet","getaccount","getaccountaddress",
        "getaddressbyaccount","getbalance","getnewaddress","getrawchangeaddress","getreceivedbyaccount","getreceivedbyaddress","gettransaction",
        "getunconfirmedbalance","getwalletinfo","importaddress","importprivkey","importprunedfunds","importpubkey","importwallet",
        "keypoolrefill","listaccounts","listaddressgroupings","listlockunspent","listreceivedbyaddress","listinceblock","listtransactions",
        "listunspent","lockunspent","move","removeprunedfunds","sendfrom","sendmany","sendtoaddress","setaccount","settxfee","signmessage",
    )
    #>
#TODO: unit test