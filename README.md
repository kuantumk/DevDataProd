# README

## Background

In this Shiny app, we are going to use activity data collected from accelerometers, magnetometers and gyrometers on on the belt, forearm, arm, and dumbell of 6 participants to build a machine learnning model to classify the activity patterns. The paticipants were asked to perform barbell lifts correctly and incorrectly in 5 different ways (denoted as A, B, C, D, E, respectively). More information is available from the original research group's website here: http://groupware.les.inf.puc-rio.br/har.

## How to use this app

The user has the option to choose two methods (Linear Discriminant Analysis or Quadratic Discriminant Analysis) to train the data. The user also has the option to choose the portion of the data to be trained in percentage. By default, the app will pick the Linear Discriminant Analysis method with 10% of the data to build the pattern recognition model. The confusion matrix is calculated on the testing data (by default 90% of the original data) with the built model. Then the confustion matrix will be ploted in the main panel. Change the model and the data splitting to see how they affect the prediction accuracy. 

Note: Due to the slow server speed, the best model (random forest) is not included in this demo.

## App on Shiny Server
[http://kuantumk.shinyapps.io/DevDataProd/](https://kuantumk.shinyapps.io/DevDataProd/)
