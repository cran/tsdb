\name{read_ts_tables}
\alias{read_ts_tables}
\title{
  Read Time-Series Data from Files
}
\description{

  Read time-series data from files and merge them. 

}
\usage{
read_ts_tables(file, dir, t.type = "guess",
               start, end, columns,
               return.class = NULL,
               drop.weekends = TRUE,
               column.names = "\%dir\%/\%file\%::\%column\%",
               backend = "csv",
               read.fn = NULL,
               frequency = "1 sec")
}
\arguments{
  \item{file}{
    character
}
  \item{dir}{
    character
}
  \item{t.type}{
    character: \code{guess}, \code{Date} or \code{POSIXct}
}
  \item{start}{
    character
}
  \item{end}{
    character
}
  \item{columns}{
    character.
}
\item{return.class}{
  
  \code{NULL} (default) or character: if \code{NULL}, a list is
  returned. Also supported are \code{zoo},
  \code{\link{data.frame}} and \code{\link{ts_table}}.
  
}
\item{drop.weekends}{
  logical
}
\item{column.names}{
  
  character: a format string for column names; may contain
  \code{\%dir\%}, \code{\%file\%}, and \code{\%column\%}
  
}
\item{backend}{
  character: currently, only \sQuote{\code{csv}} is fully supported
}
\item{read.fn}{
  \code{NULL} or character: use \sQuote{\code{fread}}
  to use \code{\link[data.table]{fread}}
  from package \pkg{data.table}
}
\item{frequency}{
  
  character: only used when \code{t.type} is
  \code{POSIXct} (or guessed to be \code{POSIXct})
  
}
}
\details{

  Read time-series data from \acronym{CSV} files.

}
\value{
  When return.class is \code{NULL}, a list:
 \item{data}{a numeric matrix}
 \item{timestamp}{Date or POSIXct}
 \item{columns}{character}
 \item{file.path}{character}


}
\author{
  Enrico Schumann
}
\seealso{
  \code{\link{write_ts_table}}
}
\examples{
t1 <- ts_table(1:3, as.Date("2018-12-3") + 1:3, columns = "A")
t2 <- ts_table(4:5, as.Date("2018-12-3") + 1:2, columns = "A")

d <- tempdir()  ## this is just an example.
                ## Actual (valuable) data should never
                ## be stored in a tempdir!

write_ts_table(t1, dir = d, file = "t1")
write_ts_table(t2, dir = d, file = "t2")

read_ts_tables(c("t1", "t2"),
               dir = d, columns = "A",
               return.class = "zoo",
               column.names = "\%file\%.\%column\%")

}