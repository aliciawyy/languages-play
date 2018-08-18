// return type is optional, parenthesis is also optional
def double(x: Int): Int = {
  val y = x * 2
  println(y)
  return y
}

println("double 3 = ")
double(3)
println("Range 0..5 double = ")
(0 until 5).foreach(double)
