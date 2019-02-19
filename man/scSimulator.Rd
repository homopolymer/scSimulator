\name{scSimulator}
\alias{scSimulator}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{scSimulator
%%  ~~function to do ... ~~
}
\description{It is to simulate transcriptome signature of a cell type by mimicing the use of the interesting scRNA-seq platform.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
scSimulator(target, reference, method = c("bi", "qt"), lambda = 100, epsilon = 0.01, maxit = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{target}{An example data of the interesting scRNA-seq platform
%%     ~~Describe \code{target} here~~
}
  \item{reference}{An example data of the cell type to be simulated
%%     ~~Describe \code{reference} here~~
}
  \item{method}{bi stands for the use of optimization, and qt stands for quantile transformation
%%     ~~Describe \code{method} here~~
}
  \item{lambda}{The weight used in objective function
%%     ~~Describe \code{lambda} here~~
}
  \item{epsilon}{A small value used in Kullback-Leibler divergence to avoid zeros
%%     ~~Describe \code{epsilon} here~~
}
  \item{maxit}{The maximum number of iterations
%%     ~~Describe \code{maxit} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{Return a numeric vector
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
