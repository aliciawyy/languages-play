/* Simplist form of pattern matching */
def doChore(chore: String): String = chore match {
  case "dishes" => "clean"
  case "dinner" => "prepared"
  case _ => "I don't know"
}

println(doChore("dishes"))
println(doChore("mow"))

def factorial(n: Int): Int = n match {
  case 0 => 1
  case n if n > 0 => n * factorial(n - 1)
}

println(factorial(0))
println(factorial(3))
