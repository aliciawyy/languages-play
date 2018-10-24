
def count_carry(m, n):
    carry = 0
    offset = 0
    while m > 0 or n > 0:
        val = m % 10 + n % 10 + offset
        offset = val // 10
        carry += offset

        m = m // 10
        n = n // 10

    return carry


def main():
    while True:
        m, n = [int(s) for s in input().split(" ")]
        if n == m == 0:
            return
        carry = count_carry(m, n)
        if carry == 0:
            print("No carry operation.")
        else:
            s_operation = "operation" if carry == 1 else "operations"
            print(f"{carry} carry {s_operation}.")


if __name__ == "__main__":
    main()
