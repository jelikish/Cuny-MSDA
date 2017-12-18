# LOad necessary libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(ggthemes)
library(plotly)
library(reshape)

#Load data for FANG stocks
df = read.csv("C:/d3/hw6/marketcap_new1.csv", header = TRUE)

#Load Spider data
SPY = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/SPY_annual.csv", header = TRUE)
SPY$Stock = "SPY"
XLU = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLY_annual.csv", header = TRUE)
XLU$Stock = "XLU"
XLB = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLB_annual.csv", header = TRUE)
XLB$Stock = "XLB"
XLE = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLE_annual.csv", header = TRUE)
XLE$Stock = "XLE"
XLF = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLF_annual.csv", header = TRUE)
XLF$Stock = "XLF"
XLI = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLI_annual.csv", header = TRUE)
XLI$Stock = "XLI"
XLK = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLK_annual.csv", header = TRUE)
XLK$Stock = "XLK"
XLP = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLP_annual.csv", header = TRUE)
XLP$Stock = "XLP"
XLV = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLV_annual.csv", header = TRUE)
XLV$Stock = "XLV"
XLY = read.csv("C:/Users/joseph/Documents/GitHub/Cuny/Fall2017/608/project/XLY_annual.csv", header = TRUE)
XLY$Stock = "XLY"

#remove emty rows
XLY = XLY[-c(12),]
XLU = XLU[-c(12),]

#Bind all spiders into one dataframe
etfs = rbind(XLU, XLB, XLE, XLF, XLI, XLK, XLP, XLV, XLY)

#Split daat into 2 datafranmes
cap_data = df[,c(1:8)]
change_data = df[,c(1, 9:15)]
percent_data = df[,c(1, 16:21)]

#Rename colnames
colnames(change_data) = c("Date","AAPL", "AMZN", "GOOGL", "FB", "NFLX", "Total", "SPY")
colnames(percent_data) = c("Date","AAPL", "AMZN", "GOOGL", "FB", "NFLX", "Total")

#Melt dataframe so that each row contains only 1 entry
mcap_data <- melt(cap_data, id=c("Date"))
mchange_data <- melt(change_data, id=c("Date"))
mpercent_data <- melt(percent_data, id=c("Date"))


# Rename colnames of newly melted dfs.
colnames(mcap_data) <- c("Year","Stock", "Cap")
colnames(mchange_data) <- c("Year","Stock", "Change")
colnames(mpercent_data) <- c("Year","Stock", "Percentage")

#Define input selection variables for UI dropdown
dfchoice=as.character(unique(mcap_data$Year))
dfchoice1=as.character(unique(mchange_data$Year))

#mchange_data_nospy = subset(mchange_data, Stock != "SPY")
#mchange_data_spy = subset(mchange_data, Stock == "SPY")

dfchoice2 = as.character(unique(mcap_data$Stock))
dfchoice3 = as.character(unique(mpercent_data$Stock))
etfchoice = as.character(unique(etfs$Stock))
etfchoice_year = as.character(unique(etfs$Date))


function(input, output) {
  
  # Plot 1 -------------------------------------------------------------------------------------------
  
  output$plot <- renderPlotly({
    
    dfSlice <- mcap_data %>%
      filter(Year == input$Year)
    
    
    ax <- list(
      title = "",
      showgrid = FALSE
    )
    plot_ly(dfSlice, x = ~Stock, y = ~Cap) %>% add_bars() %>% layout(xaxis=ax, yaxis=ax)
    
  })
  
  output$stats <- renderPrint({
    dfSlice <- mcap_data %>%
      filter(Year == input$Year)
  })
  
  # PLot 2 ------------------------------------------------------------------------------------------
  
  output$plot1 <- renderPlotly({
    
    dfSlice1 <- mchange_data %>%
      filter(Year == input$Year1)
    
    ax1 <- list(
      title = "",
      showgrid = FALSE
    )
    
    plot_ly(dfSlice1, x = ~Stock, y = ~Change) %>% add_bars() %>% layout(xaxis=ax1, yaxis=ax1)
    
  })
  
  output$stats1 <- renderPrint({
    dfSlice1 <- mchange_data %>%
      filter(Year == input$Year1)
    
  })
  
  
  # PLot 3 -----------------------------------------------------------------------------------------------
  
  output$plot2 <- renderPlotly({
    
    dfSlice2 <- mcap_data %>%
      filter(Stock == input$Stock)
    
    ax1 <- list(
      title = "",
      showgrid = FALSE
    )
    
    plot_ly(dfSlice2, x = ~Year, y = ~Cap) %>% add_lines() %>% layout(xaxis=ax1, yaxis=ax1)
    #add_trace(x = ~dfslicespy$Year, y = ~dfslicespy$Cap, name = 'trace 1', mode = 'lines')
    
  })
  
  output$stats1 <- renderPrint({
    dfSlice2 <- mcap_data %>%
      filter(Stock == input$Stock)
    
  })
  
  
  # PLot 4 -----------------------------------------------------------------------------------------------
  
  output$plot3 <- renderPlotly({
    
    dfSlice3 <- mpercent_data %>%
      filter(Stock == input$Stock3)
    
    
    ax1 <- list(
      title = "",
      showgrid = FALSE
    )
    
    plot_ly(dfSlice3, x = ~Year, y = ~Percentage) %>% add_bars() %>% layout(xaxis=ax1, yaxis=ax1)
    
  })
  
  output$stats1 <- renderPrint({
    dfSlice3 <- mpercent_data %>%
      filter(Stock == input$Stock3)
    
  })
  
  
  # ETF PLot 1 -----------------------------------------------------------------------------------------------
  
  output$etf_plot <- renderPlotly({
    
    etfSlice <- etfs %>%
      filter(Stock == input$etf)
    
    ax1 <- list(
      title = "",
      showgrid = FALSE
    )
    
    plot_ly(etfSlice, x = ~Date, y = ~Close) %>% add_lines() %>% layout(xaxis=ax1, yaxis=ax1)
    
  })
  
  output$stats1 <- renderPrint({
    etfSlice <- etfs %>%
      filter(Stock == input$etf)
    
  })
  
  # ETF PLot 2 -----------------------------------------------------------------------------------------------
  
  output$etf_plot1 <- renderPlotly({
    
    etfslice1 <- etfs %>%
      filter(Date == input$etf1)
    etftotal = sum(etfslice1$Close)
    etfslice1$percent = etfslice1$Close/etftotal
    
    
    ax1 <- list(
      title = "",
      showgrid = FALSE
    )
    
    plot_ly(etfslice1, x = ~Stock, y = ~percent) %>% add_bars() %>% layout(xaxis=ax1, yaxis=ax1)
    
  })
  
  output$stats1 <- renderPrint({
    etfslice1 <- etfs %>%
      filter(Date == input$etf1)
    
  })
}