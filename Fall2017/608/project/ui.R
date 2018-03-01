# LOad necessary libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(ggthemes)
library(plotly)
library(reshape)

#Load data for FANG stocks
df = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/marketcap_new1.csv", header = TRUE)

#Load Spider data
SPY = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/SPY_annual.csv", header = TRUE)
SPY$Stock = "SPY"
XLU = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLY_annual.csv", header = TRUE)
XLU$Stock = "XLU"
XLB = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLB_annual.csv", header = TRUE)
XLB$Stock = "XLB"
XLE = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLE_annual.csv", header = TRUE)
XLE$Stock = "XLE"
XLF = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLF_annual.csv", header = TRUE)
XLF$Stock = "XLF"
XLI = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLI_annual.csv", header = TRUE)
XLI$Stock = "XLI"
XLK = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLK_annual.csv", header = TRUE)
XLK$Stock = "XLK"
XLP = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLP_annual.csv", header = TRUE)
XLP$Stock = "XLP"
XLV = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLV_annual.csv", header = TRUE)
XLV$Stock = "XLV"
XLY = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/project/XLY_annual.csv", header = TRUE)
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


# Each tabpanel controls tab in UI 
shinyUI(navbarPage("DATA608 Final Project",
                   tabPanel("FANG 1", headerPanel('Marketcap distribution in M USD relative to S&P500'),
                            sidebarPanel(
                              selectInput('Year', 'Select Year', dfchoice, selected='2007')
                            ),
                            mainPanel(
                              plotlyOutput('plot', width = "100%"), 
                              h3("During past 10 years the value of major internet stocks or so called FANG stocks 
                                 ( Facebook, Apple, Netflix, Amazon and Google ) has increased greatly, but not only 
                                 it has increased in dollar terms, it has also increased as a proportion of overall 
                                 Stock Market Capitalization. This group of stocks has been a single greatest motivator 
                                 of innovation in USA and around the globe, so the price appreciation is more then 
                                 warranted and reflects the changing world. But as the concentration of wealth keeps 
                                 growing in this group and as we whiteness that every single pension fund is allocating 
                                 more and more capital to the group, one might wonder if there is a danger of US economy 
                                 relying on the success of only few companies. I would like to visualize and review how 
                                 overall wealth allocation has changed in the past 10 years in respect to S&P 500 which is by 
                                 far the broadest index and is good measure for overall US equity market.") )),
                   tabPanel("FANG 2", headerPanel('Annual percentage performance'),
                            sidebarPanel(
                              selectInput('Year1', 'Select Year', dfchoice1, selected='2008')
                            ),
                            mainPanel(
                              plotlyOutput('plot1', width = "100%")
                            )),
                   tabPanel("FANG 3", headerPanel('Marketcap in M USD 2007-2017'),
                            sidebarPanel(
                              selectInput('Stock', 'Select Stock', dfchoice2, selected='AAPL')
                            ),
                            mainPanel(
                              plotlyOutput('plot2', width = "100%")
                            )),
                   tabPanel("FANG 4", headerPanel('Marketcap Percentage of S&P500'),
                            sidebarPanel(
                              selectInput('Stock3', 'Select Stock', dfchoice3, selected='AAPL')
                            ),
                            mainPanel(
                              plotlyOutput('plot3', width = "100%"), h2("Summary"),
                              h3("We can see that the Overall portion of FANG stock group was 3.2% of overall S&P 500 in 2007,
                                 it has dropped to roughly 2.4% in 2008 during the financial crisis and it has to 11.96% currently. 
                                 I do not personally think there is any reason to avoid these stocks or to be alarmed by these numbers, but 
                                 I think it is important to be mindful of this development in the past 10 years and to watch the future developments 
                                 closely as in my opinion the era of these mega-corporations is only beginning and they will continue to deliver fascinating 
                                 products and keep increasing their relative size to the rest of the market.")
                            )),
                   tabPanel("ETF 1", headerPanel('Price appretiation per Sector for 2007-2017'),
                            sidebarPanel(
                              selectInput('etf', 'Select Stock', etfchoice, selected='XLF'), h6("XLP - Consumer staples"), h6("XLY - Consumer discretionary"), h6("XLE - Energy"), h6("XLF - Financials"), h6("XLV - Healthcare"), h6("XLI - Industrials"), h6("XLB - Materials"), h6("XLK - Technology"), h6("XLU - Utilities")
                            ),
                            mainPanel(
                              plotlyOutput('etf_plot', width = "100%"), 
                              h3("Next I would like to review the allocation of market capital per sector in the past 10 years 
                                 and to review how the allocation has changed in the past 10 years.  We have already seen how 
                                 the FANG stocks have dominated the space in the past 10 years and it would be interesting to 
                                 see if the market cap increase was also true for the rest of the technology sector, 
                                 it is also expected to see a decrease in energy sector as the economy is becoming less reliant 
                                 on oil and is moving more towards other sources of energy.")
                            )),
                   tabPanel("ETF 2", headerPanel('Secotor relative perfomance'),
                            sidebarPanel(
                              selectInput('etf1', 'Select Stock', etfchoice_year, selected='2007'), h6("XLP - Consumer staples"), h6("XLY - Consumer discretionary"), h6("XLE - Energy"), h6("XLF - Financials"), h6("XLV - Healthcare"), h6("XLI - Industrials"), h6("XLB - Materials"), h6("XLK - Technology"), h6("XLU - Utilities")
                            ),
                            mainPanel(
                              plotlyOutput('etf_plot1', width = "100%"), h2("Summary"), 
                              h3("As expected we see that the Energy sector's share of market has moved from 21.7% in 
                              2007 to 10.9% in 2017, a significant
                                 reduction. Also as expected we see that technology has moved up from 7.2% to 10.1%, 
                                 although it should be noted that the increase was not as strong as in FANG stocks, 
                                 which leads us to believe that the increase was isolated to only few internet companies 
                                 and left a lot of old tech companies behind. A more interesting observation was in a 
                                 significant increase in the share of XLU, XLV and XLY representing consumer discretionary, 
                                 Healthcare and Utilities, those sectors have benefited in the past 10 years."),
                              h2("Data Sources"), h6("https://www.zacks.com/stock/chart/nflx/fundamental/market-cap"), h6("https://finance.yahoo.com/quote/spy/history?p=spy")
                            ))
))