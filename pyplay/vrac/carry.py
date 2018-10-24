def numberOfArithmeticSlices(A):
    """
    :type A: List[int]
    :rtype: int
    """
    N = len(A)
    if N < 3:
        return 0

    cnt = 2
    previous_diff = A[1] - A[0]
    result = 0
    for i, num in enumerate(A[2:], 1):
        current_diff = num - A[i]
        print(i, cnt, result)
        if current_diff == previous_diff:
            cnt += 1
        elif cnt >= 3:
            result += (cnt - 1) * (cnt - 2) // 2
            cnt = 2
        previous_diff = current_diff
    print(i, cnt, result)
    if cnt >= 3:
        result += (cnt - 1) * (cnt - 2) // 2

    return result


result_ = numberOfArithmeticSlices([1,2,3,8,9,10])
print(result_)



