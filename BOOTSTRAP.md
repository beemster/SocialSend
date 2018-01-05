# Bootstrapping Social SEND wallet/client

When installing a new client (be it on Mac OS X, Linux or windows) it might take a while to get the blockchain on your computer up to date.

To speed this up you can download the latest bootstrap (a snapshot of the blockchain at a recent date).
Once downloaded you can install this on your client and then getting in sync will happen much faster.


The bootstrap can be found here:
- <a href="https://socialsend.io/#downloads">Social Send Downloads</a>
- Discord: Social Send - SEND #announcements


The instructions for all clients are pretty much the same.

$HOME is the same as '~' and means your account's default (home) directory/folder.

If your accountname is "johndoe" then

Mac OS X: 
$HOME=/Users/johndoe 
SEND conf directory=$HOME/Library/Application Suppport/SEND

Unix/Linux: 
/home/johndoe 
SEND conf directory=$HOME/.send


Windows: 
C:\Users\johndoe
SEND conf directory=$HOME\AppData\SEND
or
SEND conf directory=$HOME\Application Data\SEND

Wine on Mac OS X:
$HOME=/Users/johndoe 
SEND conf directory=$HOME/.wine/drive_C/users/johndoe/Application Data/SEND



1. download the latest bootstrap 
1. stop Send-QT
2. open the SEND config folder (SEND conf directory, see above for your OS): $HOME/Library/Application Support/SEND
3. remove the following: blocks chainstate peers.dat
4. unzip the latest bootstrap you've downloaded in the SEND conf directory or move them there
5. double check you now have blocks chainstate and peers.dat again
6. start Send-QT


The peers.dat contains the latest list of nodes to sync the blockchain from. So if you're getting syncing issues, see no nodes to sync to, this will fix it.


