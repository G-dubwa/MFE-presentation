# Speaker notes

Planned main-deck speech: **27:20**, leaving approximately **2:40** inside the 30-minute limit.

| Speaker | Slides | Planned time |
|---|---:|---:|
| Kaiden Wessels | 1–5 | 6:50 |
| Micaela Marais | 6–10 | 6:50 |
| Siphelele Nkosi | 11–14 | 6:40 |
| Glasson Osborne | 15–18 | 6:40 including handover |

The notes below are prompts, not a script. Numerical values should be spoken only where listed.

## Slide 1 — Deep Hedging under Black–Scholes and Heston Dynamics

- **Speaker / time:** Kaiden — 0:30
- **Central claim:** The project first validates neural hedging against a known finite-grid solution, then studies what changes under parameter variation and stochastic volatility.
- **Opening:** “We ask whether terminal-error training can recover a hedge we already know, before trusting the same framework in a harder market.”
- **Speaking points:**
  - Introduce all four members and supervisor.
  - State that Black–Scholes is a controlled validation environment.
  - Preview the transition to Heston and a larger traded instrument set.
- **Exact values:** None.
- **Do not overclaim:** Do not say the network beats Black–Scholes.
- **Transition:** “We begin with the exact self-financing objective used throughout.”
- **Likely question:** Why start with Black–Scholes?
- **Answer outline:** It supplies analytic and finite-grid benchmarks; failure there would undermine confidence in harder experiments.
- **Report source:** Title page, Abstract, Sec. 1.
- **Code/result source:** Not applicable.

## Slide 2 — The hedge is learned through terminal portfolio error

- **Speaker / time:** Kaiden — 1:30
- **Central claim:** Hedge positions and premium are learned by minimising terminal MSE through a self-financing gain equation.
- **Opening:** “The network is not trained on delta labels; it is trained on whether terminal wealth covers the payoff.”
- **Speaking points:**
  - Define premium, stock position, gain and payoff.
  - Explain adaptation: \(\delta_n\) uses information at \(t_n\).
  - Define hedge error and seller loss.
  - State why the displayed form is undiscounted: submitted baseline has \(r=0\).
- **Exact values:** \(N=125\) hedge dates in the baseline.
- **Do not overclaim:** MSE is the submitted objective, not the only possible risk criterion.
- **Transition:** “This equation is implemented as one differentiable pipeline.”
- **Likely question:** Where is the cash account?
- **Answer outline:** With self-financing and \(r=0\), initial premium plus risky-asset gains determines terminal wealth; cash is implicit.
- **Report source:** Secs. 1.1, 2.2.2, 3.1; Eqns. (1.1)–(1.2).
- **Code/result source:** Report Listing C.2; executable notebook absent.

## Slide 3 — The implementation is differentiable end to end

- **Speaker / time:** Kaiden — 2:00
- **Central claim:** Simulated paths flow through causal features, one shared network, self-financing gains and terminal MSE; backpropagation updates the policy without analytic hedge labels.
- **Opening:** “Every block in the experiment has a financial meaning and a report-level implementation trace.”
- **Speaking points:**
  - `simulate_gbm_paths` returns \(B\times(N+1)\) paths.
  - Two features per path-time point feed the shared MLP.
  - The same weights are reused at every hedge date.
  - `hedge_error` aggregates gains to a pathwise vector and MSE is reduced across the batch.
  - Training, validation and test paths are independent.
- **Exact values:** Path shape \((B,N+1)\); feature contract \((B,N,2)\); pathwise error \((B,)\).
- **Do not overclaim:** Do not imply the absent notebook bundle was audited. Names are verified only from report Appendix C.
- **Transition:** “The next question is why this particular network was selected.”
- **Likely question:** Does flattening path-time points leak future information?
- **Answer outline:** No. Each row contains only the state at \(t_n\); flattening is a batching device. Gains use the position chosen before \(\Delta S_n\).
- **Report source:** Algorithm A.6.1; Listings C.1–C.3.
- **Code/result source:** Report Appendix C; external executable path unresolved.

## Slide 4 — Call economics guide architecture selection

