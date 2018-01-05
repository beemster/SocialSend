# socialsend
socialsend wallet/masternode 

This is a dockerfile for the socialsend client.
You can use this as a client wallet for Mac and also as quick way to setup a masternode.

Built on linux:xenial with db4.8 for backwards wallet compatibility


# Invocation

Run it as follows:

docker run -v /path/to/send-config-dir:/home/send/.send [-d|-it] bram/socialsend

Configs will be created.


