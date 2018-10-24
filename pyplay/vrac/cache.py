import functools
from typing import Callable

_cache = {}


def lru_cache(ignore: set) -> Callable:
    def _lru_cache(func):
        @functools.wraps(func)
        def new_func(*args, **kwargs):
            key = tuple(list(args) + list(kwargs.items()))
            if key in ignore:
                return func(*args, **kwargs)
            elif key not in _cache:
                print(f"compute {args} and {kwargs}")
                _cache[key] = func(*args, **kwargs)
            return _cache[key]
        return new_func
    return _lru_cache


@lru_cache({(1, ), (2, )})
def fib(n: int) -> int:
    if n <= 2:
        return 1
    return fib(n - 1) + fib(n - 2)


res = fib(n=10)
print(fib.__name__)
print(res)
print(_cache)
