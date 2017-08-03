
################################## DARPA data analysis for Shennan Weiss
require(gdata)
setwd("/Users/innachervoneva/Documents/ICH_projects/consults/Weiss_Sh/darpa_stats")

locations<-read.xls("location_rows_I.xlsx", sheet="Sheet1")
locations$X_array_1=as.character(locations$X_array_1)
locations$X_array_2=as.character(locations$X_array_2)

subjcode = read.table(file="subjcode.csv", sep=",")
dim(subjcode)
length(subjcode)
dim(t(subjcode))

Y_array = read.table(file="Y_array.csv", sep=",")
dim(Y_array)
length(Y_array)

blocks=read.table(file="list_array.csv", sep=",")
dim(blocks)
length(blocks)

sequences=read.table(file="position_array.csv", sep=",")
dim(sequences)
length(sequences)

structure=data.frame(t(subjcode), t(blocks), t(sequences), t(Y_array))
names(structure)<- c("Subject", "block", "sequence", "Remembered")
dim(structure)

structure[1:24,]
table(structure$Subject)
table(structure$sequence)
table(structure$block)

perSubj=data.frame(table(structure$Subject))
names(perSubj)<- c("Subject", "perSubj")
perSubj[1:12,]
dim(perSubj)

structure=merge(structure, perSubj, by="Subject")
structure[1:12,]

################################# renumber the blocks for subjects with >300 observations
k=1
oneSubj=structure[structure$Subject==k,]
j=1
oneblock=oneSubj[oneSubj$block==j,]
oneblock1=oneblock[1:12,]
oneblock2=oneblock[13:24,]
oneblock3=oneblock[25:36,]
oneblock4=oneblock[37:48,]
oneblock1$uniqBL=oneblock1$block+100
oneblock2$uniqBL=oneblock2$block+200
oneblock3$uniqBL=oneblock3$block+300
oneblock4$uniqBL=oneblock4$block+400
Moneblock=rbind(oneblock1, oneblock2, oneblock3, oneblock4)
Moneblock=Moneblock[!is.na(Moneblock$perSubj),]
MoneSubj=Moneblock
 for (j in 2:25)
   {
oneblock=oneSubj[oneSubj$block==j,]
oneblock1=oneblock[1:12,]
oneblock2=oneblock[13:24,]
oneblock3=oneblock[25:36,]
oneblock4=oneblock[37:48,]
oneblock1$uniqBL=oneblock1$block+100
oneblock2$uniqBL=oneblock2$block+200
oneblock3$uniqBL=oneblock3$block+300
oneblock4$uniqBL=oneblock4$block+400
Moneblock=rbind(oneblock1, oneblock2, oneblock3, oneblock4)
Moneblock=Moneblock[!is.na(Moneblock$perSubj),]
MoneSubj=rbind(MoneSubj, Moneblock)   
   	}
Mstructure=MoneSubj   	
 	for (k in 2:dim(perSubj)[1])
      {
 oneSubj=structure[structure$Subject==k,]
j=1
oneblock=oneSubj[oneSubj$block==j,]
oneblock1=oneblock[1:12,]
oneblock2=oneblock[13:24,]
oneblock3=oneblock[25:36,]
oneblock4=oneblock[37:48,]
oneblock1$uniqBL=oneblock1$block+100
oneblock2$uniqBL=oneblock2$block+200
oneblock3$uniqBL=oneblock3$block+300
oneblock4$uniqBL=oneblock4$block+400
Moneblock=rbind(oneblock1, oneblock2, oneblock3, oneblock4)
Moneblock=Moneblock[!is.na(Moneblock$perSubj),]
MoneSubj=Moneblock
 for (j in 2:25)
   {
oneblock=oneSubj[oneSubj$block==j,]
oneblock1=oneblock[1:12,]
oneblock2=oneblock[13:24,]
oneblock3=oneblock[25:36,]
oneblock4=oneblock[37:48,]
oneblock1$uniqBL=oneblock1$block+100
oneblock2$uniqBL=oneblock2$block+200
oneblock3$uniqBL=oneblock3$block+300
oneblock4$uniqBL=oneblock4$block+400
Moneblock=rbind(oneblock1, oneblock2, oneblock3, oneblock4)
Moneblock=Moneblock[!is.na(Moneblock$perSubj),]
MoneSubj=rbind(MoneSubj, Moneblock)   
   	}
Mstructure=rbind(Mstructure,MoneSubj)   	 	
    }

