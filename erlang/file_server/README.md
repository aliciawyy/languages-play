# File Server

This project implements a simple file server with Erlang to transfer files between two machines.

## Instructions

To run the file server, you can first compile the server code with `c(afile_server).` The next is to create a process `FileServer` with

```
FileServer = afile_server:start(".").
```

Send the message to the process `FileServer`

```
 FileServer ! {self(), list_dir}.
```
