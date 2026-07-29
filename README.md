# Codex Build Specification: Group 5 MFE Research Presentation

> **Repository:** `https://github.com/G-dubwa/MFE-presentation.git`  
> **Primary output:** A polished, technically rigorous, Overleaf-compatible LaTeX Beamer slide deck for the submitted Group 5 MFE RP 1 research project.  
> **Project:** *Deep Hedging under Black–Scholes and Heston Dynamics*  
> **Assessment:** Friday, 7 August 2026, 15:00–15:55, CS 302  
> **Format:** 30-minute presentation followed immediately by a 25-minute technical oral examination  
> **Slide upload deadline:** Thursday, 6 August 2026 at 21:00 on Amathuba  
> **Group:** Kaiden, Micaela, Siphelele and Glasson. Pull exact full names and ordering from the submitted report; do not invent surnames.

---

## 1. Your role

You are Codex acting as:

- a senior LaTeX/Beamer engineer;
- an academic presentation designer;
- a quantitative-finance technical editor;
- a code-to-method traceability reviewer; and
- a careful repository maintainer.

Your task is to inspect this repository and the supplied project materials, then construct a complete LaTeX slide deck that presents and defends the **already submitted** research.

This is not a new research phase. The report, code submission, methodology, experiments, results, limitations and disclosures have already been submitted. The deck must explain them accurately and coherently. It must not rewrite the research retrospectively or introduce unsubmitted results as though they formed part of the submission.

Work autonomously wherever the evidence is sufficient. Do not wait for approval on minor design decisions. Record genuine source gaps or ambiguities instead of inventing answers.

---

## 2. Non-negotiable constraints

### 2.1 The submitted work is fixed

Do **not**:

- alter the submitted research report;
- alter the submitted research code or archived outputs;
- replace submitted numerical results with newly generated values;
- run new experiments and present them as part of the submitted research;
- “correct” the methodology in the deck;
- silently repair a discrepancy by choosing whichever value appears preferable;
- add claims that are not supported by the submitted report and code;
- describe a heuristic as optimal unless the report proves that it is optimal;
- conceal stated limitations; or
- invent individual contributions or AI-usage details.

You may inspect, compile, trace, reproduce or calculate values for **understanding and validation**, but the presentation must remain a faithful explanation of the submitted work. Any optional validation performed after submission must not be presented as though it were part of the submitted evidence.

### 2.2 Source-of-truth hierarchy

Use the following priority order:

1. The final submitted report.
2. The submitted code package and archived result files.
3. The report’s appendices, README files, result maps, provenance notes and author-contribution statement.
4. The preparation plan and storyboard in this repository.
5. This README’s numerical anchors and suggested structure.

If this README conflicts with the submitted report or code, the submitted materials prevail. Record the conflict in `traceability.md` or `OPEN_QUESTIONS.md`; do not silently guess.

### 2.3 The deck must demonstrate technical ownership

A central assessment objective is to show that the group:

- understands the financial mathematics;
- understands the neural architecture and loss;
- understands the simulation and numerical methods;
- understands what the code is doing;
- can connect equations to implementation;
- diagnosed failures rather than blindly accepting outputs;
- validated important numerical routines independently; and
- used any AI assistance in a governed, checked and non-reckless manner.

Do not place defensive claims such as “we wrote the code ourselves” on the main slides. Demonstrate ownership through precise explanations, traceability, diagnostics, design decisions and readable backup material.

### 2.4 Equality of participation

All four members must contribute approximately equally in:

- speaking time;
- technical content;
- intellectual responsibility; and
- oral-examination exposure.

The target allocation is approximately 6:45–7:00 per member, with the full planned presentation lasting about 27:30 and retaining approximately 2:30 of buffer.

---

## 3. Creative freedom

The proposed narrative and slide allocation below are a strong starting architecture, not an immutable template.

You may:

- merge slides;
- split slides;
- move material between speakers;
- replace a proposed visual with a better one;
- reduce the number of slides;
- redesign transitions;
- move technical details to backup; or
- revise the layout and visual hierarchy.

Only make structural changes that improve at least one of:

- narrative coherence;
- technical defensibility;
- readability;
- equality of contribution;
- timing;
- consistency with the submitted materials; or
- oral-examination preparation.

Do not be creative with facts, numbers, contributions or methodology.

---

## 4. First action: inspect the repository

Before editing or creating the deck, inspect the complete repository.

### 4.1 Build a source inventory

Locate and identify, where available:

- the final submitted report;
- the submitted code package;
- notebooks or scripts;
- archived run folders;
- CSV result files;
- generated figures;
- bibliography files;
- existing LaTeX or Beamer files;
- logos or branding assets;
- the author-contribution statement;
- the AI-assistance disclosure;
- result-file maps;
- provenance notes;
- any existing presentation draft; and
- any existing Overleaf configuration.

Create or update `SOURCE_INVENTORY.md` containing:

