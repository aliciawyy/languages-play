import functools
from typing import Callable

_cache = {}

_count = {
    "orig": 0,
    "compute": 0
}


def lru_cache(ignore: set) -> Callable:
    def _lru_cache(func):
        @functools.wraps(func)
        def new_func(*args, **kwargs):
            _count["orig"] += 1
            key = tuple(list(args) + list(kwargs.items()))
            if key in ignore:
                return func(*args, **kwargs)
            elif key not in _cache:
                # print(f"compute {args} and {kwargs}")
                _cache[key] = func(*args, **kwargs)
            return _cache[key]
        return new_func
    return _lru_cache


# @lru_cache({(1, ), (2, )})
def fib(n: int) -> int:
    _count["compute"] += 1
    if n <= 2:
        return 1
    return fib(n - 1) + fib(n - 2)


res = fib(n=20)
print(fib.__name__)
print(res)
print(_cache)
print(f"calling times = {_count}")