- **Speaker / time:** Kaiden — 1:30
- **Central claim:** Normalised Markov inputs, shared weights and a sigmoid output impose appropriate structure while retaining enough capacity.
- **Opening:** “The architecture is selected, but its constraints come from the financial problem.”
- **Speaking points:**
  - Explain log-moneyness and normalised time.
  - Explain why shared weights are more efficient than time-separated networks.
  - Explain sigmoid range \(0<\delta<1\).
  - Mention three-seed validation-based selection and close ReLU alternative.
  - Architecture search batch 256; final retraining batch 4096.
- **Exact values:** Selected mean test RMSE `0.007891`, mean time `103.0 s`; ReLU `0.007912`; time-separated `0.008083`, `786.9 s`.
- **Do not overclaim:** Say “selected,” not “uniquely dominant”; ReLU won seed 2028.
- **Transition:** “Architecture quality is meaningful only relative to the right benchmark.”
- **Likely question:** Why not use \(d_1\) as an input?
- **Answer outline:** \(d_1\) embeds \(r\) and \(\sigma\) and is directly tied to the analytic solution, so it would introduce analytic supervision into the minimal-task search.
- **Report source:** Secs. 3.1.2–3.1.3; Tables 3.1, A.3–A.6.
- **Code/result source:** Report Listing C.3; architecture CSV absent.

## Slide 5 — The fair benchmark matches the grid and objective

- **Speaker / time:** Kaiden — 1:20
- **Central claim:** The discrete-time conditional-projection hedge is the fairest Black–Scholes comparator for a terminal-MSE neural policy evaluated on the same finite grid.
- **Opening:** “Continuous-time delta is essential, but the neural network is solving a finite-grid problem.”
- **Speaking points:**
  - Distinguish continuous-time delta sampled on the grid from the finite-grid MSE hedge.
  - Explain covariance ratio as conditional regression.
  - Position polynomial as low-capacity, not strongest possible non-neural model.
  - All strategies are evaluated on the same held-out paths.
- **Exact values:** None.
- **Do not overclaim:** Covariance-ratio reduction is specific to the submitted \(r=0\) martingale setting.
- **Transition / handover:** “With the fair benchmark established, Micaela will show whether the network recovered it.”
- **Likely question:** Why are BS delta and finite-grid optimum almost identical?
- **Answer outline:** The \(N=125\) grid is fine, so the finite-grid problem is close to continuous replication; small tail differences remain.
- **Report source:** Sec. 3.1.1; Appendix A.4.
- **Code/result source:** Analytic benchmark described in report; executable implementation absent.

## Slide 6 — The neural hedge recovers the finite-grid benchmark

- **Speaker / time:** Micaela — 1:30
- **Central claim:** Neural RMSE is within 0.4% of the submitted discrete-time benchmark and far below the polynomial baseline.
- **Opening:** “The central Black–Scholes result is near equality, not outperformance.”
- **Speaking points:**
  - Compare no hedge, two analytic benchmarks, polynomial and neural.
  - State the final neural row comes from independent retraining.
  - Compare learned and analytic premiums.
  - Mention tail metrics show the same ordering if asked.
- **Exact values:** No hedge `0.227257`; BS and DT `0.007810`; polynomial `0.022183`; neural `0.007841`; learned premium `0.163972`; analytic `0.164111`.
- **Do not overclaim:** Do not round the neural value below the benchmark or say it wins.
- **Transition:** “Aggregate RMSE is not enough; the hedge itself must make financial sense.”
- **Likely question:** Why is the learned premium slightly low?
- **Answer outline:** Difference `0.000139`; finite-sample and optimisation effects. In the submitted \(r=0\) martingale setting, the jointly optimal capital equals expected payoff.
- **Report source:** Table 3.2; Sec. 3.1.4.
- **Code/result source:** Final benchmark CSV absent; report-supported.

## Slide 7 — The learned hedge has the right financial shape

- **Speaker / time:** Micaela — 1:10
- **Central claim:** The learned hedge is monotone in moneyness and tracks analytic strategies across both averaged and pathwise views.
- **Opening:** “The network did not achieve a low loss through an economically strange policy.”
- **Speaking points:**
  - Explain deep OTM, near-strike and deep ITM positions.
  - Cite submitted Figure 3.3 for averaged hedge ratios.
  - Cite Figure 3.5 for representative pathwise agreement.
  - Explicitly identify the slide visual as a schematic.
