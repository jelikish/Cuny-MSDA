df = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/lecture3/cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE)
df = filter(df, Year == 2010)
dfchoice=as.character(unique(df$ICD.Chapter))


fluidPage(
  headerPanel('Mortality by casue per State'),
  sidebarPanel(
    selectInput('desease', 'Cause of Death', dfchoice, selected='Neoplasms')
  ),
  mainPanel(
    plotlyOutput('plot', width = "100%")
  )
)


