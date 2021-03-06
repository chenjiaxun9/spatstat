\name{lintess}
\alias{lintess}
\title{
  Tessellation on a Linear Network
}
\description{
  Create a tessellation on a linear network.
}
\usage{
lintess(L, df)
}
\arguments{
  \item{L}{
    Linear network (object of class \code{"linnet"}).
  }
  \item{df}{
    Data frame of coordinates of endpoints of the 
    tiles of the tessellation. 
  }
}
\details{
  A tessellation on a linear network \code{L} is a partition of the
  network into non-overlapping pieces (tiles). Each tile consists of one
  or more line segments which are subsets of the line segments connecting
  vertices of the network. A tile can consist of several disjoint pieces.
  
  The data frame \code{df} should have columns named
  \code{seg}, \code{t0}, \code{t1} and \code{tile}.

  Each row of the data frame specifies one sub-segment of the network
  and allocates it to a particular tile.
  
  The \code{seg} column specifies which line segment of the network
  contains the sub-segment. Values of \code{seg} are integer indices
  for the segments in \code{as.psp(L)}.

  The \code{t0} and \code{t1} columns specify the start and end points
  of the sub-segment. They should be numeric values between 0 and 1
  inclusive, where the values 0 and 1 representing the network vertices
  that are joined by this network segment.

  The \code{tile} column specifies which tile of the tessellation
  includes this sub-segment. It will be coerced to a factor and its
  levels will be the names of the tiles.
}
\value{
  An object of class \code{"lintess"}.
  There are methods for printing and plotting this object.
}
\author{
  Adrian Baddeley \email{Adrian.Baddeley@curtin.edu.au} and Greg McSwiggan.
}
\seealso{
  \code{\link{linnet}} for linear networks.
  
  \code{\link{as.linfun.lintess}} and
  \code{\link{as.linim}} to convert to other classes.
}
\examples{
   # tessellation consisting of one tile for each existing segment
   ns <- nsegments(simplenet)
   df <- data.frame(seg=1:ns, t0=0, t1=1, tile=letters[1:ns])
   u <- lintess(simplenet, df)
   u
   plot(u)
}
\keyword{spatial}
\keyword{datagen}

