from typing import Tuple


def get_closest(arr, target) -> Tuple[int, int]:
    """
    Find the closest number to the target in an sorted array arr
    """
    start = 0
    end = len(arr) - 1
    while start < end:
        mid = (start + end) // 2
        if arr[start] == target or arr[end] == target or arr[mid] == target:
            return target, target
        if arr[mid] < target:
            if start == mid:
                break
            start = mid
        else:
            if end == mid:
                break
            end = mid
    return arr[start], arr[end]


def main(arr, target):
    arr = list(arr)
    result = get_closest(arr, target)
    print(f"Search for {target} in {arr}: {result}")


class Solution:
    def threeSumClosest(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        nums = sorted(nums)
        result = sum(nums[-3:])
        diff = abs(result - target)
        n = len(nums) - 1
        print(nums)
        for i, num in enumerate(nums[:-2]):
            j = i + 1
            k = n
            while j < k:
                candidate = num + nums[j] + nums[k]
                candidate_diff = abs(candidate - target)
                if candidate_diff == 0:
                    return target
                print(j, k, candidate, candidate_diff)
                if candidate_diff < diff:
                    result = candidate
                    diff = candidate_diff

                if candidate < target:
                    j += 1
                else:
                    k -= 1
        return result


if __name__ == "__main__":
    print(Solution().threeSumClosest([0, 2, 1, -3], 1))
    #print(Solution().threeSumClosest([1,2,4,8,16,32,64,128], 82))
    main(range(1, 15, 2), 8)
    main(range(1, 15, 2), 11)
