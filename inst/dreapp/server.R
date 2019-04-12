server <- function(input, output, session){
    
    callModule(mod_panel_1_server, "panel_1_ui_1")
    
    callModule(mod_panel_2_server, "panel_2_ui_1")
    
    callModule(mod_panel_3_server, "panel_3_ui_1")
    
    callModule(mod_panel_4_server, "panel_4_ui_1")

    callModule(mod_panel_5_server, "panel_5_ui_1")
    
    callModule(mod_panel_resume_server, "panel_resume_ui_1")
}
