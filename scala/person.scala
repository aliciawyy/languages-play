class Person(val firstName: String) {
  println("outer constructor")

  // Auxiliary constructor
  def this(firstName: String, lastName: String) {
    this(firstName) // invoke the primary constructor
    println("inner constructor")
  }

  def hi = println("Hi " + firstName)

  def talk(message: String) = println(firstName + " says " + message)

  def id(): String = firstName
}

// object defines a singleton object, it can be used for class methods
object Person {
  def hello = println("hello")
}

class Employee(override val firstName: String,
                        val number: Int) extends Person(firstName) {
  override def talk(message: String) = println(
    firstName + " with number " + number + " says " + message
  )
  override def id(): String = number.toString
}


// tests
Person.hello

val bob = new Person("Bob")
bob.hi
// outer constructor
// Hi Bob
val kate = new Person("Kate", "Dylan")
kate.hi
// outer constructor
// inner constructor
// Hi Kate

kate.talk("Morning")
println("kate's id is " + kate.id)

val employee = new Employee("Clair", 31234)
employee.talk("Nice to meet you")
println("Clair's id is " + employee.id)
