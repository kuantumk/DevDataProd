# Download the training data set
if (!file.exists("pml-training.csv"))
        download.file(destfile = pml-training,csv, url = "http://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv")
rawData <- read.csv("pml-training.csv", na.string = c("", "NA", "NULL"))

# dropping columns with NA
data <- rawData[, colSums(is.na(rawData)) == 0]
# droping the first 7 columns
data <- data[, -c(1:7)]

library(caret)
library(ggplot2)
library(e1071)

shinyServer(
        function(input, output) {
                
                output$confMPlot <- renderPlot({
                        inTrain <- createDataPartition(data$classe, p = 0.01*input$cv_ratio, list = FALSE)
                        training <- data[inTrain, ]
                        testing <- data[-inTrain, ]
                        # train data based on UI input
                        modFit <- train(classe ~ ., method = input$model, data = training)
                        # predict outcome from trained model and grab the confusion matrix table
                        pred <- predict(modFit, newdata = testing)
                        confM <- confusionMatrix(pred, testing$classe)
                        tmp <- confM$table
                        c <- t(t(tmp)/colSums(tmp))
                        library(ggplot2)
                        ggplot(as.data.frame(c)) + 
                                geom_tile(aes(x= Reference, y = Prediction, fill = Freq)) +  
                                geom_text(aes(x= Reference, y = Prediction, fill = Freq, label = round(Freq, 3))) + 
                                scale_fill_gradient(high = "dodgerblue2", low = "white")
                })
                
                
        }        
        
)




