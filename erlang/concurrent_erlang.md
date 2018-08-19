# Concurrent Erlang

Erlang's concurrency is based on message passing and the actor model (processes-based concurrency).

When you send a message to an actor, you place an object on its queue, the actor reads the message
and takes action.

## Concurrency vs Parallelism
In many places both words refer to the same concept, but in the context of Erlang

- _concurrency_ refers to the idea of having many actors running independently, but not necessarily all at the same time.
- _parallelism_ is having many actors running exactly at the same time.

### Actor vs Thread
- An _actor_ changes its own state and accesses other actors only through closely controlled queue.
- _Threads_ ca change each other's state without restriction.

## Three primitives for Erlang concurrency
- spawning new processes
- sending messages
- receiving messages
