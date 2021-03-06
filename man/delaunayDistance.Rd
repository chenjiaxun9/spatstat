\name{delaunayDistance}
\alias{delaunayDistance}
\title{Distance on Delaunay Triangulation}
\description{
  Computes the graph distance in the Delaunay triangulation
  of a point pattern.
}
\usage{
delaunayDistance(X)
}
\arguments{
  \item{X}{Spatial point pattern (object of class \code{"ppp"}).}
}
\details{
  The Delaunay triangulation of a spatial point pattern \code{X}
  is defined as follows. First the Dirichlet/Voronoi tessellation of \code{X}
  computed; see \code{\link{dirichlet}}. Then two points of \code{X}
  are defined to be Delaunay neighbours if their Dirichlet/Voronoi tiles
  share a common boundary. Every pair of Delaunay neighbours is
  joined by a straight line.

  The \emph{graph distance} 
  in the Delaunay triangulation between two points \code{X[i]} and \code{X[j]}
  is the minimum number of edges of the Delaunay triangulation
  that must be traversed to go from \code{X[i]} to \code{X[j]}.

  This command returns a matrix \code{D} such that
  \code{D[i,j]} is the graph distance
  between \code{X[i]} and \code{X[j]}.
}
\value{
  A symmetric square matrix with integer entries.
}
\seealso{
  \code{\link{delaunay}},
  \code{\link{delaunayNetwork}}
}
\examples{
  X <- runifpoint(20)
  M <- delaunayDistance(X)
  plot(delaunay(X), lty=3)
  text(X, labels=M[1, ], cex=2)
}
\author{
Adrian Baddeley \email{Adrian.Baddeley@curtin.edu.au}


Rolf Turner \email{r.turner@auckland.ac.nz}

and Ege Rubak \email{rubak@math.aau.dk}

}
\keyword{spatial}
\keyword{manip}
