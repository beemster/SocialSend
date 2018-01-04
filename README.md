# socialsend
socialsend build

This is a dockerfile to create the socialsend client.
Originated as a client to run in docker under Mac Os X as the macos client is not very well supported.

Built on linux:xenial with db4.8 for backwards wallet compatibility


# invocation

To start using it, run it as follows:

docker run -v /path/to/send-config-dir:/home/send/.send [-d|-it] bram/socialsend

Configs will be created.