- **Exact values:** None.
- **Do not overclaim:** Do not imply the schematic is a redraw from raw data.
- **Transition:** “We then tested whether the architecture remains useful when the scenario changes and it is retrained.”
- **Likely question:** Could similar average curves hide pathwise instability?
- **Answer outline:** Submitted representative OTM, ATM and ITM paths show near-indistinguishable stepwise positions; full raw figure files remain to be added.
- **Report source:** Figures 3.3 and 3.5; Sec. 3.1.4.
- **Code/result source:** Figure/data files absent.

## Slide 8 — Retraining preserves architecture quality

- **Speaker / time:** Micaela — 1:20
- **Central claim:** Across tested contract and grid changes, retrained neural RMSE stays within 9.9% of the finite-grid optimum and improves absolutely with finer hedging.
- **Opening:** “This is architecture robustness under retraining, not zero-shot generalisation.”
- **Speaking points:**
  - State NN/DT range and mean.
  - Use \(N=30\) versus \(N=250\) to separate absolute and relative performance.
  - Mention one-factor-at-a-time variation in strike, volatility, maturity and frequency.
- **Exact values:** NN/DT range `1.009–1.099`; mean `1.049`; NN RMSE `0.015595` at \(N=30\), `0.006047` at \(N=250\).
- **Do not overclaim:** Do not call this one model working across all scenarios.
- **Transition:** “When the original single-scenario model is used without retraining, the story changes completely.”
- **Likely question:** Why does the ratio worsen at \(N=250\)?
- **Answer outline:** Both improve, but the analytic finite-grid benchmark shrinks faster, exposing residual approximation/optimisation error.
- **Report source:** Table 4.1; Sec. 4.1.1.
- **Code/result source:** Robustness CSV absent.

## Slide 9 — Missing information—not capacity—causes failure

- **Speaker / time:** Micaela — 1:20
- **Central claim:** Out-of-scenario failure is caused by an information and training-distribution mismatch, not simply insufficient path count.
- **Opening:** “A policy cannot learn dependence on variables it neither observes nor sees vary.”
- **Speaking points:**
  - Training point \(K^\star=0.9,\sigma^\star=0.4\).
  - Strike is hardcoded in original moneyness; volatility is omitted.
  - Same-scenario data cannot reveal the missing dependence.
  - Use one dramatic off-scenario comparison.
- **Exact values:** At \(K=0.7,\sigma=0.2\): DT `0.000492`, neural `0.143314`; at training point neural `0.007841`.
- **Do not overclaim:** Do not claim all neural generalisation fails; diagnose this representation/distribution.
- **Transition:** “The repair is to expose the parameters and vary them during training.”
- **Likely question:** Would a larger network fix it?
- **Answer outline:** Not without parameter inputs and variation; capacity cannot identify unobserved, constant variables.
- **Report source:** Table 4.2; Sec. 4.1.2.
- **Code/result source:** Generalisation result CSV absent.

## Slide 10 — Conditioning restores cross-contract usefulness

- **Speaker / time:** Micaela — 1:30
- **Central claim:** Adding \(K,\sigma\) to the state and training over their distribution yields strong interpolation and mostly graceful moderate extrapolation.
- **Opening:** “We changed both the information set and the training distribution.”
- **Speaking points:**
  - Define four-input state.
  - Give training ranges and 200k path budget if time permits.
  - Explain path-specific analytic premium and separation of pricing from hedging.
  - Contrast good strike extrapolation with harder low-volatility extrapolation.
- **Exact values:** Training ranges \(K\in[0.7,1.1]\), \(\sigma\in[0.2,0.6]\); at \(0.9,0.4\), DT `0.007813`, NN `0.007830`; at \(0.9,0.1\), DT `0.001019`, NN `0.003404`.
- **Do not overclaim:** The conditioned model does not learn premiums and extrapolation is not uniformly strong.
- **Transition / handover:** “Black–Scholes still has one diffusion risk. Siphelele now moves to Heston, where variance adds a second.”
- **Likely question:** How would this work without analytic prices?
- **Answer outline:** A separate pricing/premium component would be needed; this experiment isolates cross-contract hedging.
- **Report source:** Sec. 4.1.3; Table 4.3; Algorithm A.6.3.
- **Code/result source:** Conditioned notebook/CSV absent.

