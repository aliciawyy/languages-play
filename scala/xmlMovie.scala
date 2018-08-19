val movies =
  <movies>
    <movie genre="action">Pirates of the Caribbean</movie>
    <movie genre="fairytale">Edward Scissorhand</movie>
  </movies>

println(movies.text)

val movieNodes = movies \ "movie"

println(movieNodes)
println(movieNodes(0))
println(movieNodes(0) \ "@genre") // "action"
