library(data.table)

lengths<-c(1000,3000,10000,30000,100000,300000)
length<-100

for (length in lengths) {
  filename<-paste("dummy-input-length-",length,sep='')
  timestamp<-strftime(seq(as.POSIXct("2018/1/1"), as.POSIXct("2019/1/1"), length.out=length),  "%Y-%m-%dT%H:%M:%S%z")
  value<-runif(length, -100, 1000)
  label<-rbinom(length, 1, 0.5)
  dt<-data.table(filename,timestamp,value,label)
  write.csv(dt,file=paste('~/TRAINSET/dummy_inputs/',filename,sep=''),quote=FALSE,row.names=FALSE)
}