\name{plot.linim}
\alias{plot.linim}
\title{
  Plot Pixel Image on Linear Network
}
\description{
  Given a pixel image on a linear network,
  the pixel values are displayed
  either as colours or as line widths.
}
\usage{
\method{plot}{linim}(x, ..., style = c("colour", "width"),
             scale, adjust = 1,
             do.plot=TRUE)
}
\arguments{
  \item{x}{
    The pixel image to be plotted. An object of class \code{"linim"}.
  }
  \item{\dots}{
    Extra graphical parameters, passed to \code{\link{plot.im}}
    if \code{style="colour"}, or to \code{\link{polygon}}
    if \code{style="width"}.
  }
  \item{style}{
    Character string specifying the type of plot. See Details.
  }
  \item{scale}{
    Physical scale factor for representing the pixel values as
    line widths. 
  }
  \item{adjust}{
    Adjustment factor for the default scale.
  }
  \item{do.plot}{
    Logical value indicating whether to actually perform the plot.
  }
}
\details{
  This is the \code{plot} method for objects 
  of class \code{"linim"}. Such an object represents
  a pixel image defined on a linear network.

  If \code{style="colour"} (the default) then
  the pixel values of \code{x} are plotted as colours,
  using \code{\link{plot.im}}. 

  If \code{style="width"} then
  the pixel values of \code{x} are used to determine the widths of
  thick lines centred on the line segments of the linear network.
}
\value{
  An (invisible) window (class \code{"owin"}) containing the
  area that will be plotted, including the colour ribbon.
}
\author{
  Adrian Baddeley \email{Adrian.Baddeley@curtin.edu.au}
}
\seealso{
  \code{\link{linim}},
  \code{\link{plot.im}},
  \code{\link{polygon}}
}
\references{
  Ang, Q.W., Baddeley, A. and Nair, G. (2012)
  Geometrically corrected second-order analysis of 
  events on a linear network, with applications to
  ecology and criminology.
  \emph{Scandinavian Journal of Statistics} \bold{39}, 591--617.
}
\examples{
  X <- linfun(function(x,y,seg,tp){y^2+x}, simplenet)
  X <- as.linim(X)
  
  plot(X)
  plot(X, style="width")
}
\keyword{spatial}
