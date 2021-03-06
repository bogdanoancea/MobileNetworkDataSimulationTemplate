% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/distance_coverArea.R
\name{distance_coverArea}
\alias{distance_coverArea}
\title{Calculate the distance between two cover areas in terms of tiles.}
\usage{
distance_coverArea(from, to, emissionProbs, centroidCoord.dt, tile_size)
}
\arguments{
\item{from}{the antenna from which the device is going. It has to correspond to 
the name of a column in emissionProbs.}

\item{to}{the antenna to which the device is going. It has to correspond to 
the name of a column in emissionProbs.}

\item{emissionProbs}{the matrix of emission probabilities.}

\item{centroidCoord.dt}{a data.table with the information about the coordinates
of the center of the tiles (rastercells). The required columns are: rasterCell,
centroidCoord_x and centroidCoord_y.}

\item{tile_size}{the size of each tile in meters.}
}
\value{
A numeric value with the number of tiles between the two cover areas.
}
\description{
This function obtains the number of tiles that are between two
cover areas by taking into account that a tile has signal from an antenna
in the center of the tile has signal.
}
\examples{
\dontrun{
}

}
