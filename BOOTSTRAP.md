When installing a new client (be it on Mac OS X, Linux or windows) it might take a while to get the blockchain on your computer up to date.

To speed this up you can download the latest bootstrap (a snapshot of the blockchain at a recent date).
Once downloaded you can install this on your client and then syncing it go much faster.


The instructions for all clients are pretty much the same.

The bootstrap can be found here:
- <a href="https://socialsend.io/#downloads">socialsend Downloads</a>
- Discord: Social Send - SEND #announcements


$HOME is the same as '~' and means /Users/yourusername

Here they are for Mac Os X:
1. download the latest bootstrap 
1. stop Send-QT
2. open the SEND config folder: ~/Library/Application Support/SEND
3. remove blocks chainstate peers.dat
4. unzip the latest bootstrap you've downloaded 
5. double check you now have blocks chainstate and peers.dat again
6. start Send-QT


The peers.dat contains the latest list of nodes to sync the blockchain from. So if you're getting syncing issues, see no nodes to sync to, this will fix it.


For linux/unix the folder is $HOME/.send
For windows the folder is called $HOME/AppData/something

