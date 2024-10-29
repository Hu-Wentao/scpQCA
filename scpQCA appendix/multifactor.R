library(QCApro)
library(cna)

data<-read.csv("D:\\code\\scpQCA\\paper code\\multifactor\\multifactor0.csv",encoding = "UTF-8")
data[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21)]

# 20-factor
eQMC(data, outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
cna(data,"cs", ordering = "OUTCOME",con = .8, cov = .8, maxstep = c(6, 6, 12))

# 15-factor
eQMC(data[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,21)], outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
cna(data[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,21)],"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

# 11-factor
eQMC(data[,c(1,2,3,4,5,6,7,8,9,10,11,21)], outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
cna(data[,c(1,2,3,4,5,6,7,8,9,10,11,21)],"cs", ordering = "OUTCOME",con = .8, cov = .8, maxstep = c(6, 6, 12))

# 10-factor
eQMC(data[,c(1,2,3,4,5,6,7,8,9,10,21)], outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
cna(data[,c(1,2,3,4,5,6,7,8,9,10,21)],"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

# 8-factor
eQMC(data[,c(1,2,3,4,5,6,7,8,21)], outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
cna(data[,c(1,2,3,4,5,6,7,8,21)],"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

# 6-factor
eQMC(data[,c(1,2,3,4,5,6,21)], outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
cna(data[,c(1,2,3,4,5,6,21)],"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))
