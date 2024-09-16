# Introduction to R: Basics and Text Analysis Example

# Install libraries
install.packages(c("tm", "SnowballC", "wordcloud"))

# Load necessary libraries
library(tm)
library(SnowballC)
library(wordcloud)
library(ggplot2)

# --- Part 1: Basics of R ---

# Data Types
x <- 42   # Numeric
greeting <- "Hello, world!"  # Character (String)
is_true <- TRUE  # Logical (Boolean)

# Storing Values
x <- 5
y <- 10

# Performing Calculations
x + y  # Addition
x * y  # Multiplication
x / y  # Division

# Using Functions
sqrt(16)

# Data Structures
# Vectors
numbers <- c(1, 2, 3, 4, 5)

# Lists
my_list <- list(1, "apple", TRUE)

# Data Frames
df <- data.frame(name = c("Alice", "Bob"), age = c(25, 30))

# Control Structures
if (x > y) {
  print("x is greater than y")
} else {
  print("x is less than or equal to y")
}

# Define a vector of numbers
numbers <- c(1, 2, 3, 4, 5)

# Loop through each number in the vector
for (num in numbers) {
  if (num %% 2 == 0) {
    print(paste(num, "is even"))
  } else {
    print(paste(num, "is odd"))
  }
}

# --- Part 2: Text Corpus Analysis Example ---

# Import the text data
text <- readLines("canterbury_tales.txt")  # Replace with the path to your text file

# Create a text corpus
corpus <- Corpus(VectorSource(text))

# Text Cleaning
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords("en"))
corpus <- tm_map(corpus, stripWhitespace)

# Create a term-document matrix
tdm <- TermDocumentMatrix(corpus)

# Convert the term-document matrix to a matrix
m <- as.matrix(tdm)

# Get word frequencies
word_freq <- sort(rowSums(m), decreasing = TRUE)
word_freq_df <- data.frame(word = names(word_freq), freq = word_freq)

# Show the top 10 most frequent words
head(word_freq_df, 10)

# --- Visualization ---

# Bar Plot of Most Frequent Words
top_words <- head(word_freq_df, 10)
ggplot(top_words, aes(x = reorder(word, -freq), y = freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Top 10 Most Frequent Words", x = "Words", y = "Frequency") +
  coord_flip()

# Word Cloud
set.seed(123)  # For reproducibility
wordcloud(words = word_freq_df$word, freq = word_freq_df$freq, 
          min.freq = 2, max.words = 100, random.order = FALSE, 
          colors = brewer.pal(8, "Dark2"))