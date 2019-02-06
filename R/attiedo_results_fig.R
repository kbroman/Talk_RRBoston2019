# make figure with some Attie DO results

library(qtl2)
library(broman)

file <- "attie_do_results.RData"
if(file.exists(file)) {
    load(file)
} else {
    library(qtl2convert)
    library(jsonlite)

    # load results for weight change, week 11 vs 1
    load("wtchg_wk11v1_scan.RData")

    out <- as.matrix(setNames(scan_output$lod$A$lod,
                              scan_output$lod$A$marker))
    colnames(out) <- "wtchg_wk11v1"
    class(out) <- c("scan1", "matrix")

    map <- map_df_to_list(scan_output$lod$A,
                          chr_column="chr",
                          pos_col="Mb_GRC38",
                          marker_column="marker")

    peaks <- fromJSON("peaks.json")$peaks
    peaks <- peaks[peaks$pheno_group == "clin",]
    peaks <- cbind(lodindex=as.numeric(factor(peaks$pheno)),
                   peaks[,c("pheno", "chr", "pos", "lod", "pheno_type")])
    peaks$pheno_type <- factor(peaks$pheno_type)

    save(out, map, peaks, file=file)
}

bgcolor <- broman::brocolors("bg")

pdf("../Figs/attiedo_results_nolegend.pdf", height=5.5, width=9.5, pointsize=13)
par(bg=bgcolor, fg="white", col="white", col.axis="white", col.lab="white",
    col.main="lightblue")
par(mfrow=c(2,1), mar=c(3.1, 3.1, 1.8, 0.6))

plot(out, map, main="Weight change (week 11 vs 1)",
     altcol="green3", ylim=c(0, 10.25), mgp=c(1.8, 0.3, 0))

group_col <- brocolors("web")[c("silver", "green", "orange", "purple")]
group_col_all <- group_col[as.numeric(peaks$pheno_type)]
plot_lodpeaks(peaks, map, ylim=c(5.5, 10.25), bg=group_col_all, xlab="",
              main="Inferred QTL", ylab="", cex=0.7)
title(xlab="Chromosome", ylab="LOD score", mgp=c(1.8, 0.3, 0))
box()
dev.off()

pdf("../Figs/attiedo_results.pdf", height=5.5, width=9.5, pointsize=13)
par(bg=bgcolor, fg="white", col="white", col.axis="white", col.lab="white",
    col.main="lightblue")
par(mfrow=c(2,1), mar=c(3.1, 3.1, 1.8, 0.6))

levels(peaks$pheno_type) <- sub("ex vivo ", "", levels(peaks$pheno_type))

plot(out, map, main="Weight change (week 11 vs 1)",
     altcol="green3", ylim=c(0, 10.25), mgp=c(1.8, 0.3, 0))

group_col <- brocolors("web")[c("silver", "green", "orange", "purple")]
group_col_all <- group_col[as.numeric(peaks$pheno_type)]
plot_lodpeaks(peaks, map, ylim=c(5.5, 10.25), bg=group_col_all, xlab="",
              main="Inferred QTL", ylab="", cex=0.7)
title(xlab="Chromosome", ylab="LOD score", mgp=c(1.8, 0.3, 0))
legend("topleft", bg="gray90", box.col="black",
       pch=21, pt.bg=group_col, text.col="black", col="black",
       levels(peaks$pheno_type), ncol=2, cex=0.85)
box()
dev.off()
