# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

Lecture slides for the course **"Metodi Statistici per la Neuropsicologia Forense"** (Università di
Padova / IRCCS San Camillo, Venezia). Content is in Italian; `ENG-*` files are English translations of
selected decks. Author: Giorgio Arcara. Licensed CC BY-NC 3.0 (see `LICENSE.txt`) — keep the
attribution/licence blocks on title slides intact.

This is a content repository, not a software project. There is no application, no test suite, no lint.

## Build

Each deck is a numbered `NN-Name.qmd` rendered with Quarto to LaTeX Beamer:

```
quarto render "04c_Affidabilità_formule.qmd"   # one deck
quarto render                                   # all decks
```

- Toolchain: Quarto ≥ 1.7, `pdf-engine: xelatex`, a LaTeX install (TeX Live / TinyTeX) with
  `beamer`, TikZ, `FiraSans` and `fontawesome5`.
- `keep-tex: true` is set, so rendering (re)writes both `Name.tex` and `Name.pdf`.
- **`.qmd`, `.tex`, and `.pdf` are all committed.** After editing a `.qmd`, re-render and commit the
  regenerated `.tex` and `.pdf` together with it.
- LaTeX side-artifacts (`.aux`, `.log`) are not covered by `.gitignore`; do not stage them.
- Filenames contain spaces and accented characters (`à`) — always quote paths.

## Per-deck structure (conventions to follow when editing or adding slides)

The YAML front matter is identical across decks: `format: beamer` with `keep-tex: true`,
`aspectratio: 169`, `section-titles: false`, `pdf-engine: xelatex`, `include-in-header: nf-macros.tex`,
and `incremental` (false everywhere except deck 03). Copy it verbatim from a neighbouring deck rather
than reinventing it. `00-Template.qmd` is the starting point for a new deck.

- **Style**: `nf-macros.tex` loads `unipdwarsawstyle.sty` (UniPD crimson/gold Warsaw style, copied
  unchanged from the "Time Management" course) and defines the palette (`unipdCrimson`, `unipdGold`,
  `unipdCream`, `nfInk`, `nfGrey`) and the slide macros:
  - `\nftitleslide{N · Titolo}` on a `## {.plain}` frame — the title slide;
  - `\wooclapslot{tipo}{domanda}{istruzioni}{minuti}{Figures/qr.png}{codice}` and
    `\padletslot{tipo}{domanda}{istruzioni}{minuti}{Figures/qr.png}` — activity slides with QR;
  - `\iconrow{\faIcon}{testo}` — bullet with an icon in a crimson disc;
  - `\takeaway{...}` — "In sintesi" strip at the bottom of a slide.
- **Image height cap**: `nf-macros.tex` scales any image taller than `\nfmaxheight`
  (0.74 `\textheight`) down, so width-based sizes cannot run off the shorter 16:9 frame. If a slide
  still overflows (image + text), reduce that image's size on the slide.
- **`#` heading** = section divider frame (drawn by `\AtBeginSection` in `nf-macros.tex`);
  **`##` heading** = a slide/frame.
- **Layout, figures, overlays** are done with raw ` ```{=latex} ` blocks: `\begin{columns}` /
  `\begin{column}{0.5\textwidth}`, `\begin{tikzpicture}` for image annotations, `\begin{figure}` /
  `\includegraphics[scale=...]{Figures/xxx.png}`. Plain markdown is used for prose, bullets, and math.
- **Math**: `$$ ... $$`; symbol glossaries follow as a small `\begin{aligned}` block.
- `\pause`, `\vspace{...}`, `\small` / `\scriptsize` are used inline for pacing and fit.
- Decks cross-reference shared "Appendice" slides on basic statistics — preserve those references.

## Assets

- `Figures/` — every image (~100 PNGs), including course/institution logos. Referenced as
  `Figures/xxx.png`. Figures are **pre-generated**; the `.qmd` decks contain no executable `{r}`
  chunks.
- `fonts/` — Libertinus OTF files (not currently wired into the YAML).
- `hists_dati_norm.R` (ggplot figure generation) and `Caso_Esempio.Rmd` (a worked forensic case) are
  standalone helpers, **not** part of any deck's build.

## Git

Work happens on version/topic branches (e.g. `v0.0.4`, `dev2627`) merged into `main` via pull request.
