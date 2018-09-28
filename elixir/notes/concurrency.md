# Elixir Concurrency Model

## Process

Processes in Erlang VM are lightweight and run across all CPUs. It's common to have thousands of concurrent processes in an Elixir application.

A process can be created with `spawn/3`

## Message Passing

Processes rely on message passing to communicate (unlike threads that share resource).

- `send/2` sends message to pid
- `receive` match message and has the same format as `case do ... end` in elixir

If you send a message that does not match any pattern defined in the `receive` function, the message will linger in the mailbox. While sending a message that gets through the pattern matching but creates an error will halt the process where the error occurred.

## Process Linking

`spawn_link/3` creates a process and links it to the current process. When a process fails, it sends a tuple explanation to other processes that are linked to it.

## Process Monitoring

`spawn_monitor/3` is used when we want to get information of a process without linking two processes together.
