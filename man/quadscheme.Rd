\name{quadscheme}
\alias{quadscheme}
\title{Generate a Quadrature Scheme from a Point Pattern}
\description{
  Generates a quadrature scheme (an object of class \code{"quad"})
  from point patterns of data and dummy points.
}
\synopsis{
 quadscheme(data, dummy=default.dummy(data), \dots)
}
\usage{
 quadscheme(data)
 quadscheme(data, dummy=default.dummy(data), method="grid", \dots)
}
\arguments{
  \item{data}{
    The observed data point pattern.
    An object of class \code{"ppp"}
    or in a format recognised by \code{\link{as.ppp}()}
  }
  \item{dummy}{
    The pattern of dummy points for the quadrature. 
    An object of class \code{"ppp"}
    or in a format recognised by \code{\link{as.ppp}()}
  }
  \item{method}{
    The name of the method for calculating quadrature weights: either
    \code{"grid"} or \code{"dirichlet"}.
  }
  \item{\dots}{
    Parameters of the weighting method (see below)
  }
} 
\value{
  An object of class \code{"quad"} describing the quadrature scheme
  (data points, dummy points, and quadrature weights)
  suitable as the argument \code{Q} of the function \code{\link{mpl}()} for
  fitting a point process model.
}
\details{
  This is the primary method for producing a quadrature schemes
  for use by \code{\link{mpl}}.
  
  The function \code{\link{mpl}} fits a point process model to an
  observed point pattern using 
  the Berman-Turner quadrature approximation (Berman and Turner, 1992;
  Baddeley and Turner, 2000) to the pseudolikelihood of the model. 
  It requires a quadrature scheme consisting of 
  the original data point pattern, an additional pattern of dummy points,
  and a vector of quadrature weights for all these points.
  Such quadrature schemes are represented by objects of class
  \code{"quad"}. See \code{\link{quad.object}} for a description of this class.

  Quadrature schemes are created by the function
  \code{quadscheme}.
  The arguments \code{data} and \code{dummy} specify the data and dummy
  points, respectively. There is a sensible default for the dummy 
  points (provided by \code{\link{default.dummy}}).
  Alternatively the dummy points
  may be specified arbitrarily and given in any format recognised by
  \code{\link{as.ppp}}.
  There are also functions for creating dummy patterns
  including \code{\link{corners}},
  \code{\link{gridcentres}},
  \code{\link{stratrand}} and
  \code{\link{spokes}}.
 
  The quadrature region is the region over which we are
  integrating, and approximating integrals by finite sums.
  If \code{dummy} is a point pattern object (class \code{"ppp"})
  then the quadrature region is taken to be \code{dummy$window}.
  If \code{dummy} is just a list of \eqn{x, y} coordinates
  then the quadrature region defaults to the observation window
  of the data pattern, \code{data$window}.

  If \code{method = "grid"} then the optional arguments (for \code{\dots}) are 
  \code{(nx = default.ngrid(data), ny=nx)}.
  The quadrature region (see below) is divided into
  an \code{nx} by \code{ny} grid of rectangular tiles. The weight for each
  quadrature point is the area of a tile divided by the number of
  quadrature points in that tile. 
 
  If \code{method="dirichlet"} then the optional arguments are
  \code{(exact=T)}.
  The quadrature points (both data and dummy) are used to construct the
  Dirichlet tessellation. The quadrature weight of each point is the
  area of its Dirichlet tile inside the quadrature region.

}
\references{
  Baddeley, A. and Turner, R.
  Practical maximum pseudolikelihood for spatial point patterns.
  \emph{Australian and New Zealand Journal of Statistics}
  \bold{42} (2000) 283--322.
 
  Berman, M. and Turner, T.R. 
  Approximating point process likelihoods with GLIM.
  \emph{Applied Statistics} \bold{41} (1992) 31--38.
}
\seealso{
  \code{\link{mpl}},
  \code{\link{as.ppp}},
  \code{\link{quad.object}},
  \code{\link{gridweights}},
  \code{\link{dirichlet.weights}},
  \code{\link{corners}},
  \code{\link{gridcentres}},
  \code{\link{stratrand}},
  \code{\link{spokes}}
}
\examples{
  \dontrun{
  library(spatstat)
  }
  data(simdat)
  P <- simdat
  D <- default.dummy(P, 100)
  Q <- quadscheme(P, D, "grid")
  mpl(Q, ~ x, Strauss(0.05), rbord=0.1)
 
  Q <- quadscheme(P, , "grid")
}
\author{Adrian Baddeley
  \email{adrian@maths.uwa.edu.au}
  \url{http://www.maths.uwa.edu.au/~adrian/}
  and Rolf Turner
  \email{rolf@math.unb.ca}
  \url{http://www.math.unb.ca/~rolf}
}
\keyword{spatial}