
################################## DARPA data analysis for Shennan Weiss
################################## assemble encoding, distractor, recall gran1 data
 
require(gdata)
################################## ################################## distractor events
setwd("/Users/innachervoneva/Documents/ICH_projects/consults/Weiss_Sh/darpa_stats/eventrate_arrays/distractor_csv")
distractor.events = read.table(file="loc1_events_distractor_eventrates.csv", sep=",")
distractor.frons = read.table(file="loc1_frons_distractor_eventrates.csv", sep=",")
distractor.trons = read.table(file="loc1_trons_distractor_eventrates.csv", sep=",")
distractor.rono = read.table(file="loc1_rono_distractor_eventrates.csv", sep=",")
distractor=cbind(t(distractor.events), t(distractor.trons), t(distractor.frons), t(distractor.rono))
distractor[1:5,]
dim(distractor)
################################## ################################## subjects
subjcode = read.table(file="pat_num_code.csv", sep=",")
dim(subjcode)
length(subjcode)
dim(t(subjcode))
################################## ################################## encoding events
setwd("/Users/innachervoneva/Documents/ICH_projects/consults/Weiss_Sh/darpa_stats/eventrate_arrays/encoding_csv")
encoding.events = read.table(file="loc1_events_encoding_eventrates.csv", sep=",")encoding.frons = read.table(file="loc1_frons_encoding_eventrates.csv", sep=",")encoding.trons = read.table(file="loc1_trons_encoding_eventrates.csv", sep=",")encoding.rono = read.table(file="loc1_rono_encoding_eventrates.csv", sep=",")
dim(t(encoding.events))
dim(t(encoding.trons))
dim(t(encoding.frons))
dim(t(encoding.rono))encoding=cbind(t(encoding.events), t(encoding.trons), t(encoding.frons), t(encoding.rono))
encoding[1:5,]
################################## ################################## recall events
setwd("/Users/innachervoneva/Documents/ICH_projects/consults/Weiss_Sh/darpa_stats/eventrate_arrays/recall_csv")recall.events = read.table(file="loc1_events_recall_eventrates.csv", sep=",")recall.frons = read.table(file="loc1_frons_recall_eventrates.csv", sep=",")recall.trons = read.table(file="loc1_trons_recall_eventrates.csv", sep=",")recall.rono = read.table(file="loc1_rono_recall_eventrates.csv", sep=",")
recall=cbind(t(recall.events), t(recall.trons), t(recall.frons), t(recall.rono))
dim(recall)
recall[1:5,]
################################## ################################## recalled words
recalls = read.table(file="recalls.csv", sep=",")
dim(recalls)
dim(t(recalls))
dim(encoding)
dim(distractor)
dim(encoding)

names.distractor = c("DeventsL", "DeventsR", "DtronsL","DtronsR","DfronsL","DfronsR","DronoL","DronoR")
names.encoding = c("EeventsL", "EeventsR", "EtronsL","EtronsR","EfronsL","EfronsR","EronoL","EronoR")
names.recall = c("ReventsL", "ReventsR", "RtronsL","RtronsR","RfronsL","RfronsR","RronoL","RronoR")

granularity1=data.frame(cbind(t(subjcode), t(recalls), encoding, distractor, recall))
dim(granularity1)
names(granularity1)<- c("Subject", "Remembered", names.encoding, names.distractor, names.recall)
granularity1[1:5,]

data.frame(names(granularity1)[3:10], rbind(table(granularity1$EeventsL>0), table(granularity1$EeventsR>0), table(granularity1$EtronsL>0), table(granularity1$EtronsR>0), table(granularity1$EfronsL>0), table(granularity1$EfronsR>0),table(granularity1$EronoL>0), table(granularity1$EronoR>0)))

data.frame(names(granularity1)[11:18], rbind(table(granularity1$DeventsL>0), table(granularity1$DeventsR>0), table(granularity1$DtronsL>0), table(granularity1$DtronsR>0), table(granularity1$DfronsL>0), table(granularity1$DfronsR>0),table(granularity1$DronoL>0), table(granularity1$DronoR>0)))

data.frame(names(granularity1)[19:26], rbind(table(granularity1$ReventsL>0), table(granularity1$ReventsR>0), table(granularity1$RtronsL>0), table(granularity1$RtronsR>0), table(granularity1$RfronsL>0), table(granularity1$RfronsR>0),table(granularity1$RronoL>0), table(granularity1$RronoR>0)))


hist(granularity1$DeventsL[granularity1$DeventsL>0], xlab="Distractor Non-zero Event Rates", main="Distractor, Left Hem.")

hist( granularity1$DeventsR[granularity1$DeventsR>0], xlab="Distractor Non-zero Event Rates", main="Distractor, Right Hem.")


setwd("/Users/innachervoneva/Documents/ICH_projects/consults/Weiss_Sh/darpa_stats")
write.table(granularity1, file="EDRgran1rev.csv", row.names = F, sep="|")
save(granularity1, file="EDRgran1rev.RData")




