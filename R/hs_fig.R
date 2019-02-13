##############################
# HS
##############################

n.lines <- 80

source("meiosis_func.R")

for(bw in c(FALSE, TRUE)) {


    bgcolor <- ifelse(bw, "white", broman::brocolors("bg"))
    color <- qtl2::CCcolors


    output_file <- paste0("../Figs/hs",
                          ifelse(bw, "_bw", ""),
                          ".pdf")

    pdf(output_file, width=9.75, height=5.5, pointsize=16, onefile=TRUE)


    par(mar=rep(0.1,4), las=1, bty="n")
    if(!bw) {
        par(fg="white",col="white",col.axis="white",col.lab="white", bg=bgcolor)
    }
    plot(0,0,xlim=c(0,864),ylim=c(25,480),xaxt="n",yaxt="n",xlab="",ylab="",type="n")

    u <- par("usr")
    text(u[1],460,expression(G[0]),adj=c(0,0.5))

    xloc <- 10
    yloc <- 480
    for(i in 1:8) {
        rect(xloc,yloc,xloc+8,yloc-40,col=color[i],border=color[i], lend=1, ljoin=1)
        rect(xloc+20,yloc,xloc+28,yloc-40,col=color[i],border=color[i], lend=1, ljoin=1)
        text(xloc+14,yloc-50,LETTERS[i],adj=c(0.5,1))

        xloc <- xloc+38+35+46
    }

    set.seed(11716365)
    gen <- vector("list", n.lines)
    for(i in 1:n.lines)
        gen[[i]] <- create.par(100, sample(1:8, 2))
    wh <- seq(1, n.lines, by=5)

    xloc <- 10
    yloc <- yloc - 80
    for(i in 1:15) {
        g <- c(gen[[wh[i]]][[1]][2,1], gen[[wh[i]]][[2]][2,1])
        rect(xloc,yloc,xloc+8,yloc-40,col=color[g[1]],border=color[g[1]], lend=1, ljoin=1)
        rect(xloc+20,yloc,xloc+28,yloc-40,col=color[g[2]],border=color[g[2]], lend=1, ljoin=1)

        xloc <- xloc+(38+35+46)/2
    }
    text(u[1],yloc-20,expression(G[1]),adj=c(0,0.5))

    mysample <- function(n)
        as.numeric(t(apply(matrix(1:n, ncol=2, byrow=TRUE), 2, sample)))

    old <- gen[mysample(n.lines)]
    for(i in 1:(n.lines/2)) {
        gen[[i*2-1]] <- cross(old[[i*2-1]], old[[i*2]])
        gen[[i*2]] <- cross(old[[i*2-1]], old[[i*2]])
    }

    xloc <- 10
    yloc <- yloc - 80
    for(i in 1:15) {
        thegen <- gen[[wh[i]]]
        g <- c(thegen[[1]][2,1], thegen[[2]][2,1])

        rect(xloc,yloc,xloc+8,yloc-40,col=color[g[1]],border=color[g[1]], lend=1, ljoin=1)
        rect(xloc+20,yloc,xloc+28,yloc-40,col=color[g[2]],border=color[g[2]], lend=1, ljoin=1)

        mult <- 40/thegen[[1]][1,ncol(thegen[[1]])]
        xxloc <- c(xloc, xloc+20)
        for(k in 1:2) {
            temp <- thegen[[k]]
            for(j in 2:ncol(temp)) {
                rect(xxloc[k],yloc-40+temp[1,j]*mult,xxloc[k]+8,yloc-40+temp[1,j-1]*mult,
                     col=color[temp[2,j]],border=color[temp[2,j]], lend=1, ljoin=1)
            }
        }

        xloc <- xloc+(38+35+46)/2
    }
    text(u[1],yloc-20,expression(G[2]),adj=c(0,0.5))


    for(kk in 3:10) {
        old <- gen[mysample(n.lines)]
        for(i in 1:(n.lines/2)) {
            gen[[i*2-1]] <- cross(old[[i*2-1]], old[[i*2]])
            gen[[i*2]] <- cross(old[[i*2-1]], old[[i*2]])
        }
    }

    xloc <- 10
    yloc <- yloc - 80
    for(i in 1:15) {
        thegen <- gen[[wh[i]]]
        g <- c(thegen[[1]][2,1], thegen[[2]][2,1])

        rect(xloc,yloc,xloc+8,yloc-40,col=color[g[1]],border=color[g[1]], lend=1, ljoin=1)
        rect(xloc+20,yloc,xloc+28,yloc-40,col=color[g[2]],border=color[g[2]], lend=1, ljoin=1)

        mult <- 40/thegen[[1]][1,ncol(thegen[[1]])]
        xxloc <- c(xloc, xloc+20)
        for(k in 1:2) {
            temp <- thegen[[k]]
            for(j in 2:ncol(temp)) {
                rect(xxloc[k],yloc-40+temp[1,j]*mult,xxloc[k]+8,yloc-40+temp[1,j-1]*mult,
                     col=color[temp[2,j]],border=color[temp[2,j]], lend=1, ljoin=1)
            }
        }

        xloc <- xloc+(38+35+46)/2
    }
    text(u[1],yloc-20,expression(G[10]),adj=c(0,0.5))


    for(kk in 11:15) {
        old <- gen[mysample(n.lines)]
        for(i in 1:(n.lines/2)) {
            gen[[i*2-1]] <- cross(old[[i*2-1]], old[[i*2]])
            gen[[i*2]] <- cross(old[[i*2-1]], old[[i*2]])
        }
    }

    xloc <- 10
    yloc <- yloc - 80
    for(i in 1:15) {
        thegen <- gen[[wh[i]]]
        g <- c(thegen[[1]][2,1], thegen[[2]][2,1])

        rect(xloc,yloc,xloc+8,yloc-40,col=color[g[1]],border=color[g[1]], lend=1, ljoin=1)
        rect(xloc+20,yloc,xloc+28,yloc-40,col=color[g[2]],border=color[g[2]], lend=1, ljoin=1)

        mult <- 40/thegen[[1]][1,ncol(thegen[[1]])]
        xxloc <- c(xloc, xloc+20)
        for(k in 1:2) {
            temp <- thegen[[k]]
            for(j in 2:ncol(temp)) {
                rect(xxloc[k],yloc-40+temp[1,j]*mult,xxloc[k]+8,yloc-40+temp[1,j-1]*mult,
                     col=color[temp[2,j]],border=color[temp[2,j]], lend=1, ljoin=1)
            }
        }

        xloc <- xloc+(38+35+46)/2
    }
    text(u[1],yloc-20,expression(G[15]),adj=c(0,0.5))

    for(kk in 16:20) {
        old <- gen[mysample(n.lines)]
        for(i in 1:(n.lines/2)) {
            gen[[i*2-1]] <- cross(old[[i*2-1]], old[[i*2]])
            gen[[i*2]] <- cross(old[[i*2-1]], old[[i*2]])
        }
    }

    xloc <- 10
    yloc <- yloc - 80
    for(i in 1:15) {
        thegen <- gen[[wh[i]]]
        g <- c(thegen[[1]][2,1], thegen[[2]][2,1])

        rect(xloc,yloc,xloc+8,yloc-40,col=color[g[1]],border=color[g[1]], lend=1, ljoin=1)
        rect(xloc+20,yloc,xloc+28,yloc-40,col=color[g[2]],border=color[g[2]], lend=1, ljoin=1)

        mult <- 40/thegen[[1]][1,ncol(thegen[[1]])]
        xxloc <- c(xloc, xloc+20)
        for(k in 1:2) {
            temp <- thegen[[k]]
            for(j in 2:ncol(temp)) {
                rect(xxloc[k],yloc-40+temp[1,j]*mult,xxloc[k]+8,yloc-40+temp[1,j-1]*mult,
                     col=color[temp[2,j]],border=color[temp[2,j]], lend=1, ljoin=1)
            }
        }

        xloc <- xloc+(38+35+46)/2
    }
    text(u[1],yloc-20,expression(G[20]),adj=c(0,0.5))

    dev.off()
}
