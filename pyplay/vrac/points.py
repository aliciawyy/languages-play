"""
Get the pairs of points within a particular distance from a set of points
"""
import math
import sys
from itertools import combinations, combinations_with_replacement
from collections import namedtuple

Point = namedtuple("Point", ["x", "y"])


def dist(two_points):
    p1, p2 = two_points
    return math.sqrt((p1.x - p2.x)**2 + (p1.y - p2.y)**2)


def main(points, threshold):
    return filter(lambda p: dist(p) < threshold, combinations(points, 2))


if __name__ == "__main__":
    n = int(sys.argv[1])
    threshold_ = float(sys.argv[2])
    points_ = map(lambda two_points: Point(*two_points),
                  combinations_with_replacement(range(n), 2))
    points_ = list(points_)
    print(f"number of all points: {len(points_)}")
    print(points_)
    result_ = main(points_, threshold_)
    result_ = list(result_)
    print(f"number of points within {threshold_}: {len(result_)}")
    print(result_[:10])
