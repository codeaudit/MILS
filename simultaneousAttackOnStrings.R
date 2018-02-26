
require(acss)
require(stringr)
source("BDM1D.R")



simultaneousAttackOnString <- function(origString,
                                       blockSize, 
                                       offset, base, 
                                       numberOfAttackedBits) {
  
  origStringBDMValue <- evaluateBDM1D(origString, blockSize, offset, base)
  
  stringVector <- unlist(str_split(origString, pattern=""))
  
  deletionStrings <- c()
  
  for (i in 1: length(stringVector)){
    
    boolIndexVector <- !logical(length(stringVector))
    boolIndexVector[i] <- FALSE
    back <- paste(stringVector[boolIndexVector], sep = "",
                  collapse="")
    deletionStrings <- c(deletionStrings, back)
    
  }
  
  deletionStringsBDMValues <- unlist(lapply)
  
  deletionStringsBDMValues <- unlist(
    lapply(deletionStrings, 
           evaluateBDM1D, blockSize, offset, base))
  
  bdmDifferencesToOrig <- origStringBDMValue - deletionStringsBDMValues
  
  bdmDifferencesToMedian <- (median(deletionStringsBDMValues) - 
                               deletionStringsBDMValues)
  
  
  bdmDf <- data.frame(deletionStrings= deletionStrings,
                      bdmDifferencesToOrig = bdmDifferencesToOrig, 
                      stringsAsFactors=FALSE)
  
  bdmDf$diffRankToOrig <- rank(
    -as.numeric(bdmDf$bdmDifferencesToOrig), ties.method ="min"
  )
  
  sortByDiffRank <- order(bdmDf$diffRankToOrig)
  
  indexRank <- as.numeric(rownames(bdmDf[sortByDiffRank,]))
  
  removeddBitsIdx <- indexRank[c(1:numberOfAttackedBits)]
  
  boolIndexVector <- !logical(length(stringVector))
  boolIndexVector[removeddBitsIdx] <- FALSE
  
  boolIndexVector
  
  stringVector[boolIndexVector]
  
  removedBitsString <- paste(stringVector[boolIndexVector], sep="", collapse="")
  
  
  return (removedBitsString)
  
}

simultaneousAttackOnString("110001101010111101", 
                           12, 1, 2, 10)
