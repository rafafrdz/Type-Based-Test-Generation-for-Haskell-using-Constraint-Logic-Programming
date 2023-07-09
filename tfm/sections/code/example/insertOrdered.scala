  def insertOrdered[A <: Ordered[A]]: A => List[A] => List[A] =
    (a: A) => {
      case Nil => List(a)
      case as@ ::(x, xs) => if (a <= x) a :: as else x :: insertOrdered(a)(xs)
    }