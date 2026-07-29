# Build instructions

## Local build

Requirements:

- TeX Live 2024 or a comparable current TeX distribution;
- `latexmk`;
- `pdflatex`;
- BibTeX.

From the repository root:

```bash
make
```

Equivalent direct command:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

The stable output is copied to:

```text
build/Group5_Deep_Hedging_Presentation.pdf
```

Clean auxiliary files while preserving the stable PDF:

```bash
make clean
```

Remove auxiliary files and the built PDF:

```bash
make distclean
```

## Overleaf

1. Upload the repository contents with `main.tex` at project root.
2. Set the compiler to **pdfLaTeX**.
3. Set the main document to `main.tex`.
4. Recompile from scratch once so BibTeX and frame totals settle.

No shell escape, local system fonts, proprietary assets or external downloads are required.

## Notes

- The deck is 16:9 Beamer.
- Main-slide numbering is fixed at 18. Backup slides display `Backup` rather than extending the audience-facing main count.
- Speaker notes live in `speaker_notes.md`; short matching `\note{}` blocks are embedded in the main slide source.
- Numerical and equation sources are mapped in `traceability.md`.
