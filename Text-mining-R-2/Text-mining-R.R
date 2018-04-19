library(tm)
library(wordcloud)

# loading the data in VCorpus
data <- VCorpus(DirSource("/home/ritesh/Desktop/TextMining"))
summary(data)

#displaying the data 
writeLines(as.character(data[1]))

#removing punctuation from abstract
data <- tm_map(data, removePunctuation)
writeLines(as.character(data[1]))

#removing numbers if any as we need to calculate tfcount
data <- tm_map(data, removeNumbers)
writeLines(as.character(data[1]))

#conerting to lower as Internet and internet are two same words
data <- tm_map(data, tolower)
writeLines(as.character(data[1]))

#remove stopwords as their count is not of our concern
data <- tm_map(data, removeWords, stopwords("english"))
writeLines(as.character(data[1]))


#removing extra whitespaces
data <- tm_map(data, stripWhitespace)
writeLines(as.character(data[1]))



data <- tm_map(data, PlainTextDocument)
writeLines(as.character(data[1]))

data <- tm_map(data, stemDocument)
writeLines(as.character(data[1]))

dtm <- DocumentTermMatrix(data)
tdm <- TermDocumentMatrix(data)

m = as.matrix(tdm)
m

m = as.matrix(dtm)
m

freq = colSums(m)
freq

table(freq)


wf <- data.frame(words=names(freq), freq=freq)


sort(freq, decreasing = TRUE)


# Displaying the word cloud
words = names(freq)
dark2 = brewer.pal(8, "Dark2")
wordcloud(words, freq, min.freq = 1, max.words = 200, rot.per = 0.35, colors=dark2)

