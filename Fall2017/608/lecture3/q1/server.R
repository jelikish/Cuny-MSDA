
library(ggplot2)
library(dplyr)
library(plotly)
library(ggthemes)
library(plotly)

#df = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/lecture3/cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE)
df = read.csv("https://raw.githubusercontent.com/charleyferrari/CUNY_DATA608/master/lecture3/data/cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE)
df = dplyr::filter(df, Year == 2010)



function(input, output) {
  
  output$plot <- renderPlotly({
    
    dfSlice <- df %>%
      filter(ICD.Chapter == input$desease)

 
    dfSlice$State <- factor(dfSlice$State, levels = dfSlice$State[order(dfSlice$Crude.Rate)])

    #ggplot(dfSlice, aes(x= State, y = Crude.Rate)) +
    #  geom_bar(stat="identity") + coord_flip() + theme_tufte() + ylab("") + xlab("") 
    
    
    ax <- list(
      title = "",
      showgrid = FALSE
    )
    plot_ly(dfSlice, x = ~State, y = ~Crude.Rate) %>% add_bars() %>% layout(xaxis=ax, yaxis=ax)
  
      
    
  })
  
  output$stats <- renderPrint({
    dfSlice <- df %>%
      filter(ICD.Chapter == input$desease)
  })
  
}