library(shiny)
library(shinydashboard)


shinyUI(
    fluidPage(
        dashboardPage(skin = "yellow",
            dashboardHeader(title = 'Capstone Project'),
            dashboardSidebar(
                sidebarMenu(
                actionLink(inputId='ab1', label="Bettina Kozissnik", 
                           icon = icon("github"), 
                           onclick ="window.open('https://github.com/kozissnikb', '_blank')"),
                br(),
                br(),
                menuItem(HTML('Overview'), tabName = 'overview'),
                menuItem(HTML('Python Details'), tabName = 'python'),
                menuItem(HTML('SQL Details'), tabName = 'sql'),
                menuItem(HTML('R Details'), tabName = 'arrrr'),
                menuItem(HTML('Trends'), tabName = 'trends'),
                br(),
                actionLink(inputId='ab2',
                           HTML('<img src="stack_icon.png", height="175", width="175">'),
                           onclick = "window.open('https://stackoverflow.com', '_blank')"),
                br()
                ) #closes sidebarMenu
            ), # closes dashboardSidebar
            dashboardBody(
                tabItems(
                tabItem(tabName = 'overview',
                        title = '', status = 'primary', solidHeader = TRUE, width=3,
                        h3('StackOverflow - An NLP Analysis'),
                        fluidRow(column(width = 12,
                                        h5('Stack Overflow is a popular resource for software developers. With this Dashboard, I want to 
                                        enable you to dive a little deeper into the questions on Stack Overflow focusing on programming 
                                        languages, such as Python, SQL and R, as well as other topics relevant to Data Science.'),br(),
                                        HTML('<img src="wordcloud.png" height="600" width="900">'))
                        ) # closes FluidRow
                ), # closes tabItem
                
                tabItem(tabName = 'python',
                        title = '', status = 'primary', solidHeader = TRUE, width=3,
                        h3('Topic Modeling on Python tagged StackOverflow Questions'),
                        fluidRow(column(width = 12,
                                        h5('Python is without a question an amazing programming language. Just using base Python, numpy,
                                        pandas, matplotlib and seaborn packages/libraries allows for straight forward data cleaning, analysis and 
                                        visualization. However, once you add other packages, such as requests (for scraping websites), beautifulSoup (dealing with HTML), 
                                        sklearn (machine learning),Gensim or SpaCy (Natural Language Processing) and you quickly understand why it continues to grow in
                                        popularity.'),br(),
                                        htmlOutput("python_topic")
                        ) # close column
                        ), #close fluidRow
                        fluidRow(column(width = 6,
                                        box(title = "Most Frequent Python Bigrams", width = NULL, status = 'danger', solidHeader = TRUE,  height=415, 
                                        plotlyOutput("py_bigrams", height=350),br()
                                       # h5("this and that.")
                                           )# close box
                                ),# close column
                                column(width = 6,
                                       box(title = "Most Frequent Python Trigrams", width = NULL, status = 'danger', solidHeader = TRUE, height=415,
                                       plotlyOutput("py_trigrams", height=350),br()
                                      # h5("this and that.")
                                          )# close box
                                )# close column
                        ) #close fluidRow
                ), #close tabItem
              
                tabItem(tabName = 'sql',
                        title = '', status = 'primary', solidHeader = TRUE, width=3,
                        h3('Topic Modeling on SQL tagged StackOverflow Questions'),
                        fluidRow(column(width = 12,
                                        h5('SQL is an incredible powerful tool to gather and join data from multiple tables or databases. 
                                        Therefore, it is not only a popular tool in data analytics, but also in data science.'),br(),
                                       htmlOutput("sql_topic")
                                ) #close column
                        ), #close fluidRow
                        fluidRow(column(width = 6,
                                        box(title = "Most Frequent SQL Bigrams", width = NULL, status = 'danger', solidHeader = TRUE,  height=415, 
                                            plotlyOutput("sq_bigrams", height=350),br()
                                            # h5("this and that.")
                                        )# close box
                        ),# close column
                        column(width = 6,
                               box(title = "Most Frequent SQL Trigrams", width = NULL, status = 'danger', solidHeader = TRUE, height=415,
                                   plotlyOutput("sq_trigrams", height=350),br()
                                   # h5("this and that.")
                               )# close box
                        )# close column
                        ) #close fluidRow
                ), #close tabItem
                
                tabItem(tabName = 'arrrr',
                        title = '', status = 'primary', solidHeader = TRUE, width=3,
                        h3('Topic Modeling on R tagged StackOverflow Questions'),
                        fluidRow(column(width = 12,
                                        h5('R is an incredible programming language not only for statisticians'),br(),
                                        htmlOutput("r_topic")
                                          
                                 ) #close column
                        ), #close fluidRow
                        fluidRow(column(width = 6,
                                        box(title = "Most Frequent R Bigrams", width = NULL, status = 'danger', solidHeader = TRUE,  height=415, 
                                            plotlyOutput("ar_bigrams", height=350),br()
                                            # h5("this and that.")
                                        )# close box
                        ),# close column
                        column(width = 6,
                               box(title = "Most Frequent R Trigrams", width = NULL, status = 'danger', solidHeader = TRUE, height=415,
                                   plotlyOutput("ar_trigrams", height=350),br()
                                   # h5("this and that.")
                               )# close box
                        )# close column
                        ) #close fluidRow
                ), #close tabItem
                tabItem(tabName = 'trends',
                        title = '', status = 'primary', solidHeader = TRUE, width=3,
                        h3('An Insight into StackOverflow Questions'),br(),
                        fluidRow(column(width = 6,
                                        box(title = "Most Popular Tags", width = NULL, status = 'warning', solidHeader = TRUE,  height=500, 
                                            plotlyOutput("popularity", height=350),br(),
                                            h5("While some programming languages such as Java and JavaScript seem to be regaining some of their lost popularity
                                               there are two clear winners: Python and reactjs, an open-source JavaScript library for building user-interfaces 
                                               (web framework).")
                                        )# close box
                        ),# close column
                                column(width = 6,
                                       box(title = "Most Popular Python Packages", width = NULL, status = 'warning', solidHeader = TRUE, height=500,
                                            plotlyOutput("py_pop", height=350),br(),
                                            h5("One of the reasons, why Python is becoming so popular is explained by it's incredible versatility, 
                                               illustrated here by Django, an open-source Python web framework.")
                                            )# close box
                        )# close column
                        ), #close fluidRow
                        fluidRow(column(width = 6,
                                        box(title = "Most Popular Machine Learning Tags", width = NULL, status = 'warning', solidHeader = TRUE,  height=500, 
                                            plotlyOutput("machine_learning", height=350),br(),
                                            h5("At least when it comes to StackOverflow questions, machine learning is Pythonic and that is clearly 
                                               reflected here. Quite impressive is the rise of Tensorflow and Keras.")
                                        )# close box
                        ),# close column
                                column(width = 6,
                                       box(title = "Most Popular Web Service Tags", width = NULL, status = 'warning', solidHeader = TRUE, height=500,
                                           plotlyOutput("cloud", height=350),br(),
                                           h5("Web Services are becoming increasingly important. Amazon and Microsoft (Azure) are dominating the market, 
                                              but Google Firestore could become a contender in a couple of years, if its popularity continues to increase.")
                               )# close box
                        )# close column
                        ) #close fluidRow
                 ) #close tabItem
                ) #closes tabItems
            ) #closes dashboardBody
         ) #close dashboardPage
    ) #close fluidPage
) #close ShinyUI 
