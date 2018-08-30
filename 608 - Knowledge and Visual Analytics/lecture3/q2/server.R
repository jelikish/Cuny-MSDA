
library(ggplot2)
library(dplyr)
library(plotly)
library(ggthemes)

#df = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/lecture3/cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE)
df = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/lecture3/cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE)



function(input, output) {
  
  output$plot <- renderPlot({
    
    dfState <- df %>%
      filter(ICD.Chapter == input$desease, State == input$State)
    
    dfNational <- df %>%
      filter(ICD.Chapter == input$desease)
    
    dfNational = within(dfNational, rm(State,Crude.Rate))
    
    #Aggregate by year
    dfNat_agg = group_by(dfNational, Year) %>% summarise(sum_pop=sum(Population), sum_Deaths=sum(Deaths))
    dfNat_agg$Rate = (dfNat_agg$sum_Deaths/dfNat_agg$sum_pop)*100000

  
    
    ggplot() +
      geom_line(data = dfState, aes(x= Year, y = Crude.Rate, color = "State")) +
      geom_line(data = dfNat_agg, aes(x= Year, y = Rate, color = "National")) +
      theme_tufte() + ylab("") + xlab("") + labs(color="Legend")
    
    
  })
  
  output$stats <- renderPrint({
    dfSlice <- df %>%
      filter(ICD.Chapter == input$desease)
    
  })
  
}