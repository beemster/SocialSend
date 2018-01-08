# Masternode setup

- MN: Masternode on a dedicated instance (VPS/dedicated/VM/..)
- Client: Client on your local computer

On the masternode (MN) you run sendd (send daemon), it will need to see a wallet with SEND_AMOUNT of coins to act as a MN.

This SEND will sit in a wallet running on the Client (in most cases, your local computer).

Here are the pieces we need:

- SEND_AMOUNT: 6250 at this time (20180105) 
- LABEL: this is the label we're going to use to refer to our MN, only going to be used on the Client side, for example: MN1
- SEND_Address: this address will need to have exactly the right amount of SEND
- TX_ID: ID for the transaction to the SEND_Address used to lock your SEND
- TX_IDX: Index for that TX_ID
- SEND_privkey: Private key for connecting MN with Client
- MN_IP: IP address of the instance you are running MN1 on
- MN_Port: port to be used to connect to MN1. Default: 50050


Keep a list of all pieces above and fill them in as you go along. You will need them to populate the config files.

Let's go:
1. Generate private key (SEND_privkey). You can do this on the Client (Debug console) or MN (send-cli): `masternode genkey`
2. Get a new address (SEND_Address) for Coin Locking on the Client (Debug console) and call it with LABEL (ex: MN1): `getaccountaddress MN1`
3. Transfer exactly SEND_AMOUNT SEND to the address (SEND_Address) generated in the previous step
4. Get the transaction details (TX_ID and TX_IDX) on the Client(Debug console): `masternode outputs`
5. Fill it all in in the config files on the Client and on the MN, see below.

#### Client configs
send.conf:
```
rpcuser=sendrpc
rpcpassword=<rpc password for Client>
pcallowip=127.0.0.1
staking=1
server=1
listen=1
daemon=1
logtimestamps=1
maxconnections=256
```

masternode.conf:
```
LABEL MNIP:MNPORT SEND_privkey TX_ID TX_IDX
```

#### MN configs

masternode.conf: 
	nothing relevant, commented lines are ok, otherwise empty unless you need advanced stuff

send.conf:
```
rpcuser=sendrpc
rpcpassword=<rpc password for MN>
pcallowip=127.0.0.1
#staking=1
server=1
listen=1
daemon=1
logtimestamps=1
maxconnections=256
masternode=1
masternodeprivkey=<SEND_privkey>
masternodeaddr=<MN_IP>:<MN_Port>
externalip=<MN_IP>:<MN_Port>
```

6. Start the Client: GUI or CLI: `sendd`
7. Start the MN CLI: `sendd`
8. On the Client, tell the MN to go ahead via GUI (Masternodes -> start missing/node) or via CLI: `masternode start-alias LABEL`
9. Verify if your MN is running (on the MN): `egrep -A 5 '(CActiveMasternode|EnableHot|Ping vin)' debug.log`

If you see something like this, the MN should be running:
> 2018-01-05 23:24:37 CActiveMasternode::EnableHotColdMasterNode() - Enabled! You may shut down the cold daemon.
>
> 2018-01-05 23:24:37 CActiveMasternode::SendMasternodePing() - Relay Masternode Ping vin = CTxIn(COutPoint(24da8ba47e46800a5cb40985e225aadc53eea5be0a6f5a4d03a86a008a80aa9f, 0), scriptSig=)

If you see the following after it, it means the blockchain is not synced yet.
> 2018-01-05 23:24:37 CActiveMasternode::ManageStatus() - Error on Ping: Too early to send Masternode Ping

You should get a final line like this when it's up to date.
> 2018-01-05 23:24:37 CActiveMasternode::SendMasternodePing() - Relay Masternode Ping vin = CTxIn(COutPoint(24da8ba47e46800a5cb40985e225aadc53eea5be0a6f5a4d03a86a008a80aa9f, 0), scriptSig=)



## Troubleshooting

### SECURITY

Some guides seem to mention to use the same "rpcuser" and "rpcpassword" for the Client AND the MN.
This is not necessary and might be a SECURITY risk.

Anyone who compromises your MN and has access to RPC on your client can transfer your money wherever (s)he wants.


### Client versions

For best results, both client versions should be the same on the Client and on the MN.

Client: Debug Console or send-cli
MN: send-cli

Here's example info of a working setup:

#### Client
```
send-cli getinfo
{
    "version" : 1000007,
    "protocolversion" : 70810,
    "walletversion" : 61000,
    "balance" : 6279.36172409,
    "obfuscation_balance" : 0.00000000,
    "blocks" : 69571,
    "timeoffset" : -11,
    "connections" : 16,
    "proxy" : "",
    "difficulty" : 110867.64655773,
    "testnet" : false,
    "keypoololdest" : 1513811335,
    "keypoolsize" : 1001,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00010000,
    "staking status" : "Staking Active",
    "errors" : ""
}
```

#### MasterNode
```
send-cli getinfo
{
    "version" : 1000007,
    "protocolversion" : 70810,
    "walletversion" : 61000,
    "balance" : 0.00000000,
    "obfuscation_balance" : 0.00000000,
    "blocks" : 69571,
    "timeoffset" : 0,
    "connections" : 35,
    "proxy" : "",
    "difficulty" : 110867.64655773,
    "testnet" : false,
    "keypoololdest" : 1515097993,
    "keypoolsize" : 1001,
    "paytxfee" : 0.00000000,
    "relayfee" : 0.00010000,
    "staking status" : "Staking Not Active",
    "errors" : ""
}
```


### Use the correct LABEL/wallet for your deposited coin

The LABEL (in our case above: MN1) needs to be assigned to the Client Wallet address which has the 6250 coin deposited the same in your Client Wallet.
This has to be identical in your masternode.conf file on the Client, where you start the MN from.


