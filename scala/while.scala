/* public is the default visibility for scala */
def whileLoop {
  var i = 1
  while(i <= 3) {
    println(i)
    i += 1
  }
}
whileLoop

/*
 Run with
 scala while.scala its all in the grind
 */
def forLoop {
  println("for loop using Java-style iteration")
  for(i <- 0 until args.length) {
    println(args(i))
  }
}
forLoop
