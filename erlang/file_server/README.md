# File Server

This project implements a simple file server with Erlang to transfer files between two machines.

The essence of the problem is to create parallel processes that can send and receive messages.

In Erlang processes are used to structure the solutions of the problems. Thinking about the process structure and thinking about the messages that are sent between processes and what information the message contain are central to the way of Erlang programming.

## Instructions

To run the file server, you can first compile the server and client code with `c(afile_server).` and `c(afile_client).`. The next is to create a process `FileServer` with

```
FileServer = afile_server:start(".").
```

Send the message to the process `FileServer`

```
 FileServer ! {self(), list_dir}.
```

With the client code, the file list in the directory `.` can be retrieved with

```
afile_client:ls(FileServer).
```

To get the content of a specific file

```
 afile_client:get_file(FileServer, "afile_client.erl").
```
