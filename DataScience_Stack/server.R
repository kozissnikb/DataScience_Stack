library(shiny)

shinyServer(function(input, output) {

    getPage1 <- function() {
        return(includeHTML("python_lda.html"))
    }
    output$python_topic<-renderUI({getPage1()})
    
    output$py_bigrams <- renderPlotly({
        
        top_20_python_bigrams <- python_bigrams[c(1:15), c(2:3)]
        
       py_bi <-  ggplot(top_20_python_bigrams, aes(x=reorder(Bigram, -Freq), y=Freq, fill=Freq,
                                          text = paste0('<br>Frequency: ', Freq, '<br>Bigram: ', Bigram))) +
            geom_bar(stat="identity") +
            labs(y = "Frequency") +
            theme(axis.text.x=element_text(angle = 45, hjust = 1),
                  axis.title.x=element_blank()) +
            guides(fill=FALSE)
        
        ggplotly(py_bi, tooltip = "text")
        
    }) #close renderPlot
    
    output$py_trigrams <- renderPlotly({
        
        top_20_python_trigrams <- python_trigrams[c(1:15), c(2:3)]
        
       py_tri <- ggplot(top_20_python_trigrams, aes(x=reorder(Trigram, -Freq), y=Freq, fill=Freq,
                                           text = paste0('<br>Frequency: ', Freq, '<br>Trigram: ', Trigram))) +
            geom_bar(stat="identity") +
            labs(y = "Frequency") +
            theme(axis.text.x=element_text(angle = 45, hjust = 1),
                  axis.title.x=element_blank()) +
            guides(fill=FALSE)
        
        ggplotly(py_tri, tooltip = "text")
        
    }) #close renderPlot
    
    
    getPage2 <- function() {
        return(includeHTML("sql_lda.html"))
    }
    output$sql_topic<-renderUI({getPage2()})
    
    output$sq_bigrams <- renderPlotly({
        
        top_20_sql_bigrams <- sql_bigrams[c(1:15), c(2:3)]
        
        sq_bi <- ggplot(top_20_sql_bigrams, aes(x=reorder(Bigram, -Freq), y=Freq, fill=Freq,
                                                text = paste0('<br>Frequency: ', Freq, '<br>Bigram: ', Bigram))) +
            geom_bar(stat="identity") +
            labs(y = "Frequency") +
            theme(axis.text.x=element_text(angle = 45, hjust = 1),
                  axis.title.x=element_blank()) +
            guides(fill=FALSE)
        
        ggplotly(sq_bi, tooltip = "text")
        
    }) #close renderPlot
    
    output$sq_trigrams <- renderPlotly({
        
        top_20_sql_trigrams <- sql_trigrams[c(1:15), c(2:3)]
        
       sq_tri <- ggplot(top_20_sql_trigrams, aes(x=reorder(Trigram, -Freq), y=Freq, fill=Freq,
                                                 text = paste0('<br>Frequency: ', Freq, '<br>Trigram: ', Trigram))) +
            geom_bar(stat="identity") +
            labs(y = "Frequency") +
            theme(axis.text.x=element_text(angle = 45, hjust = 1),
                  axis.title.x=element_blank()) +
            guides(fill=FALSE)
        
        ggplotly(sq_tri, tooltip = "text")
        
    }) #close renderPlot
    
    
    
    getPage3 <- function() {
    return(includeHTML("r_lda.html"))
    }
    output$r_topic<-renderUI({getPage3()})
    
    output$ar_bigrams <- renderPlotly({
        
        top_20_r_bigrams <- r_bigrams[c(1:15), c(2:3)]
        
        r_bi <- ggplot(top_20_r_bigrams, aes(x=reorder(Bigram, -Freq), y=Freq, fill=Freq,
                                             text = paste0('<br>Frequency: ', Freq, '<br>Bigram: ', Bigram))) +
            geom_bar(stat="identity") +
            labs(y = "Frequency") +
            theme(axis.text.x=element_text(angle = 45, hjust = 1),
                  axis.title.x=element_blank()) +
            guides(fill=FALSE)
        
        ggplotly(r_bi, tooltip = "text")
        
    }) #close renderPlot
    
    output$ar_trigrams <- renderPlotly({
        
        top_20_r_trigrams <- r_trigrams[c(1:15), c(2:3)]
        
        r_tri <- ggplot(top_20_r_trigrams, aes(x=reorder(Trigram, -Freq), y=Freq, fill=Freq,
                                               text = paste0('<br>Frequency: ', Freq, '<br>Trigram: ', Trigram))) +
            geom_bar(stat="identity") +
            labs(y = "Frequency") +
            theme(axis.text.x=element_text(angle = 45, hjust = 1),
                  axis.title.x=element_blank()) +
            guides(fill=FALSE)
        
        ggplotly(r_tri, tooltip = "text")
        
    }) #close renderPlot
    
    output$popularity <- renderPlotly({
        
        tags_ltd <- all_tags[c(1:200),c(1:8)]
        
        tags_top10 <- tags_ltd[c(1:7, 9:11), c(2:8)] 
        tags_top10_tidy <- gather(tags_top10, "year", "counts", 2:7)
        
        #ggplot(tags_top10_tidy, aes(x=year, y=counts, group=tag, color=tag)) +
            #geom_line() +
            #geom_point() +
            #scale_y_continuous(breaks = scales::pretty_breaks(n = 7)) +
            #labs(y = "Count", x="Year") +
            #theme(legend.title = element_blank())
        
        fig1 <- plot_ly(tags_top10_tidy, x = ~year, y= ~counts, color= ~tag,
                       type = 'scatter', mode = 'lines+markers',
                       hoverinfo = 'text',
                       text = ~paste('<br>Year: ', year, '<br>Tag: ', tag, '<br>Count:', counts))
        fig1 <- fig1 %>% layout(xaxis = list(title = "Year"),
                              yaxis = list(title = "Count"))
        
        fig1
        
    }) #close renderPlot
    
    output$py_pop <- renderPlotly({
        
        tags_ltd <- all_tags[c(1:200),c(1:8)]
        
        tags_py <- tags_ltd[c(20,22,33,48,56,76,82,192), c(2:8)] 
        tags_py_tidy <- gather(tags_py, "year", "counts", 2:7)
        
        fig2 <- plot_ly(tags_py_tidy, x = ~year, y= ~counts, color= ~tag,
                        type = 'scatter', mode = 'lines+markers',
                        hoverinfo = 'text',
                        text = ~paste('<br>Year: ', year, '<br>Tag: ', tag, '<br>Count:', counts))
        fig2 <- fig2 %>% layout(xaxis = list(title = "Year"),
                                yaxis = list(title = "Count"))
        
        fig2
        
    }) #close renderPlot
    
    output$machine_learning <- renderPlotly({
        
        tags_ltd <- all_tags[c(1:200),c(1:8)]
        
        tags_ml <- tags_ltd[c(48,76,87,139,164,165), c(2:8)] 
        tags_ml_tidy <- gather(tags_ml, "year", "counts", 2:7)
        
        fig3 <- plot_ly(tags_ml_tidy, x = ~year, y= ~counts, color= ~tag,
                        type = 'scatter', mode = 'lines+markers',
                        hoverinfo = 'text',
                        text = ~paste('<br>Year: ', year, '<br>Tag: ', tag, '<br>Count:', counts))
        fig3 <- fig3 %>% layout(xaxis = list(title = "Year"),
                                yaxis = list(title = "Count"))
        
        fig3
        
    }) #close renderPlot
    
    output$cloud <- renderPlotly({
        
        tags_ltd <- all_tags[c(1:200),c(1:8)]
        
        tags_cloud <- tags_ltd[c(37,47,105,111,120,189), c(2:8)] 
        tags_cloud_tidy <- gather(tags_cloud, "year", "counts", 2:7)
        
        fig4 <- plot_ly(tags_cloud_tidy, x = ~year, y= ~counts, color= ~tag,
                        type = 'scatter', mode = 'lines+markers',
                        hoverinfo = 'text',
                        text = ~paste('<br>Year: ', year, '<br>Tag: ', tag, '<br>Count:', counts))
        fig4 <- fig4 %>% layout(xaxis = list(title = "Year"),
                                yaxis = list(title = "Count"))
        
        fig4
        
    }) #close renderPlot
        
}) # closes shinyServer
