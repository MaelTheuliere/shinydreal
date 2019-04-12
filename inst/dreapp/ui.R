ui <- function(request){
    dr_navbarPage(
        title = "DREAL - Application démo",
        menu = dr_navItems(
            dr_navItem("trois","Am"),
            dr_navItem("un","Stram"),
            dr_navItem("deux","Gram"),
            dr_navItem("quatre","Pic"),
            dr_navItem("cinq","Pic")#,
            #dr_navItem("resume","Voir tous les éléments")
        ), 
        dr_panel(
            id = "trois",
            mod_panel_3_ui("panel_3_ui_1")
        ),
        dr_panel(
            id = "un",
            mod_panel_1_ui("panel_1_ui_1")
        ),
        dr_panel(
            id = "deux",
            mod_panel_2_ui("panel_2_ui_1")
        ),
        dr_panel(
            id = "quatre",
            mod_panel_4_ui("panel_4_ui_1")
        ),
        dr_panel(
            id = "cinq",
            mod_panel_5_ui("panel_5_ui_1")
        )#,
        # dr_panel(
        #     id = "resume",
        #     mod_panel_resume_ui("panel_resume_ui_1")
        # )
    )
}