write.table(Mstructure, file="Mstructure.csv", row.names = F, sep="|")
save(Mstructure, file = "Mstructure.RData")

# dim(Mstructure)/12
# dim(structure)
# names(Mstructure)
# table(Mstructure$Subject, structure$Subject)
# k=108
# oneSubj=Mstructure[Mstructure$Subject==k,]
# dim(oneSubj)
# table(oneSubj$block, oneSubj$uniqBL)


X_array_2 = read.table(file="X_array_2.csv", sep=",")
dim(X_array_2)
X_array_2[1:24,]

granularity2=data.frame(Mstructure, X_array_2)
names(granularity2)<- c(names(Mstructure), locations$X_array_2[1:13])
names(granularity2)
dim(granularity2)

granularity2[1:24,]

write.table(granularity2, file="granularity2.csv", row.names = F, sep="|")
save(granularity2, file = "granularity2.RData")

X_array_2a = read.table(file="X_array_2a.csv", sep=",")
dim(X_array_2a)
X_array_2a[601:624,]

X_array_2b = read.table(file="X_array_2b.csv", sep=",")
dim(X_array_2b)
X_array_2b[601:624,]

X_array_2c = read.table(file="X_array_2c.csv", sep=",")
dim(X_array_2c)
X_array_2c[601:624,]

granularity2[601:624,]

loc=1
# loc=2
# loc=3
# loc=4
# loc=5
# loc=6
# loc=7
# loc=8
# loc=9
# loc=10
# loc=11
# loc=12

j=loc+5
k=loc+1
gran2loc=cbind(granularity2[, c(1:4,j)], X_array_2a[,k], X_array_2b[,k], X_array_2c[,k])
names(gran2loc)<- c(names(granularity2)[c(1:4)], "event", "magnitude", "frequency", "onset")
gran2loc=gran2loc[!is.na(gran2loc[,5]),]
dim(granularity2)[1]-dim(gran2loc)[1]

gran2loc12=gran2loc
write.table(gran2loc12, file="gran2loc12.csv", row.names = F, sep="|")

gran2loc11=gran2loc
write.table(gran2loc11, file="gran2loc11.csv", row.names = F, sep="|")

gran2loc10=gran2loc
write.table(gran2loc10, file="gran2loc10.csv", row.names = F, sep="|")

gran2loc9=gran2loc
write.table(gran2loc9, file="gran2loc9.csv", row.names = F, sep="|")

gran2loc8=gran2loc
write.table(gran2loc8, file="gran2loc8.csv", row.names = F, sep="|")

gran2loc7=gran2loc
write.table(gran2loc7, file="gran2loc7.csv", row.names = F, sep="|")

gran2loc6=gran2loc
write.table(gran2loc6, file="gran2loc6.csv", row.names = F, sep="|")

gran2loc5=gran2loc
write.table(gran2loc5, file="gran2loc5.csv", row.names = F, sep="|")

gran2loc4=gran2loc
write.table(gran2loc4, file="gran2loc4.csv", row.names = F, sep="|")

gran2loc3=gran2loc
write.table(gran2loc3, file="gran2loc3.csv", row.names = F, sep="|")

gran2loc2=gran2loc
write.table(gran2loc2, file="gran2loc2.csv", row.names = F, sep="|")

gran2loc1=gran2loc
write.table(gran2loc1, file="gran2loc1.csv", row.names = F, sep="|")

table(gran2loc1$Subject, gran2loc1$event)



