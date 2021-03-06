\name{deriv.fv}
\alias{deriv.fv}
\title{
  Calculate Derivative of Function Values
}
\description{
  Applies numerical differentiation to the values
  in selected columns of a function value table.
}
\usage{
\method{deriv}{fv}(expr, which = "*", ...,
          method=c("spline", "numeric"),
          kinks=NULL,
          periodic=FALSE,
          Dperiodic=periodic)
}
\arguments{
  \item{expr}{
    Function values to be differentiated.
    A function value table (object of class \code{"fv"},
    see \code{\link{fv.object}}).
  }
  \item{which}{
    Character vector identifying which columns of the table
    should be differentiated. Either a vector containing names
    of columns, or one of the wildcard strings \code{"*"} or \code{"."}
    explained below.
  }
  \item{\dots}{
    Extra arguments passed to \code{\link[stats]{smooth.spline}}
    to control the differentiation algorithm, if \code{method="spline"}.
  }
  \item{method}{
    Differentiation method. A character string, partially matched
    to either \code{"spline"} or \code{"numeric"}.
  }
  \item{kinks}{
    Optional vector of \eqn{x} values where the derivative is
    allowed to be discontinuous. 
  }
  \item{periodic}{
    Logical value indicating whether the function \code{expr}
    is periodic. 
  }
  \item{Dperiodic}{
    Logical value indicating whether the resulting derivative
    should be a periodic function.
  }
}
\details{
  This command performs numerical differentiation on the function values in
  a function value table (object of class \code{"fv"}).
  The differentiation is performed either by 
  \code{\link[stats]{smooth.spline}} or by
  a naive numerical difference algorithm.

  The command \code{\link{deriv}} is generic. This is the
  method for objects of class \code{"fv"}.

  Differentiation is applied to every column
  (or to each of the selected columns) of function values in turn,
  using the function argument as the \eqn{x} coordinate
  and the selected column as the \eqn{y} coordinate.
  The original function values are then replaced by the corresponding
  derivatives.

  The optional argument \code{which} specifies which of the
  columns of function values in \code{expr} will be differentiated.
  The default (indicated by the wildcard \code{which="*"})
  is to differentiate all function values, i.e.\ all columns except the
  function argument. Alternatively \code{which="."} designates
  the subset of function values that are displayed in the default plot.
  Alternatively \code{which} can be a character vector containing the
  names of columns of \code{expr}.

  If the argument \code{kinks} is given, it should be a numeric vector
  giving the discontinuity points of the function: the value or values
  of the function argument at which the function is
  not differentiable. Differentiation will be performed separately on
  intervals between the discontinuity points.

  If \code{periodic=TRUE} then the function \code{expr} is taken to be
  periodic, with period equal to the range of the function
  argument in \code{expr}. The resulting derivative is periodic.

  If \code{periodic=FALSE} but \code{Dperiodic=TRUE}, then the
  \emph{derivative} is assumed to be periodic. This would be
  appropriate if \code{expr} is the cumulative distribution function
  of an angular variable, for example. 
}
\value{
  Another function value table (object of class \code{"fv"})
  of the same format.
}
\author{Adrian Baddeley \email{Adrian.Baddeley@curtin.edu.au}
  
  
  and Rolf Turner \email{r.turner@auckland.ac.nz}
  
}
\seealso{
  \code{\link{with.fv}},
  \code{\link{fv.object}},
  \code{\link[stats]{smooth.spline}}
}
\examples{
   G <- Gest(cells)
   plot(deriv(G, which=".", spar=0.5))
   A <- pairorient(redwood, 0.05, 0.15)
   DA <- deriv(A, spar=0.6, Dperiodic=TRUE)
}
\keyword{spatial}
\keyword{math}
\keyword{nonparametric}

