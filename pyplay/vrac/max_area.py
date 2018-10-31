class Solution:
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        j = 0
        k = len(height) - 1
        max_area = 0
        while j < k:
            area = min(height[j], height[k]) * (k - j)
            if area > max_area:
                max_area = area
            if height[j] < height[k]:
                j += 1
            else:
                k -= 1

        return max_area


print(Solution().maxArea([1,3,2,5,25,24,5]))