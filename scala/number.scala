/*
 To define a scala function, a type annotation must follow every
 function parameter.
 return type is optional, parenthesis is also optional
 */
def double(x: Int): Int = {
  val y = x * 2
  println(y)
  y
}

println("double 3 = ")
double(3)
println("Range 0..5 double = ")
(0 until 5).foreach(double)

def max(x: Int, y: Int) = if (x > y) x else y
println("max(1, 4) = " + max(1, 4))