## Slide 11 — Heston introduces a second source of risk

- **Speaker / time:** Siphelele — 1:40
- **Central claim:** Stochastic variance adds a correlated diffusion source that stock and cash alone cannot span.
- **Opening:** “Heston changes both the state process and the market-completeness argument.”
- **Speaking points:**
  - Define \(v,\kappa,\theta,\xi,\rho\).
  - Explain two Brownian shocks and one risky asset.
  - Add a liquid option with nonzero variance sensitivity.
  - Note the submitted parameters satisfy Feller.
- **Exact values:** \(v_0=\theta=0.16\), \(\kappa=2\), \(\xi=0.60\), \(\rho=-0.70\); \(2\kappa\theta=0.64\), \(\xi^2=0.36\).
- **Do not overclaim:** Discrete trading and numerical approximation still leave error after adding the option.
- **Transition:** “The learned policy must now choose two signed positions.”
- **Likely question:** Why does an option complete the market?
- **Answer outline:** Locally, stock and an option with nonzero variance sensitivity can span the two diffusion shocks in the ideal continuous-time frictionless model.
- **Report source:** Secs. 2.1.2 and 4.1.4.
- **Code/result source:** Heston parameters in report; notebook absent.

## Slide 12 — The hedge now chooses two traded positions

- **Speaker / time:** Siphelele — 1:45
- **Central claim:** A six-feature causal state drives two bounded signed positions whose stock and option gains enter one terminal-MSE objective.
- **Opening:** “The objective is unchanged in spirit, but both the state and action space expand.”
- **Speaking points:**
  - Define \(\delta\), \(\eta\) and the two gain sums.
  - Explain each state feature.
  - Target option \(K=0.9,T=0.5\); hedge option \(K_h=1,T_h=1\).
  - Explain tanh bounds and Heston path scheme.
- **Exact values:** Output bound \(\pm5\); six inputs; two outputs; \(N=125\).
- **Do not overclaim:** Bounds are numerical controls, not proof of optimal economic constraints.
- **Transition:** “The first liquid-option price was fast and plausible, but not model-consistent.”
- **Likely question:** Does the option quote leak future information?
- **Answer outline:** No; \(C^h_{t_n}\) is contemporaneous. It does contain current variance information, which is why the robustness check is described as observable-market-information, not stock-return-only.
- **Report source:** Sec. 4.1.4; Algorithms A.3.3, A.6.10.
- **Code/result source:** Report Listing C.4 and Algorithm A.6.10; executable notebook absent.

## Slide 13 — The frozen-volatility proxy changed the market

- **Speaker / time:** Siphelele — 1:45
- **Central claim:** Plugging \(\sqrt v_t\) into Black–Scholes creates a cheap variance-sensitive price, but one governed by the wrong dynamic pricing equation.
- **Opening:** “The proxy was a reasonable engineering first step and an inconsistent traded process.”
- **Speaking points:**
  - Explain the plug-in construction.
  - Say why it seemed useful.
  - Mention preliminary performance only as motivation.
  - Separate Heston state simulation from BS pricing dynamics.
- **Exact values:** Preliminary proxy-priced stock-plus-option NN RMSE `0.008198`.
- **Do not overclaim:** The separate run archive is absent; value is report-supported. Do not compare it directly with final COS results.
- **Transition:** “A risk-neutral martingale diagnostic makes the mismatch visible.”
- **Likely question:** Is any approximation invalid as a hedge price?
- **Answer outline:** Approximation error in price level can be tolerable, but a traded path should be dynamically consistent with the simulated risk-neutral market; this proxy has a systematic drift artifact.
- **Report source:** Sec. 4.1.4, pp. 24–25; Algorithm A.6.5.
- **Code/result source:** Preliminary archive absent.

## Slide 14 — A martingale diagnostic exposes inconsistency

