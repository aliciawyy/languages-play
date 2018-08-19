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

val priceList = List(10, 2, 5, 11)
println("Scala higher order function exploration")
println("original list: " + priceList)
println(priceList find { price => price > 5 })
println(priceList filter { _ > 5 })
println(priceList map { _ * 2 })
println(priceList reduce { (a, b) => a + b })
println(priceList.sum)
