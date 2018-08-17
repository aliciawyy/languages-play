class Compass {
  val directions = List("north", "east", "south", "west")
  var bearing = 0
  println("Initial bearing is " + direction)

  // one line method definition
  def direction = directions(bearing)

  def inform(turnDirection: String) = println(
    "Turning " + turnDirection + ". Now bearing " + direction
  )

  def turnRight() {
    bearing = (bearing + 1) % directions.length
    inform("right")
  }

  def turnLeft() {
    bearing = (bearing - 1) % directions.length
    if (bearing < 0) { bearing += directions.length }
    inform("left")
  }
}

val compass = new Compass
compass.turnRight
compass.turnRight

compass.turnLeft
compass.turnLeft
compass.turnLeft
println("bearing is " + compass.bearing)
