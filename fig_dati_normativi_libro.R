# Genera le figure del deck 04a (Confronto con dati normativi) a partire dal
# capitolo "Dati normativi, deficit e peggioramento" del libro "Oltre i punteggi".
# Non fa parte del build dei deck: si esegue a mano dalla root di questo repo
#   Rscript fig_dati_normativi_libro.R
# Il codice delle figure NON è copiato qui: viene letto direttamente dalla branch
# del libro (chunk R identificati dalla label), così le figure restano allineate.

library(ggplot2)
library(patchwork)

repo_libro <- "/Users/giorgioarcara/Documents/Projects/2025-Book-Psychometrics/oltre-i-punteggi-elementi"
branch_libro <- "chap-norm"
capitolo <- "chapters/Dati-Normativi.qmd"

righe <- system2("git", c("-C", shQuote(repo_libro), "show",
                          paste0(branch_libro, ":", capitolo)), stdout = TRUE)
Encoding(righe) <- "UTF-8"  # git restituisce testo non marcato: senza, gli accenti si perdono

# estrae il codice del chunk R con una certa label
estrai_chunk <- function(label) {
  pos_label <- grep(paste0("^#\\| label: ", label, "$"), righe)
  stopifnot(length(pos_label) == 1)
  fine <- pos_label + which(righe[(pos_label + 1):length(righe)] == "```")[1]
  righe[(pos_label + 1):(fine - 1)]
}

# esegue il chunk in un ambiente pulito e salva l'ultimo grafico prodotto
salva_figura <- function(label, file, width, height) {
  codice <- estrai_chunk(label)
  grafico <- eval(parse(text = codice), envir = new.env())
  ggsave(file.path("Figures", file), grafico, width = width, height = height,
         dpi = 200, bg = "white")
  message("salvata: Figures/", file)
}

# solo figure riferite all'adulto (la traiettoria di sviluppo è esclusa)
salva_figura("fig-punteggio-20", "norm_punteggio_20.png", 9, 4)
salva_figura("fig-costruzione-istogramma", "norm_costruzione_istogramma.png", 5.8, 5.8)
# pannelli con aspect.ratio = 1: il PNG ha ampi margini bianchi, li taglio (ImageMagick)
system2("magick", c("Figures/norm_costruzione_istogramma.png", "-trim", "+repage", "-bordercolor", "white",
                    "-border", "20", "Figures/norm_costruzione_istogramma.png"))
salva_figura("fig-classificazione-soglia", "norm_classificazione_soglia.png", 8, 3.6)
salva_figura("fig-compromissione-declino", "norm_compromissione_declino.png", 8, 4.2)
salva_figura("fig-tabella-compromissione-declino", "norm_tabella_compromissione_declino.png", 7.5, 4)

# figura già disponibile come PNG nel repo del libro
file.copy(file.path(repo_libro, "Figures/Latex-Fig-Dati-Normativi-Due-Vie/Fig_due-vie-soglia.png"),
          "Figures/norm_due_vie_soglia.png", overwrite = TRUE)
