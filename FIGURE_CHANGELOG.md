# Results-figure changelog

Updated: 3 August 2026.

## Black--Scholes opening refinement

### Main slides modified

- Reframed the terminal-error slide around Black--Scholes as the validation
  gate, added the baseline parameter strip and retained the terminal-MSE
  objective and no-delta-label statement.
- Simplified the end-to-end workflow, added the 100k / 30k / 100k
  train-validation-test split, identified one sample as one complete trajectory
  and stated that Black--Scholes uses the exact lognormal grid transition.
- Made validation-based architecture selection prominent: 12 candidates across
  three seeds, selected on mean validation loss and independently retrained for
  the final benchmark.
- Made the discrete-time conditional projection the central benchmark because
  it matches both the trading grid and terminal-MSE objective.
- Preserved every submitted headline RMSE and premium value, added the 0.4\%
  finite-grid gap and the approximately 29-fold RMSE reduction from no hedge,
  and replaced “validation result” with “controlled benchmark outcome.”

### Main slides added

- Added Siphelele's `The benchmark recovery is distributional---not only one
  RMSE number` using submitted report Figure 3.2.
- Added Siphelele's `Why crude Monte Carlo was sufficient at the final path
  budget` using submitted report Figure A.1 and a direct handover to Micaela.
- The revised block contains five Kaiden slides (6:50) and two Siphelele slides
  (3:00), for a total of 9:50 before Micaela begins.

### Assets added and verified

| Source | Project-local destination | Report figure | Verification |
|---|---|---:|---|
| Final report PDF p. 20 (printed p. 16) | `figures/report_fig_3_2_hedge_error_distributions.pdf` | 3.2 | Both the full hedge-error distribution and seller-shortfall zoom are retained. Curve identities, legend order, axes and the wider degree-2 polynomial distribution match the report. |
| Final report PDF p. 22 (printed p. 18) | `figures/report_fig_3_4_moneyness_bucket_errors.pdf` | 3.4 | All four strategies and five terminal-moneyness buckets are retained; box, whisker and differing-scale presentation matches the report. |
| Final report PDF p. 22 (printed p. 18) | `figures/report_fig_3_5_representative_paths.pdf` | 3.5 | OTM, ATM and ITM representative paths, strategy identities, axes and near-overlapping hedge ratios match the report. |
| Final report PDF p. 48 (printed p. 44) | `figures/report_fig_A_1_sampling_path_count.pdf` | A.1 | Overall RMSE, Loss CVaR95 and OTM RMSE panels are all retained. Crude MC, LHS and Sobol+BB series, path budgets, axes and convergence at 50k--100k match the report. |

All four files are tight vector crops. Surrounding report prose and captions
were removed; no data-bearing element was redrawn, recoloured or regenerated.
No matching original export exists on `main` or either inspected Overleaf
archive branch.

### Backups added

- Added Figure 3.4 and Figure 3.5 backup frames.
- Added the exact Black--Scholes transition, tensor shapes and shared-gradient
  accumulation in one implementation-detail backup.
- Added the complete 12-candidate architecture table. Existing backups continue
  to provide Figures 3.3 and 3.6 and the full discrete-time derivation; the main
  Figure A.1 crop retains all three submitted panels.

### Protected sections and unresolved issues

Micaela’s existing main slides were not modified.

The leading Kaiden benchmark frame was moved out of `sections/02_micaela.tex`
into `sections/01b_black_scholes_results.tex`; Micaela's protected section now
begins directly with `The learned hedge has the right financial shape`. The
protected frame source and order are unchanged. The Heston section was not
modified. Original standalone exports for Figures 3.2, 3.4, 3.5 and A.1 remain
unavailable, so the README-approved final-report vector crops were used.

## Source audit

The final submitted report, `MFE_Research_Project_1__Section_B_.pdf`, is the
authoritative source for figure identity, labels, settings and interpretation.
The presentation repository and both remote Overleaf archive branches were
inspected for original exports. None contained Figures 3.3, 3.6 or 4.3, so the
README-approved report-PDF fallback was used. No notebook was rerun and no
submitted report, code, experiment output or image was modified.

| Source | Project-local destination | Report figure | Asset type | Verification |
|---|---|---:|---|---|
| Final report PDF p. 21 (printed p. 17) | `figures/report_fig_3_3_delta_by_moneyness.pdf` | 3.3 | Vector PDF crop | Compared with the full report page: title, moneyness and hedge-ratio axes, Black--Scholes delta, discrete-time MSE-optimal and neural curve identities, legend order and monotone interpretation match. |
| Final report PDF p. 23 (printed p. 19) | `figures/report_fig_3_6_training_validation_loss.pdf` | 3.6 | Vector PDF crop | Compared with the full report page: both panels, training and validation curves, epoch axes, convergence zoom, best-validation marker and epoch-250 label match. |
| Final report PDF p. 33 (printed p. 29) | `figures/report_fig_4_3_option_position_by_variance.pdf` | 4.3 | Vector PDF crop | Compared with the full report page: variance and average-position axes, Heston delta--vega and stock-plus-option NN curve identities, markers, legend order and high-variance separation match. |

Only surrounding report whitespace, captions and body text were cropped. No
data-bearing element was redrawn, recoloured or removed.

## Slide changes

- Removed the main slide `Handover: from the symptom to the exact drift`.
- Added `The learned option position adapts to the variance state` immediately
  after the COS pricing slide. This is a replacement, so the Heston main-slide
  count remains unchanged.
- Kept the existing headline Heston numerical results table and all of its
  values and strategy names unchanged.
- Added `Backup: the learned Black--Scholes hedge matches the analytic curves`
  using submitted report Figure 3.3.
- Added `Backup: training and validation losses converge without visible
  instability` using submitted report Figure 3.6.
- Added a defensive Figure 4.3 backup with the exact representative-run setting
  and a fuller interpretation than the main results slide.
- Tightened Heston timing labels to a total of 8:45: Siphelele 3:00 and Glasson
  5:45; the Figure 4.3 main slide is allocated 0:40.

## Heston main-slide simplification

- Reduced Siphelele's five main slides to the visual argument: the unspanned
  variance risk, the role of the liquid option, the trajectory-level training
  protocol, the frozen-volatility shortcut and its martingale diagnostic.
- Moved the holdings, gain-process, scaled-activation and detailed simulation
  mathematics out of the main narrative; the existing technical backups retain
  those derivations and definitions.
- Reframed the COS slide to separate Heston-consistent option marking from
  position selection. The analytic benchmark uses local COS Greeks, whereas the
  neural positions are learned from terminal hedging error; COS Greeks are not
  training labels.
- Preserved the representative-run results and all displayed values, while
  replacing the seed-by-seed main-slide table with the submitted three-seed
  summary. The complete seed table remains in backup.
- Reworded the conclusion to distinguish recovery of a known finite-grid
  solution from direct training against the finite-grid terminal objective in
  the more complex Heston experiment.
- Speaker-note blocks and speech documents were not modified.

Micaela's main slides were not modified.

## Micaela slide lock

Micaela's existing main-slide source was not modified. Before and after these
changes, `sections/02_micaela.tex` hashes to Git blob
`6200f0d91da6370d59c91a485f6fd29304cb747c`, matching the newest pulled
Overleaf commit `a7ea760`.

The latest Overleaf source contains one text-mode `\leq` token. A local
compatibility wrapper around Micaela's `\input` in `main.tex` lets that existing
token render as the intended mathematical symbol without changing her file,
wording, layout or ordering; the original meaning of `\leq` is restored
immediately after her section.

## Unresolved issue

The original high-resolution experiment exports and executable notebook bundle
remain absent from the submitted presentation repository. The three assets
therefore use the final-report vector crops permitted by the task specification.
The locked Overleaf Micaela source also retains its pre-existing overfull-frame
warnings; resolving those would require changing slides that this task explicitly
protects.
