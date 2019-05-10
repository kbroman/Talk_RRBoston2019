# example spreadsheets

library(broman)


# bad spreadsheet
pdf("../Figs/bad_spreadsheet.pdf", height=5, width=10)
mat3 <- rbind(c("1MIN", rep("", 6)),
              c("", "", "Normal", "", "", "Mutant", ""),
              c("B6", 146.6, 138.6, 155.6, 166.0, 179.3, 186.9),
              c("BTBR", 245.7, 240.0, 243.1, 177.8, 171.6, 188.1),
              rep("", 7),
              c("5MIN", rep("", 6)),
              c("", "", "Normal", "", "", "Mutant", ""),
              c("B6", 333.6, 353.6, 408.8, 450.6, 474.4, 423.8),
              c("BTBR", 514.4, 610.6, 597.9, 412.1, 447.4, 446.5))

excel_fig(mat3, col_names=FALSE)
dev.off()



# data dictionary
pdf("../Figs/data_dict.pdf", height=5, width=10)
mat <- data.frame(name=c("mouse", "sex", "sac_date", "partial_inflation", "coat_color",
                          "crumblers", "diet_days"),
                  plot_name=c("Mouse", "Sex", "Date of sac", "Partial inflation", "Coat color",
                              "Crumblers", "Days on diet"),
                  group=c("demographic", "demographic", "demographic", "clinical", "demographic", "clinical", "clinical"),
                  description=c("Animal identifier", "Male (M) or Female (F)",
                                "Date mouse was sacrificed",
                                "Indicates if mouse showed partial pancreatic inflation",
                                "Coat color, by visual inspection",
                                "Indicates if mouse stored food in their bedding",
                                "Number of days on high-fat diet"),
                  stringsAsFactors=FALSE)
excel_fig(mat, fig_width=690, fig_height=190, cellwidth=c(rep(130, 4), 400), direct2svg=FALSE)
dev.off()
