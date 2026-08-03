# Results-figure changelog

Updated: 3 August 2026.

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
- Tightened Heston timing labels to a total of 9:40; the Figure 4.3 main slide is
  allocated 0:35.

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
