# Script para criação da figura com gif animado
# necessário conexão com a internet para baixar os pacotes e figuras
# lembrando que as imagens serão salvas no diretório de trabalho

# install.packages("magick")
# install.packages("rsvg")
library(magick)
danca <- image_read("http://bestanimations.com/Music/Dancers/happy-dance/happy-dance-animated-gif-image-1-2.gif")
front <- image_scale(danca, "200")
png(file = "NEspecies.png")
barplot(c(0.5, 2, 5, 4, 8), names.arg=c("Area 1","Area 2","Area 3","Area 4","Area 5"), ylab="Nº de espécies", col="#00BCD4", border=FALSE)
dev.off()
background <- image_read("NEspecies.png")
frames <- image_apply(front, function(x){image_composite(background, x, offset = "+50+120")})
image_animate(frames, fps = 10)
animation <- image_animate(frames, fps = 10)
image_write(animation, "NEspecies.gif")