- **Speaker / time:** Siphelele — 1:30
- **Central claim:** The proxy’s mean total movement is materially negative, while the COS-priced option is statistically consistent with zero under \(r=0\).
- **Opening:** “If this is a traded risk-neutral price at zero rates, average movement should be approximately zero.”
- **Speaking points:**
  - Read the proxy mean and standard error.
  - Read the COS mean and standard error.
  - Explain why the comparison is made on the same Heston paths.
  - Attribute small COS residual to discretisation.
- **Exact values:** Proxy `-0.009482`, SE `0.000459`; COS `-0.000118`, SE `0.000479`.
- **Do not overclaim:** Call it a diagnostic, not a formal standalone arbitrage proof.
- **Transition / handover:** “The diagnostic is empirical. Glasson will show the exact missing drift terms and the model-consistent correction.”
- **Likely question:** Could sampling noise explain the proxy drift?
- **Answer outline:** The magnitude is roughly 20 standard errors from zero; COS on the same setup is well within one.
- **Report source:** Table A.9; Sec. 4.1.4.
- **Code/result source:** Drift CSV absent.

## Slide 15 — Why the frozen-volatility proxy drifts

- **Speaker / time:** Glasson — 1:40
- **Central claim:** The frozen-variance Black–Scholes PDE cancels the stock-price terms, but three variance-related Heston drift terms remain.
- **Spoken notes:** “Siphelele’s diagnostic establishes that the proxy path is dynamically inconsistent. I’ll now show which Heston terms the frozen Black–Scholes PDE omits, how we corrected the price process, and how the final strategies compare. The proxy is a Black–Scholes call evaluated at the current spot and current volatility, which is the square root of variance. If variance were frozen, its Black–Scholes PDE would cancel the time derivative, stock drift, stock curvature and discounting terms shown on the left. But variance is not frozen under Heston. Applying Itô leaves the three terms on the right: mean reversion times variance sensitivity, volatility-of-volatility times variance curvature, and the spot–variance interaction. Repricing the formula at every date changes its level, but it does not make the resulting path solve the Heston pricing equation. The combined sign is state-dependent—it is not determined by rho and xi alone. Under our submitted parameters and simulated state distribution, its average was negative, which is consistent with the empirical drift diagnostic. Because our submitted rate is zero, discounted and undiscounted residuals coincide. A drift-contaminated liquid-option path matters because every option gain in the hedge inherits that pricing inconsistency.”
- **Optional if time permits:** “The full Itô expansion and multiplication rules are in backup.”
- **Transition:** “The repair is to price the liquid option under the same Heston model that generates the states.”
- **Likely question:** Why does freezing \(v\) fail if the BS formula is recomputed every date?
- **Answer:** Recomputing levels does not make the process satisfy the Heston PDE; variance drift, variance curvature and spot–variance cross-variation still enter its dynamics.
- **Report source:** Sec. 4.1.4; Appendix A.6.3.

## Slide 16 — COS evaluates a Heston-consistent option price

- **Speaker / time:** Glasson — 1:30
- **Central claim:** COS is the numerical Heston pricer; the analytic benchmark is a separate local sensitivity-matching rule.
- **Spoken notes:** “We now value the liquid hedge option as its Heston risk-neutral conditional expectation. COS is simply the numerical method used to evaluate that expectation efficiently at every simulated state; COS is not itself a hedging strategy. We validated its prices independently with Carr–Madan, with a maximum discrepancy of \(5.1\times10^{-8}\) over the submitted traded range. Carr–Madan is a price cross-check only. Central finite differences separately validate the implemented price sensitivities; the backup records delta error of about \(9.8\times10^{-5}\) and variance-sensitivity error of about \(4.7\times10^{-4}\). For a target value \(f\) and hedge-option value \(g\), the local analytic rule first sets the option holding to \(f_v/g_v\), matching instantaneous variance exposure. It then sets the stock holding to \(f_S-\eta g_S\), removing the remaining stock exposure. Here the subscript \(v\) means variance sensitivity. Conventional volatility vega satisfies \(C_v=C_\sigma/(2\sqrt v)\). The Heston COS benchmark uses COS sensitivities; the BS-proxy heuristic uses frozen-variance Black–Scholes sensitivities. Crucially, both trade the same COS-priced option path. Only the position rule differs.”
- **Optional if time permits:** “The submitted COS implementation uses 256 terms on the stated truncation interval; this is a validated traded-range setting, not a global accuracy claim.”
- **Transition:** “That same-path design lets us compare position rules without changing the traded asset.”
- **Likely question:** Why use COS rather than Carr–Madan at every path state?
- **Answer:** COS is efficient for repeated state pricing; Carr–Madan was retained as an independent offline validation method.
- **Report source:** Sec. 4.1.4; Appendices A.6.1–A.6.2.

