# Concurrent Erlang

Erlang's concurrency is based on message passing and the actor model (processes-based concurrency).

When you send a message to an actor, you place an object on its queue, the actor reads the message
and takes action.

## Concurrency vs Parallelism
In many places both words refer to the same concept, but in the context of Erlang

- _concurrency_ refers to the idea of having many actors running independently, but not necessarily all at the same time.
- _parallelism_ is having many actors running exactly at the same time.

Concurrent programs in Erlang are made from sets of communicating sequential processes.

### Actor vs Thread
- An _actor_ changes its own state and accesses other actors only through closely controlled queue.
- _Threads_ ca change each other's state without restriction.
-

### Erlang process

An Erlang _process_ is not an operating process but a lightweight process that is managed by the Erlang system. It is the basic unit of concurrency. All the Erlang processes execute concurrently and independently.

In Erlang, processes share no memory and can interact only with each other by sending messages.

At runtime the Erlang virtual machine automatically distributes the execution of processes over the available CPUs.

**Analogy with OOP**

Modules in Erlang are like classes and processes are like objects in OOP.

**Fault tolerance**

Erlang programs are made up of many small independent processes. Errors in one process cannot accidentally crash another process.


## Three primitives for Erlang concurrency

### Spawning new processes
`spawn` is an Erlang primitive that creates a concurrent process and returns a process identifier. When `spawn` is evaluated, the Erlang runtime system creates a new Erlang process.

### Sending messages

The following lines shows an example that Joe wants to say hello to Susan

```
Susan ! { self(), "Hello from Joe" }
```

The syntax `Pid ! Message` means send the `Message` to the process `Pid`.

### Receiving messages

For Susan's process to receive the message from Joe

```
receive
  {From, Message} ->
  ...
end
```
