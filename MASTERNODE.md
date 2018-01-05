# Masternode setup

MM: Masternode on a dedicated instance (VPS/dedicated/VM/..)
Client: Client on your local computer

On the masternode (MN) you run sendd (send daemon), it will look at a certain transaction and verify  as a seperate instance.
For it to be recognised as a MN, you need a certain amount of SEND as proof (20180105: 6250 SEND).

This SEND will sit in a seperate client wallet running (mostly) on the Client (your local computer).

Here are the pieces we need:

- Address with SEND: 
- TX for sending the SEND to that address:
- Index for that TX: 
- Generated private key:
- IP and port of the MN:



On the Client do the following:
1. Generate private key (it doesn't really matter if you do this on the Client or MN):  Debug console: masternode genkey 
2. Get Address for Coin Locking - getaccountaddress LABEL
3. Transfer exact coins to the address you got in step 2
4. do  masternode outputs. It should give you transaction ID and output index


## MN configs

masternode.conf: 
	§nothing relevant, commented lines are ok, otherwise empty unless you need advanced stuff

send.conf:
	rpcuser=sendrpc
rpcpassword=<rpcpassword for MN>
pcallowip=127.0.0.1
#staking=1
server=1
listen=1
daemon=1
logtimestamps=1
maxconnections=256
masternode=1
masternodeprivkey=<private key you generated on the client or MN>
masternodeaddr=<MN IP>:50050
externalip=<MN IP>:50050




