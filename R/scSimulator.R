
fn <- function(x,target,reference,lambda=1,epsilon=1e-2)
{
  n <- length(reference)
  
  # x ~ target
  x.e <- ecdf(x)
  x.q <- sort(x)
  t.q <- quantile(target, probs = x.e(x.q))
  xt <- sum((x.q-t.q)**2)
  xt <- xt/n
  
  # x ~ reference
  y <- x + epsilon
  y.p <- y / sum(y)
  z <- reference + epsilon
  r.p <- z / sum(z)
  xr <- r.p*log(r.p/y.p)
  xr <- sum(xr)
  
  return(xt+lambda*xr)
}

gr <- function(x,target,reference,lambda=1,epsilon=1e-2)
{
  n <- length(reference)
  
  # x ~ target
  x.s <- sort(x, index.return = T)
  x.e <- ecdf(x)
  x.q <- x.s$x
  t.q <- quantile(target, probs = x.e(x.q))
  xt <- x.q-t.q
  xt <- 2*xt[x.s$ix]
  xt <- xt / n
  
  # x ~ reference
  y <- x + epsilon
  y.z <- sum(y)
  y.p <- y / sum(y)
  z <- reference + epsilon
  r.p <- z / sum(z)
  xr <- -(1-y.p)*r.p/y
  g <- xt+lambda*xr
  
  return(g)
}

scSimulator <- function(target,reference,method=c("bi","qt"),lambda=100,epsilon=1e-2,maxit=100)
{
  method <- match.arg(method)
  toremove <- 0
  if (length(target) < length(reference)){
    target <- c(target, rep(0, length(reference)-length(target)))
  }else if (length(reference) < length(target)){
    toremove <- length(target)-length(reference)
    reference <- c(reference, rep(0, toremove))
  }
  
  require(stats)
  x.init0 <- rmultinom(1, size = sum(target), prob = reference)
  x.init <- preprocessCore::normalize.quantiles.use.target(x.init0, target)
  
  if (method=="qt"){
    z <- x.init
  }else{
    opt <- optim(x.init, fn, gr = gr, 
                 target = target, reference = reference, lambda = lambda, epsilon = epsilon,
                 method = "L-BFGS-B",
                 lower = 0, upper = max(target),
                 control = list(maxit=maxit, trace = 1))
    z <- opt$par
  }
  if (toremove>0){
    z <- z[1:(length(z)-toremove)]
  }
  return(z)
}
