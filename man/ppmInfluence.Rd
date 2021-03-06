\name{ppmInfluence}
\alias{ppmInfluence}
\title{
  Leverage and Influence Measures for Spatial Point Process Model
}
\description{
  Calculates all the leverage and
  influence measures described in \code{\link{influence.ppm}},
  \code{\link{leverage.ppm}} and \code{\link{dfbetas.ppm}}.
}
\usage{
   ppmInfluence(fit,
                what = c("leverage", "influence", "dfbetas"),
                \dots,
                iScore = NULL, iHessian = NULL, iArgs = NULL,
                drop = FALSE,
                fitname = NULL)
}
\arguments{
  \item{fit}{
    A fitted point process model of class \code{"ppm"}.
  }
  \item{what}{
    Character vector specifying which quantities are to be calculated.
    Default is to calculate all quantities.
  }
  \item{\dots}{
    Ignored.
  }
  \item{iScore,iHessian}{
    Components of the score vector and Hessian matrix for
    the irregular parameters, if required. See Details.
  }
  \item{iArgs}{
    List of extra arguments for the functions \code{iScore},
    \code{iHessian} if required.
  }
  \item{drop}{
    Logical. Whether to include (\code{drop=FALSE}) or
    exclude (\code{drop=TRUE}) contributions from quadrature
    points that were not used to fit the model.
  }
  \item{fitname}{
    Optional character string name for the fitted model \code{fit}.
  }
}
\details{
  This function calculates all the
  leverage and influence measures
  described in \code{\link{influence.ppm}}, \code{\link{leverage.ppm}}
  and \code{\link{dfbetas.ppm}}.

  When analysing large datasets, the user can
  call \code{ppmInfluence} to perform the calculations efficiently,
  then extract the leverage and influence values as desired.
}
\value{
  A list containing the leverage and influence measures specified by
  \code{what}.
}
\author{
  Adrian Baddeley \email{Adrian.Baddeley@curtin.edu.au}
}
\seealso{
  \code{\link{leverage.ppm}},
  \code{\link{influence.ppm}},
  \code{\link{dfbetas.ppm}}
}
\examples{
   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X ~ x+y)
   fI <- ppmInfluence(fit)
   fI$influence
   fI$leverage
   fI$dfbetas
}
\keyword{spatial}
\keyword{models}
