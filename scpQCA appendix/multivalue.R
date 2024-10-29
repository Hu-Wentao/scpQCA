# multi-value test
library(QCApro)
library(cna)

# 3-value
data<-read.csv("D:/code/scpQCA/paper code/multivalue/multivalue3.csv",encoding = "UTF-8")
data
eQMC(data[,c(1,2,3,4,5,6)], outcome = "OUTCOME", incl.cut1 = .8, incl.cut0 = 1)
cna(data,type ="mv",outcome = "OUTCOME=1",con=0.8,cov=.8,cutoff =8)

# 4-value
data<-read.csv("D:/code/scpQCA/paper code/multivalue/multivalue4.csv",encoding = "UTF-8")
data
eQMC(data[,c(1,2,3,4,5,6)], outcome = "OUTCOME", incl.cut1 = .8, incl.cut0 = 1)
cna(data,type ="mv",outcome = "OUTCOME=1",con=0.8,cov=.75,cutoff =2)

# 5-value
data<-read.csv("D:/code/scpQCA/paper code/multivalue/multivalue5.csv",encoding = "UTF-8")
data
eQMC(data[,c(1,2,3,4,5,6)], outcome = "OUTCOME", incl.cut1 = .8, incl.cut0 = 1)
cna(data,type ="mv",outcome = "OUTCOME=1",con=0.8,cov=.78,cutoff =2)
