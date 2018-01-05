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
- $HOME=/Users/johndoe 
- SEND_confdir=$HOME/Library/Application Support/SEND (/Users/johndoe/Library/Application Support/SEND)

Unix/Linux: 
- $HOME=/home/johndoe 
- SEND_confdir=$HOME/.send (/home/johndoe/.send)


Windows: 
- $HOME=C:\Users\johndoe
- SEND_confdir=$HOME\AppData\SEND (C:\Users\johndoe\AppData\SEND)
or
- SEND_confdir=$HOME\Application Data\SEND (C:\Users\johndoe\Application Data\SEND)

Wine on Mac OS X:
- $HOME=/Users/johndoe 
- SEND_confdir=$HOME/.wine/drive_c/users/johndoe/Application Data/SEND (/Users/johndoe/.wine/drive_c/users/johndoe/Application Data/SEND)



0. download the latest bootstrap 
1. stop Send-QT
2. open the SEND_confdir (see above for your OS), on macos: $HOME/Library/Application Support/SEND
3. remove the following: blocks chainstate peers.dat
4. unzip the latest bootstrap you've downloaded in the SEND_confdir or move them there
5. double check you now have blocks chainstate and peers.dat again
6. start Send-QT


The peers.dat contains the latest list of nodes to sync the blockchain from. So if you're getting syncing issues, like seeing no nodes to sync to, this will fix it.


