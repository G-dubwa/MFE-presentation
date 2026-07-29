# Open questions and missing-source requests

The deck is complete and compilable from the submitted report, but the following materials are still required for archive-level traceability and for replacing report-grounded schematics with original empirical figures where desired.

## 1. Submitted notebook/code bundle

Please add the exact package submitted with the report, including:

- TensorFlow/Keras Black–Scholes benchmark and architecture-selection notebooks or scripts;
- parameter-robustness and parameter-conditioned hedger notebooks;
- PyTorch Heston stock-only and stock-plus-option notebooks;
- COS pricing and Carr–Madan validation implementation;
- transaction-cost notebook;
- `requirements.txt`; and
- any repository README or result-file map included in the code submission.

This is needed to verify exact notebook filenames, function names beyond Appendix C, package versions, full tensor shapes and method-to-code ownership.

## 2. Archived result files

Please add the submitted CSV/TeX result tables and run folders for:

- final Black–Scholes benchmark (Table 3.2);
- architecture selection by seed (Tables A.3–A.6);
- parameter robustness (Table 4.1);
- single-scenario generalisation failure (Table 4.2);
- parameter-conditioned evaluation (Table 4.3);
- frozen-volatility proxy diagnostic, including the report-supported preliminary RMSE `0.008198`;
- COS/Carr–Madan and finite-difference Greek validation;
- representative Heston results (Tables 4.5–4.6);
- full-information multi-seed comparison (Table A.11);
- observable-information comparison (Tables A.10, A.12–A.14);
- position-bound sensitivity (Table A.15); and
- transaction-cost results (Table A.16).

Until these are supplied, the values remain fully report-supported but archive provenance is unresolved.

## 3. Original figures

If available, add the submitted high-resolution PDF/SVG/PNG files for:

- Black–Scholes hedge-error distributions;
- hedge ratio versus moneyness;
- representative pathwise hedge ratios;
- robustness against rebalancing frequency;
- Heston representative RMSE/CVaR comparison;
- average liquid-option position versus variance;
- data-generation comparison; and
- transaction-cost figures.

The current deck avoids low-resolution PDF screenshots. Main Slide 7 uses an explicitly labelled economic schematic rather than fabricating the unavailable empirical curve.

## 4. Group decisions before final upload

- Confirm whether the assessment date/location should appear anywhere beyond speaker notes. The title slide currently uses the presentation date but omits the room.
- Decide whether UCT/AIFMRM branding should be added. Only supplied and authorised logo files should be used.
- After the missing archive is added, perform one final code-to-slide filename pass and replace report-only code references with exact repository paths.
