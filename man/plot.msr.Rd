\name{plot.msr}
\alias{plot.msr}
\title{Plot a Signed or Vector-Valued Measure}
\description{
  Plot a signed measure or vector-valued measure.
}
\usage{
  \method{plot}{msr}(x, \dots)
}
\arguments{
  \item{x}{
    The signed or vector measure to be plotted.
    An object of class \code{"msr"} (see \code{\link{msr}}).
  }
  \item{\dots}{
    Extra arguments passed to \code{\link{smooth.ppp}}
    to control the interpolation of the
    continuous density component of \code{x},
    or passed to \code{\link{plot.im}} or \code{\link{plot.ppp}}
    to control the appearance of the plot.
  }
}
\value{
  none.
}
\details{
  This is the \code{plot} method for the class \code{"msr"}.
  
  The continuous density component of \code{x} is interpolated
  from the existing data by \code{\link{smooth.ppp}},
  and then displayed as a colour image by \code{\link{plot.im}}.

  The discrete atomic component of \code{x} is then superimposed on this
  image by plotting the atoms as circles (for positive mass)
  or squares (for negative mass) by \code{\link{plot.ppp}}.
}
\seealso{
  \code{\link{msr}},
  \code{\link{smooth.msr}},
  \code{\link{plot.im}},
  \code{\link{plot.ppp}}
}
\examples{
   example(msr)
   plot(rp)
   plot(rs)
}
\author{Adrian Baddeley
  \email{Adrian.Baddeley@csiro.au}
  \url{http://www.maths.uwa.edu.au/~adrian/}
  and Rolf Turner
  \email{r.turner@auckland.ac.nz}
}
\keyword{spatial}
\keyword{hplot}