# Slide traceability

Status definitions:

- **Verified — report:** directly supported by the supplied final report.
- **Verified — report code:** supported by a displayed code excerpt or algorithm in the report.
- **Report-supported; archive unresolved:** value is in the primary submitted report, but its separate notebook/CSV archive is absent.
- **Faithful schematic:** visual explanation contains no invented empirical data.

All report page numbers below are the printed report page numbers where available, not the PDF viewer index.

| Slide | Claim or value | Report location | Code/result location | Status | Notes |
|---:|---|---|---|---|---|
| 1 | Exact title | Title page | N/A | Verified — report | “Deep Hedging under Black–Scholes and Heston Dynamics.” |
| 1 | Micaela Marais, Glasson Osborne, Kaiden Wessels, Siphelele Nkosi; Prof. Ouwehand | Title page | N/A | Verified — report | Ordering follows title page. |
| 1 | Research-question framing | Abstract; Sec. 1 | N/A | Verified — report | Condensed without changing the research claim. |
| 2 | Self-financing terminal error equation | Sec. 1.1, Eqns. (1.1)–(1.2); Sec. 3.1 | Listing C.2; Algorithm A.6.1 | Verified — report code | Uses submitted \(r=0\) undiscounted convention. |
| 2 | Terminal MSE objective | Sec. 1.1, Eq. (1.2); Sec. 3.1 | Listing C.2; Algorithm A.6.1 | Verified — report code | Analytic delta is not a training target. |
| 2 | \(N=125\) baseline dates | Sec. 3.1; Table A.1 | Configuration in report | Verified — report | Baseline only. |
| 2 | Seller loss \(L=-HE\) | Sec. 3.1.4 | Listing C.2 explanation | Verified — report code | Sign convention preserved. |
| 3 | `simulate_gbm_paths` and \((B,N+1)\) | Appendix C, Listing C.1 | Displayed code allocates `paths` as `(n_paths, cfg.N + 1)` | Verified — report code | Executable notebook path unavailable. |
| 3 | BS state \((\log(S/K),\tau/T)\) | Sec. 2.2.2; Sec. 3.1.3 | Listing C.3 input shape `(2,)` | Verified — report code | Stacked \((B,N,2)\) is the report-level batching contract. |
| 3 | Shared 64×3 MLP, sigmoid output | Sec. 3.1.3; Figure 3.1 | Listing C.3 | Verified — report code | Same weights at every date. |
| 3 | `hedge_error`, \((B,)\) pathwise error | Appendix C, Listing C.2 | Displayed NumPy reduction over axis 1 | Verified — report code | Executable package absent. |
| 3 | Independent train/validation/test roles | Appendix A.1; Algorithm A.6.2 | Table A.1 | Verified — report | Main slide caveat discloses missing bundle. |
| 4 | Selected architecture specification | Secs. 3.1.2–3.1.3 | Listing C.3 | Verified — report code | Three hidden layers of width 64, tanh, sigmoid. |
| 4 | Selected mean test RMSE `0.007891`; time `103.0` | Tables 3.1, A.6 | Architecture CSV absent | Report-supported; archive unresolved | Mean across seeds 2026–2028. |
| 4 | ReLU alternative `0.007912`; `93.2 s` | Tables 3.1, A.6 | Architecture CSV absent | Report-supported; archive unresolved | Close alternative. |
| 4 | Time-separated `0.008083`; `786.9 s` | Tables 3.1, A.6 | Architecture CSV absent | Report-supported; archive unresolved | 16×1 time-separated model. |
| 4 | ReLU wins one seed | Table A.5 | Architecture CSV absent | Report-supported; archive unresolved | Prevents claim of unique dominance. |
| 5 | Benchmark taxonomy | Sec. 3.1.1 | Benchmark implementation absent | Verified — report | No hedge, BS delta, DT optimum, polynomial, NN. |
| 5 | Conditional covariance-ratio equation | Sec. 3.1.1; Appendix A.4 | Analytic implementation absent | Verified — report | Valid under submitted \(r=0\) martingale setting. |
| 6 | Final benchmark RMSE table | Table 3.2, p. 16 | Final benchmark CSV absent | Report-supported; archive unresolved | Exact five RMSE values transcribed. |
| 6 | Neural gap ≈0.4% above DT | Table 3.2 | Calculated from report values | Verified — report | \((0.007841/0.007810-1)\times100\approx0.397\%\). |
| 6 | Learned premium `0.163972`; analytic `0.164111` | Table 3.2; Sec. 3.1.4 | Final benchmark CSV absent | Report-supported; archive unresolved | Difference `0.000139` stated in report. |
| 7 | Monotone hedge from near zero OTM to near one ITM | Figure 3.3; Sec. 3.1.4 | Figure/data absent | Faithful schematic | Slide explicitly says it is not a data redraw. |
| 7 | Pathwise tracking on OTM/ATM/ITM examples | Figure 3.5; p. 18 | Figure/data absent | Verified — report | No numerical path values reproduced. |
| 8 | Retrained robustness values | Table 4.1, p. 20 | Robustness CSV absent | Report-supported; archive unresolved | Selected rows copied exactly. |
| 8 | Mean NN/DT ratio `1.049`; range `1.009–1.099` | Sec. 4.1.1, p. 21 | Robustness CSV absent | Report-supported; archive unresolved | Wording distinguishes relative and absolute error. |
| 8 | \(N=30\) NN `0.015595`; \(N=250\) NN `0.006047` | Table 4.1 | Robustness CSV absent | Report-supported; archive unresolved | Demonstrates falling absolute error. |
| 9 | Training point \(K^\star=0.9,\sigma^\star=0.4\) | Table 4.2 | Generalisation CSV absent | Verified — report | Evaluated elsewhere without retraining. |
| 9 | Selected off-scenario RMSE values | Table 4.2, p. 21 | Generalisation CSV absent | Report-supported; archive unresolved | Exact table subset. |
| 9 | Information-failure diagnosis | Sec. 4.1.2 | Input implementation described in report | Verified — report | Strike hardcoded, volatility absent, no training variation. |
| 10 | Conditioned state equation | Sec. 4.1.3, p. 22 | Algorithm A.6.3 | Verified — report | Four inputs reproduced exactly. |
| 10 | Training ranges for \(K,\sigma\) | Sec. 4.1.3 | Algorithm A.6.3 | Verified — report | Uniform ranges. |
| 10 | Interpolation/extrapolation RMSE subset | Table 4.3, p. 23 | Conditioned CSV absent | Report-supported; archive unresolved | Exact selected rows. |
| 10 | Analytic premium per path | Sec. 4.1.3; Table A.2 | Algorithm A.6.3 | Verified — report | Pricing separated from hedging. |
| 11 | Heston SDEs | Sec. 2.1.2, Eqns. (2.4)–(2.5); Sec. 4.1.4 | Algorithm A.3.3 | Verified — report | Notation uses \(v_t\) as in main Heston experiment. |
| 11 | Two Brownian sources imply stock-only incompleteness | Sec. 2.1.2; Sec. 4.1.4 | N/A | Verified — report | Diagram is conceptual. |
| 11 | \(\rho=-0.70\) | Sec. 4.1.4, p. 24 | Heston configuration absent | Report-supported; archive unresolved | Exact submitted correlation retained. |
| 11 | Orthogonal-shock decomposition \(dW^v=\rho dW^S+\sqrt{1-\rho^2}dW^\perp\) | Sec. 2.1.2 correlation specification | Algorithm A.3.3 correlated-normal construction | Verified — report code | Makes the residual variance shock explicit; no \(W^v\to\) stock arrow. |
| 12 | Correlated Gaussian construction | Sec. 4.1.4; Appendix A.3 | Listing C.4; Algorithm A.3.3 | Verified — report code | Independent normals are combined using submitted \(\rho\). |
| 12 | Log-Euler stock and full-truncation variance updates | Sec. 4.1.4; Appendix A.3 | Listing C.4 | Verified — report code | No exact simulation or antithetic claim. |
| 12 | Independent splits and complete-path sample | Appendix A.1; Algorithm A.6.10 | Report training protocol | Verified — report | Each path generates one terminal hedge error. |
| 13 | Two-instrument gain equation | Sec. 4.1.4, p. 24 | Algorithm A.6.10 | Verified — report code | \(\delta_n,\eta_n\) are total holdings. |
| 13 | Six-feature state | Sec. 4.1.4, p. 26 | Algorithm A.6.10 | Verified — report code | Reproduced in report notation and grouped by role. |
| 13 | \(\delta=5\tanh z_1,\eta=5\tanh z_2\) and \(\max|\eta^{NN}|\approx1.33\) | Sec. 4.1.4; Table A.12 | Algorithm A.6.10 | Verified — report code | Signed bounded actions; bound is a numerical control. |
| 13 | Target and hedge-option contracts | Sec. 4.1.4, p. 24 | Heston configuration absent | Verified — report | \(K=0.9,T=0.5,K_h=1,T_h=1\). |
| 14 | Frozen-volatility BS proxy equation | Sec. 4.1.4, p. 25 | Algorithm A.6.5 | Verified — report | Proxy stage clearly separated. |
| 14 | Preliminary proxy NN RMSE `0.008198` | Sec. 4.1.4, p. 25 | Exact run archive absent | Report-supported; archive unresolved | Notes only; explicitly non-comparable motivation. |
| 15 | Proxy movement `-0.009482`, SE `0.000459` | Table A.9; Sec. 4.1.4 | Drift CSV absent | Report-supported; archive unresolved | Bar length reproduces exact table value. |
| 15 | COS movement `-0.000118`, SE `0.000479` | Table A.9; Sec. 4.1.4 | Drift CSV absent | Report-supported; archive unresolved | Same-path diagnostic. |
| 15 | Sample-mean statistic and \(r=0\) martingale interpretation | Sec. 4.1.4; Algorithm A.6.8 | N/A | Verified — report | Diagnostic, not formal arbitrage proof; COS residual not called exactly zero. |
| 16 | Frozen-proxy drift residual equation | Sec. 4.1.4, p. 25; Appendix A.6.3 | N/A | Verified — report | Exact three terms. |
| 16 | Interpretation of residual terms | Sec. 4.1.4; Appendix A.6.3 | N/A | Verified — report | Wording follows report. |
| 16 | Negative sign qualification | Sec. 4.1.4 | Drift CSV absent | Verified — report | Sign attributed to submitted parameters and realised state distribution, not \(\xi,\rho\) alone. |
| 17 | COS uses Heston characteristic function and repeated path repricing | Sec. 4.1.4; Algorithm A.6.6 | COS notebook absent | Verified — report | Native pipeline diagram is conceptual. |
| 17 | 256 terms and interval \([-7,7]\) | Appendix A.6.2 | COS config absent | Report-supported; archive unresolved | Accuracy/runtime setting. |
| 17 | Max COS–Carr–Madan discrepancy `5.1×10^-8` | Sec. 4.1.4; Appendix A.6.2 | Validation CSV absent | Report-supported; archive unresolved | Traded validation grid only. |
| 17 | Delta error `9.8×10^-5`; variance error `4.7×10^-4` | Sec. 4.1.4, p. 26 | Greek validation CSV absent | Report-supported; archive unresolved | Report gives approximate values. |
| 18 | Representative Heston strategy values | Tables 4.5–4.6 | Heston CSV absent | Report-supported; archive unresolved | Representative and multi-seed evidence separated. |
| 18 | Strongest heuristic is BS-proxy Greeks on COS path | Table 4.6; Sec. 4.1.4 | Heston CSV absent | Verified — report | Described as heuristic, not optimum. |
| 18 | Seed rows 111/222/333 | Table A.11 | Multi-seed CSV absent | Report-supported; archive unresolved | Exact RMSE and improvement values. |
| 18 | Mean RMSE improvement `22.7%`; CVaR95 `27.1%` | Sec. 4.1.4; Table A.11 | Multi-seed CSV absent | Report-supported; archive unresolved | All three pairwise comparisons favour NN. |
| 18 | Fair-premium centering caveat | Sec. 4.1.4, p. 26; Table A.2 | Heston evaluation code absent | Verified — report | Same test paths used for centering and risk metrics. |
| 19 | Three calibrated conclusions | Sec. 5, pp. 31–32 | N/A | Verified — report | Faithful condensation of conclusion. |
| 19 | Learned option position broadly follows variance-hedge direction and softens at high variance | Figure 4.3; Sec. 4.1.4 | Figure/data absent | Verified — report | No empirical curve redrawn. |
| 19 | Limitations: three seeds, centering, heuristic comparator, frictionless Heston, information set | Sec. 4.1.4; Sec. 5 | N/A | Verified — report | Main limitations shown visibly. |

## Backup code provenance

| Backup slide | Excerpt | Source | Treatment |
|---|---|---|---|
| Heston simulation | Correlated shocks, log-Euler stock, full-truncation variance | Report Listing C.4 | Line wrapping only; semantics preserved. |
| Two-instrument loss | Six features, two tanh outputs, gain and MSE | Report Algorithm A.6.10 | Explicitly labelled faithful pseudocode because executable notebook is absent. |

## Unresolved archive provenance

See `OPEN_QUESTIONS.md` for the exact missing notebook, result, figure and package-version materials. No deck value was changed or replaced because its archive was missing.
