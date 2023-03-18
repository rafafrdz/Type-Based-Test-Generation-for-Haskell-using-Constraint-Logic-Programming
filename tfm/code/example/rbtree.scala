  sealed trait Color
  case object R extends Color
  case object B extends Color

  sealed trait Tree[A]
  case object Nil extends Tree[Nothing]
  case class T[A](color: Color, node: A, tl: Tree[A], tr: Tree[A]) extends Tree[A]
