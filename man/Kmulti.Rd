\name{Kmulti}
\alias{Kmulti}
\title{
  Marked K-Function
}
\description{
  For a marked point pattern, 
  estimate the multitype \eqn{K} function
  which counts the expected number of points of subset \eqn{J}
  within a given distance from a typical point in subset \code{I}.
}
\synopsis{
Kmulti(X, I, J, r=NULL, breaks=NULL, \dots)
}
\usage{
Kmulti(X, I, J)
Kmulti(X, I, J, r)
Kmulti(X, I, J, breaks)
}
\arguments{
  \item{X}{The observed point pattern, 
    from which an estimate of the multitype \eqn{K} function
    \eqn{K_{IJ}(r)}{KIJ(r)} will be computed.
    It must be a marked point pattern.
    See under Details.
  }
  \item{I}{Subset of points of \code{X} from which distances are
    measured. 
  }
  \item{J}{Subset of points in \code{X} to which distances are measured.
  }
  \item{r}{numeric vector. The values of the argument \eqn{r}
    at which the multitype \eqn{K} function
    \eqn{K_{IJ}(r)}{KIJ(r)} should be evaluated.
    There is a sensible default.
    First-time users are strongly advised not to specify this argument.
    See below for important conditions on \eqn{r}.
  }
  \item{breaks}{An alternative to the argument \code{r}.
    Not normally invoked by the user. See the \bold{Details} section.
  }
}
\value{
  A data frame containing three numeric columns 
  \item{r}{the values of the argument \eqn{r} 
    at which the function \eqn{K_{IJ}(r)}{KIJ(r)} has been  estimated
  }
  \item{border}{the ``reduced sample'' or ``border correction''
    estimator of \eqn{K_{IJ}(r)}{KIJ(r)}
  }
  \item{theo}{the theoretical value of  \eqn{K_{IJ}(r)}{KIJ(r)}
    for a marked Poisson process, namely \eqn{\pi r^2}{pi * r^2}
  }
}
\details{
  The function \code{Kmulti}
  generalises \code{\link{Kest}} (for unmarked point
  patterns) and \code{\link{Kdot}} and \code{\link{Kcross}} (for
  multitype point patterns) to arbitrary marked point patterns.

  Suppose \eqn{X_I}{X[I]}, \eqn{X_J}{X[J]} are subsets, possibly
  overlapping, of a marked point process.
  The multitype \eqn{K} function 
  is defined so that
  \eqn{\lambda_J K_{IJ}(r)}{lambda[J] KIJ(r)} equals the expected number of
  additional random points of \eqn{X_J}{X[J]} 
  within a distance \eqn{r} of a
  typical point of  \eqn{X_I}{X[I]}.
  Here \eqn{\lambda_J}{lambda[J]}
  is the intensity of \eqn{X_J}{X[J]} 
  i.e. the expected number of points of \eqn{X_J}{X[J]} per unit area.
  The function \eqn{K_{IJ}}{KIJ} is determined by the 
  second order moment properties of \eqn{X}.

  The argument \code{X} must be a point pattern (object of class
  \code{"ppp"}) or any data that are acceptable to \code{\link{as.ppp}}.

  The arguments \code{I} and \code{J} specify two subsets of the
  point pattern. They may be logical vectors of length equal to
  \code{X$n}, or integer vectors with entries in the range 1 to
  \code{X$n}, etc.

  The argument \code{r} is the vector of values for the
  distance \eqn{r} at which \eqn{K_{IJ}(r)}{KIJ(r)} should be evaluated. 
  It is also used to determine the breakpoints
  (in the sense of \code{\link{hist}})
  for the computation of histograms of distances.

  First-time users would be strongly advised not to specify \code{r}.
  However, if it is specified, \code{r} must satisfy \code{r[1] = 0}, 
  and \code{max(r)} must be larger than the radius of the largest disc 
  contained in the window. 

  This algorithm assumes that \code{X} can be treated
  as a realisation of a stationary (spatially homogeneous) 
  random spatial point process in the plane, observed through
  a bounded window.
  The window (which is specified in \code{X} as \code{X$window})
  may have arbitrary shape.
  Biases due to edge effects are
  treated in the same manner as in \code{\link{Kest}}.

  There are several alternative estimators of \eqn{K}
  based on different ``edge corrections''. 
  The current implementation computes only the ``border correction''
  (or ``reduced sample'') estimator
  (Ripley, 1988; Baddeley, 2000).

  The pair correlation function can also be applied to the
  result of \code{Kmulti}; see \code{\link{pcf}}.

}
\references{
  Cressie, N.A.C. \emph{Statistics for spatial data}.
    John Wiley and Sons, 1991.

  Diggle, P.J. \emph{Statistical analysis of spatial point patterns}.
    Academic Press, 1983.

  Diggle, P. J. (1986).
  Displaced amacrine cells in the retina of a
  rabbit : analysis of a bivariate spatial point pattern. 
  \emph{J. Neurosci. Meth.} \bold{18}, 115--125.
 
  Harkness, R.D and Isham, V. (1983)
  A bivariate spatial point pattern of ants' nests.
  \emph{Applied Statistics} \bold{32}, 293--303
 
  Lotwick, H. W. and Silverman, B. W. (1982).
  Methods for analysing spatial processes of several types of points.
  \emph{J. Royal Statist. Soc. Ser. B} \bold{44}, 406--413.

  Ripley, B.D. \emph{Statistical inference for spatial processes}.
  Cambridge University Press, 1988.

  Stoyan, D, Kendall, W.S. and Mecke, J.
  \emph{Stochastic geometry and its applications}.
  2nd edition. Springer Verlag, 1995.

  Van Lieshout, M.N.M. and Baddeley, A.J. (1999)
  Indices of dependence between types in multivariate point patterns.
  \emph{Scandinavian Journal of Statistics} \bold{26}, 511--532.

}
\section{Warnings}{
  The function \eqn{K_{IJ}}{KIJ} is not necessarily differentiable.

  The border correction (reduced sample) estimator of
  \eqn{K_{IJ}}{KIJ} used here is pointwise approximately 
  unbiased, but need not be a nondecreasing function of \eqn{r},
  while the true  \eqn{K_{IJ}}{KIJ} must be nondecreasing.
}
\seealso{
 \code{\link{Kcross}},
 \code{\link{Kdot}},
 \code{\link{Kest}},
 \code{\link{pcf}}
}
\examples{
    \dontrun{library(spatstat)}
    data(longleaf)
     # Longleaf Pine data: marks represent diameter
    \dontrun{
    K <- Kmulti(longleaf, longleaf$marks <= 15, longleaf$marks >= 25)
    }
    \testonly{
    sub <- longleaf[seq(1,longleaf$n, by=50), ]
    K <- Kmulti(sub, sub$marks <= 15, sub$marks >= 25)
    }    
    \dontrun{plot(K$r, K$border,
                  xlab="r", ylab="Kmulti(r)",
                  type="l", ylim=c(0,1))}

    # Poisson theoretical curve
    \dontrun{lines(K$r, K$theo, lty=2)}

}
\author{Adrian Baddeley
  \email{adrian@maths.uwa.edu.au}
  \url{http://www.maths.uwa.edu.au/~adrian/}
  and Rolf Turner
  \email{rolf@math.unb.ca}
  \url{http://www.math.unb.ca/~rolf}
}
\keyword{spatial}

