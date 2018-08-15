bob := Object clone
bob talk := method(
  "Frank, are there rocks ahead?" println
  yield
  "No more rhymes now, I mean it." println
  yield
)

frank := Object clone
frank rhyme := method(
  yield
  "If there are, we are all dead" println
  yield
  "Anyone wants a peanut?" println
)

bob @@talk; frank @@rhyme

Coroutine currentCoroutine pause
