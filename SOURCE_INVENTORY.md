# Source inventory

Audit date: 3 August 2026.

Source-of-truth order follows the operating specification in `README.md`: submitted report first, then the submitted code/result package, then appendices and provenance material, then the presentation specification.

| Item | Repository path | Role | Status | Notes |
|---|---|---|---|---|
| Operating specification | `README.md` | Build and presentation requirements | Found | Exact copy of the supplied `README(3).md` (1,294 lines). |
| Existing presentation draft | `main.tex` in remote commit `743f691` | Initial Overleaf stub | Found and replaced after audit | The remote contained a 14-line `article` stub with a title page and empty Introduction section. No substantive deck content existed. |
| Submitted report | External supplied file: `MFE_Research_Project_1__Section_B_.pdf` | Primary narrative and numerical source | Found | 71-page final report dated 18 July 2026. Read in full. It provides exact names, title, equations, tables, limitations, contributions, AI disclosure, algorithms, code excerpts and bibliography. It was not altered. |
| Submitted code package | Not present | Executable implementation source | Missing | The report states that an accompanying notebook bundle and `requirements.txt` were submitted separately; they are not in the GitHub repository or supplied project folder. |
| Result CSV/TeX files | Not present | Archive-level numerical provenance | Missing | Main-slide values are report-supported. CSV-level provenance cannot be verified until the bundle is supplied. |
| Original generated figure exports | Not present on `main` or either inspected Overleaf archive branch | Preferred empirical-plot source | Missing | The final report contains the authoritative plots, but the original exports and source data were not supplied in the presentation repository. |
| Project-local report figure crops | `figures/report_fig_3_3_delta_by_moneyness.pdf`; `figures/report_fig_3_6_training_validation_loss.pdf`; `figures/report_fig_4_3_option_position_by_variance.pdf` | Presentation assets for submitted Figures 3.3, 3.6 and 4.3 | Found | Vector crops from the final submitted report were used only after the repository/branch audit found no matching original exports. Axes, labels, legends and data-bearing content were retained. See `FIGURE_CHANGELOG.md`. |
| Bibliography | `references.bib` | Presentation citations | Reconstructed from submitted bibliography | Contains the references cited by the deck, transcribed from report pp. 66–67. |
| Author contributions | External submitted report, p. 33 | Participation provenance | Found | Exact contribution statement read and used only to allocate technically appropriate material. |
| AI-assistance disclosure | External submitted report, Appendix B, p. 62 | Disclosure source | Found | Used for one backup slide; wording is factual and non-defensive. |
| Method algorithms | External submitted report, Appendices A.3–A.6 | Method traceability | Found | Includes BS/Heston simulation, MSE hedge, parameter conditioning, COS, Greek matching and two-instrument training algorithms. |
| Selected code excerpts | External submitted report, Appendix C | Report-level implementation evidence | Found | Provides `simulate_gbm_paths`, `hedge_error`, `SharedMarkovHedge` and the Heston simulation loop. |
| Overleaf configuration | `main.tex`, `presentation_theme.sty`, `sections/` | Deck build | Created | Standard `pdflatex` workflow; no shell escape or local fonts. |
| Branding assets | `assets/logos/` | Optional identity assets | Missing / not required | No official logo was supplied, so none was downloaded or invented. |

## Repository audit

The GitHub repository named in the specification was cloned for inspection. Its default branch contained only:

```text
main.tex
```

No additional branches, submitted materials, figures, bibliography, code or result files were present in the inspected checkout.

## Presentation evidence policy

- Main numerical values are taken directly from the submitted report and have report page/table references in `traceability.md`.
- Report-supported values whose separate run archives are absent remain labelled as archive provenance unresolved in `traceability.md`.
- Native graphics in the deck are either exact redraws of submitted tabular values or explicitly labelled conceptual schematics. Imported empirical plots are unaltered vector crops from the final report and are recorded in `FIGURE_CHANGELOG.md`.
- No submitted code, report or numerical output was modified or regenerated.
