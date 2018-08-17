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

def rubyStyleForLoopLambda {
  println("for loop using Ruby-style iteration with lambda function")
  args.foreach {a => println(a)}
}
rubyStyleForLoopLambda

def rubyStyleForLoop {
  println("for loop using Ruby-style iteration")
  args.foreach {println}
}
rubyStyleForLoop

println("Exclusive range")
('a' until 'e').foreach {println} // exclusive
println("Inclusive range")
('a' to 'e').foreach {println} // inclusive
(10 to 0 by -5).foreach {println}

// error if trying to access person._3
val person = ("Elvis", "Soldier")
println("Tuple example", person._1, person._2)
