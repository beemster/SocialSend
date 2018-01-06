# Masternode setup

MM: Masternode on a dedicated instance (VPS/dedicated/VM/..)
Client: Client on your local computer

On the masternode (MN) you run sendd (send daemon), it will look at a certain transaction and verify  as a seperate instance.
For it to be recognised as a MN, you need a certain amount of SEND as proof (20180105: 6250 SEND).

This SEND will sit in a seperate client wallet running (mostly) on the Client (your local computer).

Here are the pieces we need:

- SEND_AMOUNT: 6250 at this time (20180105) 
- LABEL: this is the label we're going to use to refer to our MN, only going to be used on the Client side, for example: MN1
- SEND_Address: this address will need to have exactly the right amount of SEND
- TX_ID: ID for the transaction to the SEND_Address used to lock your SEND
- TX_IDX: Index for that TX_ID
- SEND_privkey: Private key for connecting MN with Client
- MN_IP: IP address of the instance you are running the MN
- MN_Port: port to be used to connect to the MN. Default: 50050


Keep a list of all pieces above and fill them in as you go along. You will need them to fill in the config files.

Let's go:
1. Generate private key (SEND_privkey). You can do this on the Client (Debug console) or MN (send-cli): `masternode genkey`
2. Get a new address (SEND_Address) for Coin Locking on the Client (Debug console) and call it with LABEL (ex: MN1): `getaccountaddress LABEL`
3. Transfer exactly SEND_AMOUNT SEND to the address (SEND_Address) generated in the previous step
4. Get the transaction details (TX_ID and TX_IDX) on the Client(Debug console): `masternode outputs`
5. Fill it all in in the config files on the Client and on the MN, see below.
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

You should get a final line like this when it's up todate.
> 2018-01-05 23:24:37 CActiveMasternode::SendMasternodePing() - Relay Masternode Ping vin = CTxIn(COutPoint(24da8ba47e46800a5cb40985e225aadc53eea5be0a6f5a4d03a86a008a80aa9f, 0), scriptSig=)



## Client configs
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

## MN configs

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

