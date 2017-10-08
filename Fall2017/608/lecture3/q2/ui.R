df = read.csv("https://raw.githubusercontent.com/jelikish/Cuny1/master/Fall2017/608/lecture3/cleaned-cdc-mortality-1999-2010-2.csv", header = TRUE)
dfchoice=as.character(unique(df$ICD.Chapter))
dfchoice_state=as.character(unique(df$State))


fluidPage(
  headerPanel('Mortality rate by State vs National Average'),
  sidebarPanel(
    selectInput('State', 'State', dfchoice_state, selected='NY'),
    selectInput('desease', 'Cause of Death', dfchoice, selected='Neoplasms')
  ),
  mainPanel(
    plotOutput('plot', width = "100%")
  )
)