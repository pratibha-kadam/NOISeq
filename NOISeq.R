#Read data from the table
getData <- read.csv("IHF_counts.csv", header = TRUE, row.names = 1, sep = ',')

#Use packages in R
library("NOISeq")

#Define the conditions
mfactors <- data.frame(transcript =c("C","T1","T2","T3","T4","T5"))

#assign the conditions to the saples
mydata <- readData(data=getData, factors=mfactors)

#Choosen rpkm value as a normalised value, pnr is Percentage of the total reads used to simulated each sample when no replicates are available. By default, pnr = 0.2.Number of samples to simulate for each condition 
getNOIseqRes <- noiseq(mydata, k = 0.1, norm = "rpkm", replicates = "no", factor= "transcript", conditions = c("T5","C") , pnr = 0.2, nss = 10)

getNOIseqRes

#write output to a txt file
write.table(getNOIseqRes@results[[1]], file="DEG_IHF_34_C_T5.txt", sep="\t", row.names=T, col.names=T, quote=F)


