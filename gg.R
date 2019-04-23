getwd()
setwd("/Users/bulut/dev/rrr")
stats <- read.csv("DemographicData.csv")
levels(stats$Income.Group)
stats$Income.Group
stats[1:10,]
is.data.frame(stats[c(6, 121),])
stats[,1,drop=F]
stats$he <- stats$Birth.rate * stats$Internet.users
head(stats)
stats$he <- NULL
stats[stats$Internet.users < 20 & stats$Birth.rate > 10 & stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]

?qplot

df <- data.frame(Codes = Codes_2012_Dataset, Countries = Countries_2012_Dataset, Regions = Regions_2012_Dataset)
df

is.vector(Codes_2012_Dataset)
m <- merge.data.frame(stats, df, by.x = "Coutry.Code", by.y = "Codes")
head(m)
m$Countries <- NULL

films <- read.csv("Movie-Ratings.csv")
head(films)
colnames(films)
dim(films)
summary(films)
colnames(films)<-c("Film", "Genre", "RTPuanı", "SeyirciPuanı", "BudgetMilyon", "Year")
films$Year <- factor(films$Year)
is.factor(films$Year)
q <- ggplot(data = films, aes(x = Genre, y = SeyirciPuanı, colour = Genre)) 
q + geom_jitter() + geom_boxplot(size=1.2, alpha=.6)

v <- ggplot(data=films, aes(x=BudgetMilyon))
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="Blue") +
  facet_grid(Genre~., scales = "free")

w <- ggplot(data=films, aes(x=SeyirciPuanı, y=RTPuanı, colour=Genre))
w + geom_point(aes(size=BudgetMilyon)) + 
  facet_grid(Genre~Year, scales = "free")