| Item | Repository path | Role | Status | Notes |
|---|---|---|---|---|
| Submitted report | ... | Primary narrative source | Found/Missing | ... |
| Submitted code | ... | Implementation source | Found/Missing | ... |
| Result files | ... | Numerical source | Found/Missing | ... |
| Figures | ... | Visual source | Found/Missing | ... |
| Bibliography | ... | Citation source | Found/Missing | ... |

### 4.2 Do not assume the current repository structure

The repository may be empty, partially configured, private, recently created or organised differently from this specification. Inspect first.

If critical source materials are absent:

1. create a clean, compilable deck scaffold;
2. create `OPEN_QUESTIONS.md` listing the missing files and exact information required;
3. use explicit, non-fabricated placeholders only where necessary;
4. do not invent numerical content; and
5. continue with all work that can be completed safely.

### 4.3 Preserve existing work

- Do not delete source materials.
- Do not overwrite an existing deck without first understanding it.
- Prefer modular edits.
- Preserve useful existing theme, bibliography and asset files where they meet the quality requirements.
- Do not rewrite Git history.

---

## 5. Required repository deliverables

The exact modularisation may change if the repository already has a sound structure, but the final repository should contain equivalent deliverables.

```text
MFE-presentation/
├── README.md                         # This operating specification
├── main.tex                          # Main Beamer entry point
├── presentation_theme.sty            # Minimal custom theme and macros
├── references.bib                    # Reuse submitted bibliography where possible
├── sections/
│   ├── 00_title.tex
│   ├── 01_kaiden.tex
│   ├── 02_micaela.tex
│   ├── 03_siphelele.tex
│   ├── 04_glasson.tex
│   └── 05_backup.tex
├── assets/
│   ├── figures/                      # Source figures copied or linked from submission
│   ├── generated/                    # Presentation-specific redraws
│   ├── code/                         # Curated code excerpts, if externalised
│   └── logos/                        # Only supplied/authorised logos
├── speaker_notes.md                  # Slide-by-slide notes, timings and transitions
├── traceability.md                   # Every claim/number mapped to source evidence
├── SOURCE_INVENTORY.md
├── OPEN_QUESTIONS.md                 # Only unresolved source issues
├── BUILD.md                          # Local and Overleaf build instructions
├── Makefile                          # Optional but preferred
└── build/
    └── Group5_Deep_Hedging_Presentation.pdf
```

Do not create needless complexity. A smaller structure is acceptable if it remains readable, maintainable and traceable.

---

## 6. LaTeX and Overleaf requirements

### 6.1 Engine and compatibility

Prefer a standard Overleaf-compatible `pdflatex` workflow unless the existing repository has a justified alternative.

Recommended document class:

```latex
\documentclass[aspectratio=169,10pt]{beamer}
```

Requirements:

- 16:9 aspect ratio;
- no shell escape;
- no dependency on local system fonts;
- no proprietary font files;
- no `minted` dependency unless shell escape is already safely configured;
- use `listings` for code excerpts;
- compile cleanly on Overleaf;
- avoid fragile custom packages with poor Overleaf support;
- avoid unnecessary animations and overlay complexity;
- use vector graphics where practical;
- make all labels and equations readable from the back of a lecture room.

### 6.2 Suggested packages

Use only packages that serve a clear purpose. A robust set may include:

```latex
\usepackage{amsmath,amssymb,mathtools}
\usepackage{booktabs}
\usepackage{siunitx}
\usepackage{graphicx}
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{adjustbox}
\usepackage{listings}
\usepackage{xcolor}
\usepackage{appendixnumberbeamer}
\usepackage{ragged2e}
\usepackage{microtype}
```

Set:

```latex
\pgfplotsset{compat=1.18}
```

Do not add packages merely because they are common in templates.

### 6.3 Build command

