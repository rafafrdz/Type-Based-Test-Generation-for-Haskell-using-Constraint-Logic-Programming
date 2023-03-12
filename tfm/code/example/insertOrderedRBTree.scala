  sealed trait Color
  case object R extends Color
  case object B extends Color

  sealed trait Tree[A]
  case object Nil extends Tree[Nothing]
  case class T[A](color: Color, node: A, tl: Tree[A], tr: Tree[A]) extends Tree[A]


  def makeBlack[A]: Tree[A] => Tree[A] = {
    case ttree@T(_, _, _, _) => ttree.copy(color = B)
    case t => t
  }

  def balance[A]: Tree[A] => Tree[A] = {
    case T(B, z, T(R, y, T(R, x, a, b), c), d) => T(R, y, T(B, x, a, b), T(B, z, c, d))
    case T(B, z, T(R, x, a, T(R, y, b, c)), d) => T(R, y, T(B, x, a, b), T(B, z, c, d))
    case T(B, x, a, T(R, z, T(R, y, b, c), d)) => T(R, y, T(B, x, a, b), T(B, z, c, d))
    case T(B, x, a, T(R, y, b, T(R, z, c, d))) => T(R, y, T(B, x, a, b), T(B, z, c, d))
    case t => t
  }

  def insert[A <: Ordered[A]]: A => Tree[A] => Tree[A] =
    (x: A) => {
      def insertAux: Tree[A] => Tree[A] = {
        case Nil => T(R, x, Nil, Nil)
        case ttree@T(c, y, tl, tr) =>
          if (x < y) balance(T(c, y, insertAux(tl), tr))
          else if (x == y) ttree
          else balance(T(c, y, tl, insertAux(tr)))
      }

      makeBlack andThen insertAux
    }