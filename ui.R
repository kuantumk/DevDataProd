library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Predicting Activity by Motion Sensors"),
        # Sidebar with training set ratio and training model inputs
        sidebarPanel(
                h4("Choose how to split and train the data."),
                hr(),
                numericInput("cv_ratio", 
                            "Input the percentage of the data used for training:", 
                            10, min = 10, max = 90, step = 10),
                selectInput("model", 
                            "Pick a machine learning model:", 
                            choices = list("Linear Discriminant Analysis" = "lda", 
                                           "Quadratic Discriminant Analysis" = "qda"
                                 )),
                submitButton("Apply Changes"),
                hr(),
                h5("The data training takes some time, particularly for the first run. Please be patient.")
        ),
        
        # Show the prediction accuracy from cross-validation
        mainPanel(
                plotOutput("confMPlot")
        )        
))