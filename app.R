#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
           
   br(),
   
   div(style="background-color:#424141;",
        br(),
        h3("Teeth Attractiveness Prediction",style = "color:white;padding-left:20px"),
        h6("Using Deep Learning",style = "color:white;padding-left:20px"),
        h3("Oral Care",style = "color:white;padding-left:20px"),
        h5("Quantitative Science",style = "color:white;padding-left:20px"),
        br()),
   
   #absolutePanel(tags$style(type = "text/css",
   #                         ".shiny-output-error{visibility:hidden;}",
   #                         ".shiny-output-error:before{visibility:hidden;}"),
    #             top = 240,width = "60%",left = "20%",
     #            HTML("<img align=\"middle\" src='example.png'>")),
   
   absolutePanel(tags$style(type = "text/css",
                           ".shiny-output-error{visibility:hidden;}",
                           ".shiny-output-error:before{visibility:hidden;}"),
                 top = 240,width = "60%",left = "20%",
                h2("你好，我们在收集照片分析不同人的牙齿和牙龈的状况",align = "center"),
                ######
                ###p("add your introduction here")
                ###
                #hr(),
                h4("Step1 拍摄照片"),
                h5("请按照示例图为您的牙齿牙龈拍摄三张照片，照片中需要能够看到牙齿和牙龈:"),
                #add the example image, the image used here should be saved in the "www" folder under the folder containing app.r
                HTML("<center><img align=\"middle\" src='example.png' width=\"45%\"></center>"),
                hr()),
   
   absolutePanel(tags$style(type = "text/css",
                            ".shiny-output-error{visibility:hidden;}",
                            ".shiny-output-error:before{visibility:hidden;}"),
                 top =700,width = "60%",left = "20%",
              
                
                column(12,
                div(HTML("<script src=\"webcam.js\"></script>
                          <h5>将您的牙齿牙龈放入以下蓝色框线中，并拍照：</h5>
                          <br>
                          <center><div id=\"my_camera\" style=\"width:960px; height:720px;\"></div></center>
                          <style>
                          .button {
                            background-color: #555555;
                            border: none;
                            color: white;
                            padding: 5px 20px;
                            text-align: center;
                            text-decoration: none;
                            display: inline-block;
                            font-size: 20px;
                            margin: 4px 2px;
                            cursor: pointer;
                          }
                          </style>
                        <br>
                        <center><a class=\"button\" href=\"javascript:void(take_snapshot())\">拍 照</a></center>")))),
   
   absolutePanel(tags$style(type = "text/css",
                            ".shiny-output-error{visibility:hidden;}",
                            ".shiny-output-error:before{visibility:hidden;}"),
                 top = 1100,width = "60%",left = "20%",
                 hr(),
                column(12,
                       
                       div(HTML("<script src=\"webcam.js\"></script>
                                <h5>请点击“保存”来保存您的图片：</h5>
                                <center><div id=\"results\"></div></center>
                                
                                
                                <script language=\"JavaScript\">
                                Webcam.set({
                            
                                image_format: 'jpeg',
                                jpeg_quality: 100,
                                force_flash: false,
                                flip_horiz: true,
                                fps: 45
                                });
                                Webcam.attach( '#my_camera' );
                                
                                function take_snapshot() {
                                
                                Webcam.snap( function(data_uri) {
                                
                                document.getElementById('results').innerHTML = 
                                '<img src=\"'+data_uri+'\"/>' +
                                '<br>' +
                                '<br>' +
                                '<a class=\"button\" href =\"'+data_uri+'\" download>保 存</a>'

                                });

                                }
                                
                                
                                </script>"
                                
                               )))),
   
   absolutePanel(tags$style(type = "text/css",
                            ".shiny-output-error{visibility:hidden;}",
                            ".shiny-output-error:before{visibility:hidden;}"),
                 top = 700,width = "60%",left = "20%",
                 
                 
                        column(12,
                               HTML("<h5>将您的牙齿牙龈放入以下蓝色框线中，并拍照：</h5>
                                    <br>
                                    <center><img src = \"box.png\"></img></center>")
                              )),
   absolutePanel(tags$style(type = "text/css",
                            ".shiny-output-error{visibility:hidden;}",
                            ".shiny-output-error:before{visibility:hidden;}"),
                 top = 1100,width = "60%",left = "20%",
                 hr(),
                        column(12,
                               HTML("<h5>请点击“保存”来保存您的图片：</h5>
                                    <center><img src = \"box.png\"></img></center>")
                              
                        )),
                
   absolutePanel(tags$style(type = "text/css",
                            ".shiny-output-error{visibility:hidden;}",
                            ".shiny-output-error:before{visibility:hidden;}"),
                 top = 1500,width = "60%",left = "20%",
                hr(),
                h4("Step2 上传照片："),
                h5("请上传您刚刚保存的三张照片:"),
                fileInput("image1","第1张照片",width = "100%"),
                fileInput("image2","第2张照片",width = "100%"),
                fileInput("image3","第3张照片",width = "100%"),
                hr(),
                
                h4("Step3 请回答以下问题:"),
                textInput("name",h5("1.您的姓名（请使用拼音）"),width = "40%"),
                numericInput("age",h5("2.您的年龄"),value = 20,width = "30%"),
                radioButtons("sex",h5("3.您的性别"),
                             choices = list("男" = 1, "女" = 2), selected = 1,width = "50%"),
                textInput("email",h5("4.您的邮箱"),width = "40%"),
                radioButtons("accept",h5("5.是否愿意接受牙齿吸引力打分的结果"),
                        choices = list("是" = 1, "否" = 2), selected = 1,width = "50%"),
                radioButtons("try",h5("6.是否愿意尝试新产品观察前后变化"),
                        choices = list("是" = 1, "否" = 2), selected = 1,width = "50%"),
                hr(),
                h4("Step3 知情同意(Disclaimer):"),
                radioButtons("agree",h5("如果您同意，您上传的照片将用于宝洁公司内部研究，宝洁公司将保留一切权利。"),
                             choices = list("同意" = 1, "不同意" = 2), selected = 1,width = "100%"),
                actionButton("submit","提交回答",style = "float:right"),
                br(),
                br(),
                hr(),
                h4("您的回答",align = "center"),
                tableOutput("save"),
                br(),
                br(),
                br()
                )
                
                
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   #imagefile <- observeEvent(input$submit,input$image)
   savepath <- "/raid/home/zhangludan/image_collection"
   #savepath <- "/Users/ludanzhang/Dropbox/P&G/image_collection"
   table <- read.csv("image_info.csv")[,-1]
   
   #output$teethimage <- renderImage({
   #        list(src = input$image$datapath,height = 150,alt = "This is alternate text")
   #},deleteFile = F
   #)
   
   info <- eventReactive(input$submit,list(input$name,input$age,input$sex,input$email,input$accept,input$try,input$agree))
   
   output$save <- renderTable({
   info_table <- data.frame(info(),stringsAsFactors = F)
   names(info_table) <- c("name","age","sex","email","accept.score.or.not","try.product.or.not","agree.or.not")
   imagename <- paste0(info_table$name," ",Sys.time())
   info_table$image.name <- imagename
   info_table$sex[which(info_table$sex == "1")] <- "male"
   info_table$sex[which(info_table$sex == "2")] <- "female"
   info_table$accept.score.or.not[which(info_table$accept.score.or.not == "1")] <- "yes"
   info_table$accept.score.or.not[which(info_table$accept.score.or.not == "2")] <- "no"
   info_table$try.product.or.not[which(info_table$try.product.or.not == "1")] <- "yes"
   info_table$try.product.or.not[which(info_table$try.product.or.not == "2")] <- "no"
   info_table$agree.or.not[which(info_table$agree.or.not == "1")] <- "agree"
   info_table$agree.or.not[which(info_table$agree.or.not == "2")] <- "don't agree"
   
   table <- rbind(table,info_table) 
   write.csv(table,"image_info.csv")
   #write.csv(table,"image_info1.csv")
 
   file.copy(input$image1$datapath,paste0(savepath,"/",imagename,"_1.jpg"))
   file.copy(input$image2$datapath,paste0(savepath,"/",imagename,"_2.jpg"))
   file.copy(input$image3$datapath,paste0(savepath,"/",imagename,"_3.jpg"))
   info_table[,c(1:7)]
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

