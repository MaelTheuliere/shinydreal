dr_list <- c("drl-abeille", "drl-arbre", "drl-ble", "drl-buche-de-bois", "drl-cadastre", "drl-camion", "drl-campagne", "drl-economie-infini", "drl-eolienne", "drl-explosion", "drl-eprouvette", "drl-erlenmeyer", "drl-flamme", "drl-grue", "drl-innondation", "drl-littoral", "drl-maison", "drl-oiseau", "drl-panneau-solaire", "drl-planete", "drl-poisson", "drl-poubelle", "drl-route", "drl-submersion-marine", "drl-thermometre", "drl-tracteur", "drl-tuyauterie", "drl-usine", "drl-vache", "drl-velo", "drl-ville", "drl-voie-ferree")

line_a_list <- readLines("inst/line-awesome/css/line-awesome.css") 
line_a_list <- line_a_list[192:845] 


dr_icon_list <- c(dr_list, line_a_list)
usethis::use_data(dr_icon_list, overwrite = TRUE)
