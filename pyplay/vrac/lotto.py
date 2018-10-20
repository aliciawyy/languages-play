import sys
import random
from itertools import combinations


def get_ticket(uncolored, k, candidates):
    uncolored = set(uncolored)
    ticket = set(uncolored.pop())
    while len(ticket) < k and uncolored:
        ticket = ticket.union(uncolored.pop())

    for _ in range(len(ticket) - k):
        ticket.pop()

    ticket = list(ticket)

    if len(ticket) < k:
        rest_ticket = random.choices(
            list(candidates.difference(ticket)), k=k - len(ticket)
        )
        ticket += rest_ticket

    return sorted(ticket)


def main(n, l, k):
    candidates = set(range(n))
    uncolored = set(combinations(candidates, l))

    tickets = []
    while uncolored:
        ticket = get_ticket(uncolored, k, candidates)
        uncolored.difference_update(combinations(ticket, l))
        print(ticket, uncolored)
        tickets.append(ticket)

    return tickets


if __name__ == "__main__":
    n_set = int(sys.argv[1])
    l_correct = int(sys.argv[2])
    k_slots = int(sys.argv[3])
    print(f"n={n_set}, l_correct={l_correct}, k={k_slots}")
    tickets_ = main(n_set, l_correct, k_slots)
    print(len(tickets_), ":\n", tickets_)
