# high coverage test
# install.packages('cna') 
library(QCApro)
library(cna)

data<-read.csv("D:\\code\\scpQCA\\paper code\\highcover\\highcover0.csv",encoding = "UTF-8")
# QCApro
eQMC(data, outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
# cna
cna(data,"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

data<-read.csv("D:\\code\\scpQCA\\paper code\\highcover\\highcover1.csv",encoding = "UTF-8")
# QCApro
eQMC(data, outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
# cna
cna(data,"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

data<-read.csv("D:\\code\\scpQCA\\paper code\\highcover\\highcover2.csv",encoding = "UTF-8")
# QCApro
eQMC(data, outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
# cna
cna(data,"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

data<-read.csv("D:\\code\\scpQCA\\paper code\\highcover\\highcover3.csv",encoding = "UTF-8")
# QCApro
eQMC(data, outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
# cna
cna(data,"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

data<-read.csv("D:\\code\\scpQCA\\paper code\\highcover\\highcover4.csv",encoding = "UTF-8")
# QCApro
eQMC(data, outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
# cna
cna(data,"cs", ordering = "OUTCOME",con = .9, cov = .9, maxstep = c(6, 6, 12))

data<-read.csv("D:\\code\\scpQCA\\paper code\\highcover\\highcover5.csv",encoding = "UTF-8")
# QCApro
eQMC(data, outcome = "OUTCOME", incl.cut1 = .8, incl.cut0 = 1)
# cna
cna(data,"cs", ordering = "OUTCOME",con = .8, cov = .8, maxstep = c(6, 6, 12))

data<-read.csv("D:\\code\\scpQCA\\paper code\\highcover\\highcover6.csv",encoding = "UTF-8")
# QCApro
eQMC(data, outcome = "OUTCOME", incl.cut1 = .9, incl.cut0 = 1)
# cna
cna(data,"cs", ordering = "OUTCOME",con = .8, cov = .8, maxstep = c(6, 6, 12))
