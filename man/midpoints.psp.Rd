\name{midpoints.psp}
\alias{midpoints.psp}
\title{Midpoints of Line Segment Pattern}
\description{
  Computes the midpoints of each line segment
  in a line segment pattern.
}
\usage{
  midpoints.psp(x)
}
\arguments{
  \item{x}{
    A line segment pattern (object of class \code{"psp"}).
  }
}
\value{
  Point pattern (object of class \code{"ppp"}).
}
\details{
  The midpoint of each line segment is computed.
}
\seealso{
  \code{\link{summary.psp}},
  \code{\link{lengths.psp}},
  \code{\link{angles.psp}}
}
\examples{
  a <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  b <- midpoints.psp(a)   
}
\author{
  Adrian Baddeley
  \email{adrian@maths.uwa.edu.au}
  \url{http://www.maths.uwa.edu.au/~adrian/}
  and Rolf Turner
  \email{rolf@math.unb.ca}
  \url{http://www.math.unb.ca/~rolf}
}
\keyword{spatial}