Provide and test a build process equivalent to:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
```

The final build must have:

- no compilation errors;
- no missing figures;
- no unresolved citations or references;
- no visible placeholder text;
- no clipped equations;
- no materially overfull boxes;
- no page-number corruption between main and backup slides; and
- no broken transparency or rasterisation issues.

### 6.4 Main-slide and backup numbering

The audience-facing main deck should have stable slide numbers. Backup slides must not make the main slide count appear larger during the presentation. Use `appendixnumberbeamer` or an equivalent clean solution.

---

## 7. Visual design system

### 7.1 General direction

Use a restrained, modern academic style suitable for a technically demanding quantitative-finance presentation.

Desired qualities:

- high contrast;
- generous whitespace;
- clear hierarchy;
- minimal ornament;
- consistent notation;
- professional rather than flashy;
- visually coherent across four speakers;
- equations treated as visual arguments, not wallpaper;
- figures and tables readable immediately.

A restrained palette may use dark navy, charcoal, white and one muted accent. If official UCT/AIFMRM colours or logos exist in the supplied repository, use them sparingly and accurately. If they are absent, do not download or invent branding assets solely for decoration.

### 7.2 Typography

- Use one clean sans-serif family for body text and titles.
- Use a compatible, legible math font.
- Avoid condensed fonts.
- Keep body text visually equivalent to at least approximately 18 pt on a 16:9 slide.
- Use larger text for equations that must be discussed.
- Use monospace only for code and filenames.
- Do not reduce font size to force content onto a slide; edit the content instead.

### 7.3 Slide titles

Use claim-style titles whenever possible.

Prefer:

- “The neural hedge recovers the finite-grid benchmark”
- “The single-scenario model fails for an information reason”
- “The frozen-volatility proxy solves the wrong pricing equation”

Avoid:

- “Results”
- “Methodology”
- “Heston”
- “Discussion”

### 7.4 Density

Main-slide standard:

- one principal claim;
- one principal visual or equation;
- no more than about five short text lines unless the slide is intentionally a table;
- no full paragraphs;
- no copied report pages;
- no unreadable multi-panel montages;
- no code on main slides unless a very short excerpt is essential.

### 7.5 Tables

- Never paste a full report table onto a main slide.
- Extract only the rows and columns required for the claim.
- Use `booktabs`.
- Align numbers by decimal point where practical.
- Highlight only the comparison being discussed.
- Label whether a result is representative, single-seed or multi-seed.
- Use four significant figures for most values and one decimal place for percentages, unless precision is itself the point.

### 7.6 Figures

- Prefer supplied vector/PDF figures if they are readable.
- Redraw figures when the report version has small labels, excessive legend detail or a scale that hides the comparison.
- Do not change the underlying data.
- Preserve axis definitions and units.
- Increase axis, tick and legend sizes for presentation use.
- Every figure must have a conclusion-oriented title or annotation.
- Do not use decorative stock photography.

### 7.7 Equations

- At most one principal displayed equation per main slide.
- Define symbols verbally or through minimal callouts.
- Keep full derivations in backup slides.
- Use consistent symbols throughout: verify the report’s conventions for `\delta`, `\eta`, `v_t` or `\nu_t`, `\tau`, `\pi`, hedging error and loss.
- Create macros for repeated notation to prevent drift.

### 7.8 Code excerpts

Use code only in backup slides and only where it helps demonstrate implementation understanding.

Rules:

- 8–15 lines per excerpt;
- no notebook screenshots;
- at least roughly 18 pt equivalent monospace size;
- no more than three callouts;
- include source file and function name in the footer;
- remove irrelevant setup lines without changing semantics;
- use ellipses clearly where code is omitted;
- do not show generated boilerplate;
- ensure the speaker can explain the excerpt without reading it line by line.

---

## 8. Presentation narrative and timing

### 8.1 Target

- Planned speech: approximately 27:30.
- Hard maximum: 30:00.
- Buffer: approximately 2:30.
- Main slides: approximately 18, excluding title/closing variants and backup slides.
- Each speaker: approximately 6:45–7:00.

### 8.2 Narrative arc

The deck should tell one research story:

1. Validate the neural-hedging framework in a setting with a known benchmark.
2. Show that the network learns a financially meaningful hedge rather than only a low loss.
3. Diagnose why the original model fails outside its training scenario.
4. Introduce parameter conditioning and distributional training.
5. Move to Heston, where variance is stochastic and stock-only hedging is incomplete.
6. Add a liquid option as a variance-sensitive traded instrument.
7. Show that the initial frozen-volatility proxy is dynamically inconsistent.
8. Diagnose the missing Heston drift terms.
9. Replace the proxy with model-consistent COS pricing and validate it independently.
10. Present the final stock-plus-option neural results against the strongest tested heuristic.
11. State the result’s meaning and limitations without overclaiming.

Black–Scholes is a controlled validation environment, not a claim that the neural model beats the correct analytic solution.

---

## 9. Provisional slide architecture

Treat this as the default architecture. Refine it only after inspecting the actual report, figures, code and existing deck.

## Act I — Question, framework and validation

### Slide 1 — Title and research question

**Speaker:** Kaiden  
**Target time:** 0:30

Purpose:

- introduce Group 5;
- state the question in one sentence; and
- avoid a long generic motivation that all groups likely share.

Suggested research-question framing:

> Can a neural network trained from simulated terminal hedging error recover the known discrete-time hedge, and what does the framework offer once volatility and the traded instrument set become more complex?

Pull the exact title, supervisor and member names from the submitted report.

### Slide 2 — Discrete self-financing hedging problem

**Speaker:** Kaiden  
**Target time:** 1:30

Show the submitted wealth/terminal portfolio equation and the terminal MSE objective. Use the report’s exact discounted or undiscounted notation.

Explain:

- the premium;
- stock holdings;
- discrete rebalancing;
- self-financing gains;
- terminal payoff;
- hedging error; and
- why MSE is the main training criterion in the submitted experiment.

Use one equation and one small path schematic with rebalancing markers.

### Slide 3 — End-to-end implementation pipeline

**Speaker:** Kaiden  
**Target time:** 2:00

This is the main technical-ownership slide.

Construct a clean diagram:

```text
parameters
→ simulated paths
→ state features
→ shared Markov network
→ hedge positions
→ self-financing gains
→ terminal hedging error
→ MSE
→ backpropagation
```

Annotate with actual function/class names and tensor dimensions from the submitted code, for example only if verified:

- paths: `(B, N+1)`;
- Black–Scholes features: `(B, N, 2)`;
- flattened network input: `(B·N, 2)`;
- hedge ratios: `(B, N)`;
- pathwise terminal error: `(B,)`.

Do not guess names or shapes. Trace them directly.

Key message:

- the analytic delta is not a training target;
- the network is trained through terminal portfolio error;
- the relevant computation is differentiable end to end; and
- training, validation and test sets are distinct, subject to the submitted fair-premium caveat.

### Slide 4 — Architecture selection and design decisions

**Speaker:** Kaiden  
**Target time:** 1:30

Summarise only the decisions necessary to justify the final architecture:

- shared versus time-separated networks;
- normalised versus raw inputs;
- depth and width;
- hidden activation;
- output transformation;
- number of seeds;
- architecture-selection batch/training protocol versus final retraining protocol.

Use a small comparison, not the full architecture table.

Key phrasing:

- “selected, not uniquely dominant” if supported by the submitted provenance notes;
- explain why sigmoid is appropriate for the Black–Scholes call hedge;
- explain why a shared Markov network is efficient and financially natural.

### Slide 5 — Benchmark design

**Speaker:** Kaiden  
**Target time:** 1:20

Show the benchmark hierarchy:

- no hedge;
- Black–Scholes delta;
- discrete-time MSE-optimal hedge;
- low-capacity polynomial hedge; and
- neural hedge.

Central message:

> The fair Black–Scholes comparison is the strategy evaluated on the same discrete grid and objective, not merely continuous-time delta sampled at the grid dates.

Keep the full covariance-ratio or closed-form derivation in backup.

Handover to Micaela:

> “With the training problem and fair benchmark established, Micaela will show whether the network actually recovered the known structure.”

---

## Act II — Black–Scholes evidence and generalisation

### Slide 6 — The neural hedge recovers the finite-grid benchmark

**Speaker:** Micaela  
**Target time:** 1:30

Verify all values against the submitted report and CSVs. Expected anchors from the audited preparation plan include approximately:

| Strategy | RMSE |
|---|---:|
| No hedge | 0.227257 |
| Black–Scholes delta | 0.007810 |
| Discrete-time MSE-optimal | 0.007810 |
| Degree-2 polynomial | 0.022183 |
| Neural hedge | 0.007841 |

Potential premium anchors, if confirmed:

- analytic/fair premium: approximately 0.164111;
- learned premium: approximately 0.163972.

Do not claim outperformance. Claim recovery of the known hedge to near benchmark accuracy.

### Slide 7 — The learned hedge is financially meaningful

**Speaker:** Micaela  
**Target time:** 1:10

Use the submitted hedge-ratio-versus-moneyness figure or redraw it legibly.

Explain:

- low hedge ratio deep out of the money;
- smooth transition around the strike;
- hedge ratio approaching one deep in the money;
- close tracking of the analytic/discrete-time benchmark.

Central message:

> The model learned the expected hedge function, not merely an aggregate loss statistic.

### Slide 8 — The architecture remains effective when retrained

**Speaker:** Micaela  
**Target time:** 1:20

Show a compact robustness summary across submitted variations in quantities such as:

- strike;
- volatility;
- maturity; and
- rebalancing frequency.

Be precise:

- this is architecture reuse under retraining;
- it is not zero-shot generalisation by the original single-scenario model.

Explain any increase in neural-to-benchmark RMSE ratio carefully: the analytic benchmark may improve faster even while the neural model’s absolute error falls.

### Slide 9 — The single-scenario model fails for an information reason

**Speaker:** Micaela  
**Target time:** 1:20

Use a small subset of the submitted off-distribution results.

Explain the mechanism:

- strike is embedded or effectively fixed in the original representation;
- volatility is absent from the inputs;
- the training distribution contains no variation in those parameters.

Central message:

> More data from the same scenario cannot teach a policy how to depend on a variable it never observes and never sees vary.

### Slide 10 — Parameter conditioning restores cross-contract usefulness

**Speaker:** Micaela  
**Target time:** 1:30

Show the verified state representation, for example if confirmed:

\[
\delta_n = f_\theta\!\left(\log(S_n/K),\,\tau_n/T,\,K,\,\sigma\right).
\]

Explain:

- strike and volatility become explicit inputs;
- the training distribution varies those parameters;
- the premium treatment differs because contracts now vary pathwise;
- interpolation is strong;
- extrapolation, especially in volatility, is harder; and
- one conditioned training run covers many contracts.

Do not hide poor extrapolation cases. Distinguish absolute from relative error.

Handover to Siphelele:

> “Black–Scholes still has constant volatility and one diffusion risk. Siphelele will now move to the Heston setting, where variance becomes a second state and risk source.”

---

## Act III — Heston, incompleteness and the empirical discovery

### Slide 11 — Heston introduces a second source of risk

**Speaker:** Siphelele  
**Target time:** 1:40

Show the submitted Heston SDEs using the report’s notation and parameterisation.

Explain briefly:

- instantaneous variance;
- mean reversion;
- long-run variance;
- volatility of volatility;
- spot–variance correlation; and
- the Feller condition, if it is explicitly used in the submitted discussion.

Then make the completeness argument:

- two Brownian risk sources;
- only one risky traded asset with stock and cash;
- stock-only trading cannot span both spot and variance risk;
- add a longer-dated liquid option with variance sensitivity.

Keep a full FTAP/ELMM derivation in backup.

### Slide 12 — The stock-plus-option hedging problem

**Speaker:** Siphelele  
**Target time:** 1:30

Show:

\[
G_T
=
\sum_n \delta_n\,\Delta S_n
+
\sum_n \eta_n\,\Delta C^h_n.
\]

Explain:

- stock position `\delta_n`;
- liquid-option position `\eta_n`;
- the option remains alive during the target option’s hedge horizon;
- the verified Heston state vector;
- why the network needs two outputs;
- why tanh-style signed bounds are used instead of a Black–Scholes sigmoid; and
- the submitted Heston simulation scheme.

Include a small correlated-shock schematic or feature/position diagram rather than another dense equation.

### Slide 13 — The initial frozen-volatility proxy looked plausible

**Speaker:** Siphelele  
**Target time:** 1:30

Show the submitted preliminary approximation:

\[
C_t^h \approx C_{\mathrm{BS}}\!\left(S_t,K_h,T_h-t,\sqrt{v_t}\right).
\]

Explain why it initially seemed reasonable:

- current Heston variance is inserted as instantaneous Black–Scholes volatility;
- it is cheap to evaluate;
- it creates a variance-sensitive hedge instrument; and
- preliminary results suggested that the option leg could help.

Do not make an unarchived preliminary value central to the slide. If the exact preliminary NN result is not traceable in the submission archive, describe it qualitatively and keep any reported value only if the submitted report itself clearly contains it.

### Slide 14 — A martingale diagnostic exposes the problem

**Speaker:** Siphelele  
**Target time:** 1:10

Under the submitted risk-neutral setting with `r=0`, the discounted traded-option process should have approximately zero average price movement, subject to simulation error.

Show the verified diagnostic, expected anchors:

- proxy mean total movement: approximately `-0.009482`, standard error approximately `0.000459`;
- COS-priced process mean total movement: approximately `-0.000118`, standard error approximately `0.000479`.

Central message:

> The proxy is not merely approximate in level; its path dynamics are inconsistent with the Heston model used to simulate the market.

Avoid making a stronger formal arbitrage claim than the submitted work supports.

Handover to Glasson:

> “The diagnostic shows that the proxy is dynamically inconsistent. Glasson will explain the missing drift terms, the model-consistent correction and what the final experiment establishes.”

---

## Act IV — Structural diagnosis, correction and final evidence

### Slide 15 — The frozen-volatility proxy solves the wrong pricing equation

**Speaker:** Glasson  
**Target time:** 1:40

Show the submitted Itô residual:

\[
\operatorname{drift}(g)
=
\kappa(\theta-v)g_v
+
\frac12\xi^2v g_{vv}
+
\rho\xi vS g_{Sv}.
\]

Use simple labels:

- mean reversion × variance sensitivity;
- volatility-of-volatility convexity;
- spot–variance interaction.

Use mathematically safe wording:

> These Heston terms are absent from the frozen-volatility Black–Scholes PDE, so the proxy generally has nonzero drift. Under the submitted parameterisation and simulated state distribution, the average contribution was negative, consistent with the measured diagnostic.

Do not claim that `\xi` and `\rho` alone determine the sign.

Keep the full Itô cancellation in backup.

### Slide 16 — COS pricing makes the hedge instrument model-consistent

**Speaker:** Glasson  
**Target time:** 1:30

Explain at presentation depth:

- COS pricing uses the Heston characteristic function;
- it prices the liquid option under the same model generating `S_t` and `v_t`;
- the option is repriced along the simulated path;
- the implementation was independently checked.

Show the submitted validation evidence, if confirmed:

- maximum COS–Carr–Madan discrepancy around `5.1×10^{-8}`;
- finite-difference delta error around `9.77×10^{-5}`;
- finite-difference variance-sensitivity error around `4.65×10^{-4}`.

Use one small validation panel rather than several screenshots.

### Slide 17 — The stock-plus-option network beats the strongest tested heuristic

**Speaker:** Glasson  
**Target time:** 2:00

Use a compact representative table. Expected submitted anchors include:

| Strategy | Representative RMSE |
|---|---:|
| No hedge | about 0.190 |
| BS-proxy stock delta | 0.019997 |
| Heston COS delta–vega | 0.014782 |
| Stock-only NN | about 0.017–0.018 |
| Strongest tested heuristic | 0.009874 |
| Stock-plus-option NN | 0.007426 |

Add a compact multi-seed strip or three paired markers:

- mean RMSE improvement over the strongest tested heuristic: `22.7%`;
- mean Loss CVaR95 improvement: `27.1%`;
- improvement in all three submitted seeds.

Required language:

- “strongest analytic heuristic tested”;
- never “optimal analytic hedge”;
- distinguish representative results from multi-seed means.

Explain the counterintuitive benchmark ordering briefly:

- local delta–vega matching is not the globally optimal finite-grid terminal-MSE hedge;
- rebalancing and turnover differ;
- model-consistent Greeks do not guarantee the smallest terminal MSE under discrete trading;
- the harder comparator is reported deliberately.

Keep detailed turnover and clip-sensitivity evidence in backup.

### Slide 18 — Interpretation, limitations and conclusion

**Speaker:** Glasson  
**Target time:** 1:50

Use one interpretable learned-position figure if readable, such as the liquid-option position against the variance state.

Interpretation:

- the network uses the option as a variance-sensitive instrument;
- its positions broadly reflect analytic variance-hedging direction;
- it may soften the local Greek hedge at high variance because it optimises terminal MSE rather than matching Greeks pointwise.

State only the most material limitations on the main slide, for example:

- only three Heston seeds, framed as a consistency check;
- fair premiums centred on the submitted test paths;
- analytic comparators are local heuristics rather than a derived finite-grid multi-instrument MSE optimum;
- simulated Heston environment and frictionless two-instrument trading;
- numerical discretisation/pricing limitations.

The final conclusion should make three calibrated claims:

1. The neural framework recovered the known Black–Scholes hedge.
2. Parameter conditioning addressed the identified cross-contract information failure.
3. In the submitted Heston experiment, the stock-plus-option network reduced terminal risk relative to the strongest tested analytic heuristic once the hedge option was priced consistently.

Suggested final wording, to be checked against the report:

> “Our conclusion is not that neural networks should replace correct analytic hedges where those hedges are available. Rather, a constrained and rigorously benchmarked neural policy can recover the known solution and then adapt when volatility, the information set and the traded instrument set become more complex.”

Do not overload this final slide. Move observable-information/EWMA robustness to backup unless the final timing easily accommodates a one-sentence mention.

---

## 10. Backup-slide requirements

Create a clearly separated backup section. At minimum, include the most useful of the following, grounded in the submitted materials.

### Backup 1 — Method-to-code map

A table mapping:

- mathematical concept;
- implementation function/class;
- notebook or script;
- result file; and
- primary group expert.

### Backup 2 — Tensor-shape walkthrough

Show the verified shapes for:

- Black–Scholes paths;
- Black–Scholes features;
- network input/output;
- Heston stock/variance/option paths;
- Heston feature tensor;
- two-position output; and
- pathwise gain/error vectors.

### Backup 3 — Discrete-time MSE-optimal hedge derivation

Include:

- orthogonality condition;
- covariance-ratio intuition;
- submitted closed form where relevant;
- relationship to continuous-time Black–Scholes delta.

### Backup 4 — Full frozen-volatility drift derivation

Show the Itô expansion and the cancellation of the Black–Scholes PDE terms, leaving the three Heston residual terms.

### Backup 5 — COS method

At appropriate depth:

- characteristic function;
- cosine expansion intuition;
- truncation interval and number of terms used in the submitted implementation;
- why Carr–Madan is an independent check.

### Backup 6 — Heston simulation code

Use a curated excerpt showing:

- correlated shocks;
- stock update;
- variance update;
- full truncation or other submitted safeguard.

### Backup 7 — Stock-plus-option gain and feature construction

Use a curated excerpt showing:

- causal state construction;
- two network outputs;
- gain accumulation;
- terminal hedging error.

### Backup 8 — Training, validation and test separation

Use a curated excerpt or diagram showing:

- independent data generation;
- validation-based model selection or early stopping;
- final test evaluation;
- fair-premium centering caveat.

### Backup 9 — Multi-seed evidence

Include the submitted per-seed values and pairwise improvements.

### Backup 10 — Turnover and position-bound diagnostics

Include only if the submitted outputs support the explanation of the benchmark ordering.

### Backup 11 — Transaction-cost extension

Summarise the submitted transaction-cost experiment, including the no-trade-band result only if it is present in the code outputs and the wording remains consistent with the submitted report.

Do not elevate this to a main result if it was not central in the submitted report.

### Backup 12 — Data-generation methods

Summarise crude Monte Carlo, LHS and Sobol/Brownian-bridge comparisons only if needed for questions.

### Backup 13 — Experimental protocol

Include a concise version of the submitted training/validation/test protocol and configuration table.

### Backup 14 — Responsible AI assistance and verification

Base this strictly on the submitted AI disclosure and README.

Possible structure:

| Assistance area | Human verification |
|---|---|
| Drafting/debugging | Code inspection and executed tests |
| Mathematical explanation | Checked against derivations and cited literature |
| Pricing implementation | COS cross-checked against Carr–Madan |
| Greeks | Finite-difference checks |
| Neural results | Known Black–Scholes benchmarks and archived CSVs |
| Packaging/documentation | Result-file traceability and unedited numerical outputs |

Do not invent per-member rejection examples or unsupported details.

### Backup 15 — Architecture selection by seed

Include the submitted per-seed ranking or compact comparison showing why the selected architecture was reasonable but not uniquely dominant.

---

## 11. Speaker notes

Create `speaker_notes.md` and, where practical, embed matching `\note{}` blocks in the Beamer source.

For every main slide, include:

- speaker;
- target time;
- central claim;
- opening sentence;
- 3–5 speaking points;
- exact values that must be stated;
- what not to overclaim;
- transition to the next slide or speaker;
- likely examiner question;
- concise answer outline;
- relevant report section;
- relevant code/result path.

The notes should help speakers explain the work naturally. Do not write a dense script that encourages reading from the slide.

---

## 12. Traceability requirements

Create `traceability.md` with at least:

| Slide | Claim or value | Report location | Code/result location | Status | Notes |
|---:|---|---|---|---|---|

Every numerical value appearing on a main slide must be traceable.

Every displayed equation must be traceable to:

- the submitted report; or
- a direct, faithful reformulation of the submitted implementation.

Every code excerpt must identify:

- file/notebook;
- function/class;
- purpose;
- relevant mathematical expression; and
- primary speaker.

If a value appears in the report but its archived run is not clearly present, mark:

- report-supported;
- archive provenance unresolved; and
- presentation treatment.

Do not change the value or imply that its archive was found when it was not.

---

## 13. Known presentation-risk treatments

The following are defence risks, not invitations to alter the submitted project.

### 13.1 Preliminary proxy-trained NN value

An audited preparation plan identified a preliminary proxy-priced stock-plus-option NN result of approximately `0.008198` whose exact archived run may not be obvious.

Treatment:

- check the submitted report and archive;
- do not make the exact value central to the main presentation unless traceable;
- describe the preliminary proxy stage qualitatively if needed;
- never claim the run is archived unless it is found;
- preserve the submitted report’s wording if questioned.

### 13.2 Fair premium estimated on test paths

Treatment:

- do not recompute or replace submitted metrics;
- state the caveat accurately;
- explain that the centering is applied strategy by strategy and affects location, while comparisons focus on submitted terminal-risk distributions;
- avoid claiming a fully out-of-sample pricing result.

### 13.3 Only three Heston seeds

Treatment:

- call it a multi-seed consistency check, not definitive statistical inference;
- state that all three submitted pairwise comparisons favoured the network;
- do not fabricate confidence intervals;
- retain the report’s limitation language.

### 13.4 Counterintuitive benchmark ordering

Treatment:

- distinguish model-consistent pricing from global terminal-MSE optimality;
- distinguish local Greek matching from discrete-time dynamic optimisation;
- use submitted turnover and clip-sensitivity evidence only where verified;
- state that the stronger heuristic was used deliberately as the headline comparator.

### 13.5 TensorFlow and PyTorch both appear

Treatment:

- do not refactor the submitted code;
- show that the frameworks implement comparable mathematical objectives in different experiment stages;
- ensure the relevant speaker can explain which framework is used where and why the split does not itself change the financial question.

### 13.6 Observable-information robustness

The liquid-option quote may contain contemporaneous information about latent variance.

Treatment:

- call it an observable-market-information experiment;
- do not call it pure stock-return-only volatility inference;
- do not describe contemporaneous option quotes as future-information leakage;
- retain the report’s qualification.

---

## 14. AI-assistance wording

Do not make AI assistance a main-slide theme unless required by the submitted assessment format. Prepare a backup slide and speaker note.

Use factual, non-defensive language based on the submitted disclosure.

A safe answer template, only after checking it against the submitted Appendix B, is:

> “AI assistance was disclosed in the submission and was used for activities such as drafting, debugging, explanation and documentation. Material outputs were not treated as authoritative. The implementation and results were checked against theory, executed notebooks, archived result files and independent numerical diagnostics. For example, option pricing was cross-checked against an independent Fourier method, Greeks against finite differences, Black–Scholes results against known benchmarks, and the traded-option process against a martingale diagnostic. We can explain every material function and numerical routine supporting the reported experiments.”

Do not claim the group can explain literally every utility or packaging function in the repository.

---

## 15. Bibliography and citations

- Reuse the submitted bibliography.
- Do not conduct a new literature review unless a citation is required to represent a method already used in the report.
- Relevant references may include, only if present in the submitted work: Heston, deep hedging, COS pricing, Carr–Madan, full-truncation Euler and discrete-time quadratic hedging.
- Use small, unobtrusive citations on relevant slides.
- Include a complete reference backup slide.
- Do not place raw URLs on main slides.

---

## 16. Implementation workflow

### Phase 1 — Audit

1. Inspect the repository.
2. Build `SOURCE_INVENTORY.md`.
3. Locate the report, code, figures and bibliography.
4. Identify the current build system.
5. Read the report’s abstract, methodology, results, limitations, author contributions and AI disclosure.
6. Trace headline values to result files.
7. Populate the first version of `traceability.md`.

### Phase 2 — Scaffold

1. Create or repair `main.tex`.
2. Establish the 16:9 theme.
3. Add macros for notation and recurring layouts.
4. Create modular section files.
5. Add title, section divider and backup-divider layouts.
6. Compile immediately before adding detailed content.

### Phase 3 — Main-slide construction

1. Implement the full 18-slide narrative.
2. Use placeholders only temporarily.
3. Insert submitted figures or presentation redraws.
4. Add timing and speaker metadata as source comments.
5. Add speaker notes.
6. Add traceability entries as each slide is completed.

### Phase 4 — Backup construction

1. Build derivation slides.
2. Build code slides.
3. Build protocol and per-seed slides.
4. Build AI-use and references slides.
5. Confirm that backup material answers likely technical questions.

### Phase 5 — Quality assurance

Run a slide-by-slide audit:

- Is the title a claim?
- Is the claim supported by the submitted work?
- Is every number traceable?
- Is the slide readable at lecture-room distance?
- Is the speaking time plausible?
- Is the slide necessary?
- Does it duplicate another slide?
- Does it overstate the evidence?
- Does it create an obvious examiner question without a prepared answer?
- Is any wording inconsistent with the report?

### Phase 6 — Build and handoff

1. Compile with `latexmk`.
2. Inspect the complete PDF visually.
3. Fix overfull boxes, tiny labels and inconsistent spacing.
4. Check slide numbers and backup numbering.
5. Check the deck on a second PDF viewer where possible.
6. Produce `BUILD.md`.
7. Ensure the output filename is clear and stable.
8. Summarise completed work and remaining source questions in the final commit or Codex response.

---

## 17. Acceptance criteria

The task is complete only when all applicable conditions hold.

### Content

- The deck faithfully presents the submitted research.
- No unsubmitted result is presented as submitted evidence.
- Main claims match the submitted report.
- Major limitations are visible and accurately worded.
- Black–Scholes is framed as validation, not neural outperformance.
- Heston benchmarks are described accurately.
- The final conclusion is calibrated.

### Structure

- Planned main-deck speaking time is approximately 27–28 minutes.
- All four members have approximately equal time.
- All four members have technically substantive material.
- Speaker transitions are written and natural.
- The conclusion is not rushed.

### Technical ownership

- The pipeline slide contains verified function names and tensor shapes.
- The method-to-code map is complete enough for oral defence.
- Important code excerpts are readable.
- Full derivations are available in backup.
- Pricing and Greek validation are shown accurately.
- The proxy failure is explained as a diagnosis-and-correction story.

### Visual quality

- The deck uses 16:9 Beamer.
- Main text is readable from the back of a room.
- No main slide is a pasted report page.
- Tables are compact and purposeful.
- Figures are legible.
- Notation is consistent.
- No slide is overloaded merely to preserve a predetermined slide count.

### Reproducibility

- The deck compiles locally with the documented command.
- It compiles on Overleaf.
- All required assets are version controlled.
- No absolute local file paths are used.
- No external downloads are required during compilation.
- The final PDF is present or readily generated.

### Traceability

- Every main numerical claim has a source entry.
- Every main equation has a source entry.
- Every code excerpt identifies its source.
- Unresolved provenance questions are documented honestly.

---

## 18. Final Codex response format

After completing the work, report:

1. the repository structure created or modified;
2. the main narrative and final slide count;
3. the speaker allocation and planned timing;
4. the LaTeX build command;
5. the output PDF path;
6. the major source files used;
7. any unresolved source/provenance questions;
8. any slides that still require group-supplied assets or decisions; and
9. confirmation that no submitted report, code or result files were altered.

Do not merely state that the deck is “done.” Provide a concise technical handoff that allows the group to continue editing safely in Overleaf.

---

## 19. Working principle

The deck should make the following visible without boasting:

> The group understands what it attempted, how it implemented the experiment, how the numerical pipeline works, how it checked its outputs, what failed during development, why it failed, how the submitted analysis addressed the failure, what the results establish and where the conclusions stop.

That is the standard against which every slide should be judged.
