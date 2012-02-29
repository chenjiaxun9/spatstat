\name{flipxy}
\alias{flipxy}
\alias{flipxy.owin}
\alias{flipxy.ppp}
\alias{flipxy.psp}
\alias{flipxy.im}
\title{Exchange X and Y Coordinates}
\description{
  Exchanges the \eqn{x} and \eqn{y} coordinates in a spatial dataset.
}
\usage{
 flipxy(X)
 \method{flipxy}{owin}(X)
 \method{flipxy}{ppp}(X)
 \method{flipxy}{psp}(X)
 \method{flipxy}{im}(X)
}
\arguments{
  \item{X}{Spatial dataset. An object of class
    \code{"owin"}, \code{"ppp"}, \code{"psp"} or \code{"im"}.
  }
}
\value{
  Another object of the same type, representing the
  result of swapping the \eqn{x} and \eqn{y} coordinates.
}
\details{
  This function swaps the \eqn{x} and \eqn{y} coordinates of a spatial
  dataset. This could also be performed using the command \code{\link{affine}},
  but \code{flipxy} is faster.
  
  The function \code{\link{flipxy}} is generic, with methods
  for the classes of objects listed above.
}
\seealso{
  \code{\link{affine}},
  \code{\link{rotate}},
  \code{\link{shift}}
}
\examples{
  data(cells)
  X <- flipxy(cells)
}
\author{Adrian Baddeley
  \email{Adrian.Baddeley@csiro.au}
  \url{http://www.maths.uwa.edu.au/~adrian/}
  and Rolf Turner
  \email{r.turner@auckland.ac.nz}
}
\keyword{spatial}
\keyword{math}