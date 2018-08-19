import scala.actors._
import scala.actors.Actor._

case object Poke
case object Feed

class Kid extends Actor {
  def act() {
    loop {
      react {
        case Poke => {
          println("Ow...")
          println("Quit it...")
        }
        case Feed => {
          println("Gurgle...")
          println("Burp...")
        }
      }
    }
  }
}

val bart = new Kid().start
val lisa = new Kid().start
println("ready to pole and feed...")
bart ! Poke
lisa ! Poke
