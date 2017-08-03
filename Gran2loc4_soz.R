
################################## compile granularity 2 location 1 DARPA data (Shennan Weiss)\

require(gdata)
setwd("/Users/innachervoneva/Documents/ICH_projects/consults/Weiss_Sh/darpa_stats")

locations<-read.xls("location_rows_I.xlsx", sheet="Sheet1")
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

soz = read.table(file="soz_array.csv", sep=",")
dim(soz)
length(soz)
#soz[,1:10]

X_array_2 = read.table(file="X_array_2.csv", sep=",")
dim(X_array_2)

X_array_2a = read.table(file="X_array_2a.csv", sep=",")
dim(X_array_2a)

X_array_2b = read.table(file="X_array_2b.csv", sep=",")
dim(X_array_2b)

X_array_2c = read.table(file="X_array_2c.csv", sep=",")
dim(X_array_2c)



structure=data.frame(t(subjcode), t(blocks), t(sequences), t(Y_array), t(soz[5,]))  ### loc+1 in soz
names(structure)<- c("Subject", "block", "sequence", "Remembered", "SOZ")
dim(structure)

perSubj=data.frame(table(structure$Subject))
names(perSubj)<- c("Subject", "perSubj")
perSubj[1:12,]
dim(perSubj)

granularity2=data.frame(structure, X_array_2)
names(granularity2)<- c(names(structure), locations$X_array_2[1:13])
names(granularity2)
dim(granularity2)

###################### ################### ################ ################### loc=4
loc=4
Lj=loc+6
Lk=loc+1
gran2loc=cbind(granularity2[, c(1:5,Lj)], X_array_2a[,Lk], X_array_2b[,Lk], X_array_2c[,Lk])
names(gran2loc)<- c(names(granularity2)[c(1:5)], "event", "magnitude", "frequency", "onset")
dim(gran2loc)
gran2loc$location=locations$X_array_2[Lk]
gran2loc[1:12,]

structure=merge(gran2loc, perSubj, by="Subject")
dim(structure)
structure[1:5,]

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

dim(Mstructure)
#Mstructure[601:624,]

gran2loc=Mstructure
names(gran2loc)
gran2loc=gran2loc[!is.na(gran2loc[,6]),]
dim(granularity2)[1]-dim(gran2loc)[1]

gran2loc.event0=gran2loc[gran2loc$event==0, ]
gran2loc.event1=gran2loc[gran2loc$event==1, ]
gran2loc.event2=gran2loc[gran2loc$event==2, ]
gran2loc.event3=gran2loc[gran2loc$event==3, ]
dim(gran2loc.event0)
dim(gran2loc.event1)
dim(gran2loc.event2)
dim(gran2loc.event3)

gran2loc.event0$magnitudeN=0
gran2loc.event1$magnitudeN=gran2loc.event1$magnitude
gran2loc.event2$magnitudeN=0
gran2loc.event3$magnitudeN=gran2loc.event3$magnitude

gran2loc.event0$frequencyN=0gran2loc.event1$frequencyN=gran2loc.event1$frequencygran2loc.event2$frequencyN=0gran2loc.event3$frequencyN=gran2loc.event3$frequency

gran2loc.event0$onsetN=0gran2loc.event1$onsetN=gran2loc.event1$onsetgran2loc.event2$onsetN=0gran2loc.event3$onsetN=gran2loc.event3$onset

gran2loc.event0$magnitudeLog=0
gran2loc.event1$magnitudeLog=log(gran2loc.event1$magnitude)
gran2loc.event2$magnitudeLog=0
gran2loc.event3$magnitudeLog=log(gran2loc.event3$magnitude)

gran2loc.event0$frequencyLog=0
gran2loc.event1$frequencyLog=log(gran2loc.event1$frequency)
gran2loc.event2$frequencyLog=0
gran2loc.event3$frequencyLog=log(gran2loc.event3$frequency)

gran2loc.event0$onsetLog=0
gran2loc.event1$onsetLog=log(gran2loc.event1$onset)
gran2loc.event2$onsetLog=0
gran2loc.event3$onsetLog=log(gran2loc.event3$onset)

gran2loc.event3
gran2loc.event2[1:15,]
gran2loc.event1[1:15,]
gran2loc.event0[1:15,]

gran2loc4=rbind(gran2loc.event3, gran2loc.event2, gran2loc.event1, gran2loc.event0)
write.table(gran2loc4, file="gran2loc4.csv", row.names = F, sep="|")
gran2loc4[1:5,]