## Slide 17 — The NN lowers error in all three submitted seeds

- **Speaker / time:** Glasson — 2:00
- **Central claim:** On the centred submitted test protocol, the stock-and-option neural policy beat the strongest tested local heuristic in every seed.
- **Spoken notes:** “The strongest tested comparator is **BS-proxy Greeks on COS option path**. In this final diagnostic, the BS proxy determines positions only. All liquid-option gains are marked using the same COS price path, so the comparison is same traded path, different position rule. In the representative results, the stock-and-option network has RMSE \(0.007426\), compared with \(0.009874\) for that heuristic and \(0.014782\) for the Heston COS delta–vega benchmark. The seed table gives the complete pairwise evidence: for seeds 111, 222 and 333, neural RMSEs are \(0.007806\), \(0.007715\) and \(0.007346\); heuristic RMSEs are \(0.009838\), \(0.009871\) and \(0.009864\). Those are improvements of 20.6, 21.8 and 25.5 per cent, with a mean of 22.7 per cent. Mean Loss CVaR95 improves by 27.1 per cent. Loss CVaR95 means the average seller loss in the worst five per cent of test outcomes. The protocol centres each strategy with \(\pi_j^*=E_{test}[H-G_T^j]\), then measures \(HE_j=\pi_j^*+G_T^j-H\). This removes each strategy’s unconditional mean error on the same test paths, so the result compares centred dispersion and tail risk; it is not fully out-of-sample joint pricing and hedging. Finally, model-consistent pricing, locally consistent Greek matching and finite-grid terminal-MSE optimality are different questions. Both analytic rules are local first-order matches. Between trading dates, gamma, variance curvature, cross effects and changing Greeks remain. Approximation-error cancellation may help the BS-proxy heuristic in this regime, while the network trains directly on terminal MSE. This does not show that Black–Scholes prices Heston options better, and it is not a claim against an optimal analytic Heston hedge.”
- **Optional if time permits:** “Turnover supports the diagnostic discussion but does not by itself prove the ordering.”
- **Transition:** “The last slide states the strongest conclusion these experiments support—and where it stops.”
- **Likely question:** Why can the model-consistent COS Greek rule have higher terminal RMSE?
- **Answer:** It is a local instantaneous exposure match, not the finite-grid multi-instrument minimum-MSE solution; between-date nonlinearities and approximation-error cancellation can change terminal performance.
- **Report source:** Tables 4.5–4.6 and A.11; Sec. 4.1.4.

## Slide 18 — Three conclusions survive the diagnostics

- **Speaker / time:** Glasson — 1:25
- **Central claim:** The submitted experiments support three useful conclusions, each within explicit empirical and protocol limits.
- **Spoken notes:** “Three conclusions survive the diagnostics. First, in Black–Scholes the neural strategy recovered the known finite-grid hedge. Second, adding the missing contract information repaired the identified generalisation failure. Third, in Heston, once the liquid option was priced consistently, the stock-and-option network achieved lower terminal error than the strongest tested local heuristic in every submitted seed. The limits are equally important: there are three seeds and test-path fair-premium centring; the comparators are local heuristics rather than a derived finite-grid multi-instrument optimum; and the experiment is a frictionless simulated Heston setting under the submitted information assumptions. The ordering also survived an observable-information check using a causal EWMA variance proxy, although the contemporaneous option quote remained variance-informative. A constrained and carefully validated neural policy can first recover a known solution and then adapt when the state dynamics, information set, and traded instruments become more complex.”
- **Delivery:** Stop after the final displayed sentence. Do not reread the caveats.
- **Likely question:** What is the most important next analytic benchmark?
- **Answer:** A finite-grid Heston minimum-variance hedge for the joint stock-and-option gain process, accounting explicitly for spot–variance correlation.
- **Report source:** Secs. 4.1.4 and 5; stated limitations and observable-information diagnostic.
