# example spreadsheets

library(broman)





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
