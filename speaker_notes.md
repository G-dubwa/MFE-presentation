# Speaker notes

Planned main-deck speech: **26:15**, leaving approximately **3:45** inside the 30-minute limit.

| Speaker | Slides | Planned time |
|---|---:|---:|
| Kaiden Wessels | 1–5 | 6:50 |
| Micaela Marais | 6–10 | 6:50 |
| Siphelele Nkosi | 11–15 | 6:30 |
| Glasson Osborne | four titled slides | 6:05 including handover |

Glasson timing check: **6:05** for the 1,016-word final speech using the 190-wpm rehearsal setting, within the requested 5:50–6:10 range.

Except for Glasson's supplied final script on slides 16--19, the notes below are prompts rather than a verbatim script. Numerical values should be spoken only where listed.

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

- **Speaker / time:** Siphelele — 1:25
- **Central claim:** Stochastic variance adds an orthogonal diffusion component that stock and cash alone cannot span.
- **Spoken notes:** “Black–Scholes gave us one stock-driven source of uncertainty. Under Heston, variance becomes stochastic as well, which changes both the hedgeable risks and the information available to the strategy. The first equation drives the stock with instantaneous volatility \(\sqrt{v_t}\); the second makes the instantaneous variance \(v_t\) mean-revert while receiving its own shock. Those shocks are correlated, but they are not identical. Writing the variance shock as a correlated stock component plus \(\sqrt{1-\rho^2}\,dW^\perp\) shows that an orthogonal variance shock remains because \(|\rho|<1\). Stock gives us only one traded diffusion exposure, so stock and cash cannot span that second component. A liquid option with non-zero variance sensitivity adds a second locally independent exposure. In the ideal continuous-time frictionless model this can locally span both shocks; it is not a claim of global completion under our discrete trading grid.”
- **Optional if short on time:** Omit the sentence defining mean reversion and say only that \(v_t\) is instantaneous variance.
- **Transition:** “We now simulate both risks together to create the market paths used for training.”
- **Likely question:** Why does an option complete the market?
- **Answer outline:** Locally, stock and an option with nonzero variance sensitivity can span the two diffusion shocks in the ideal continuous-time frictionless model.
- **Report source:** Secs. 2.1.2 and 4.1.4.
- **Code/result source:** Heston parameters in report; notebook absent.

## Slide 12 — How Heston training paths are generated

- **Speaker / time:** Siphelele — 0:55
- **Central claim:** One observation for the loss is an independently simulated complete Heston trajectory.
- **Spoken notes:** “These are simulated risk-neutral paths, not historical data. At each step we draw an independent stock shock and orthogonal shock, then combine them to produce the correlated variance shock. Stock is updated with log-Euler, which preserves a positive stock level. Variance uses full-truncation Euler: the non-negative part enters the drift and square root, and the stored next value is clamped, so a negative Euler proposal does not propagate. We then reprice the liquid option at every hedge date, form the six-feature state, choose both holdings and accumulate gains. One training sample is this entire trajectory and produces one terminal hedge error. Training, validation and test sets use independently simulated paths.”
- **Optional if short on time:** Omit the tensor dimensions; they are shown in backup.
- **Transition:** “At each date along that path, the network chooses two total holdings.”
- **Likely question:** Does the Feller condition make truncation unnecessary?
- **Answer outline:** No. Feller concerns the continuous-time process; a finite Euler step can still propose a negative variance.
- **Report source:** Listing C.4; Algorithms A.3.3, A.6.8 and A.6.10.
- **Code/result source:** Report code excerpt; executable notebook absent.

## Slide 13 — The hedge chooses two traded positions

- **Speaker / time:** Siphelele — 1:30
- **Central claim:** Six causal features drive two bounded signed total holdings whose gains enter the terminal-MSE objective.
- **Spoken notes:** “The objective is unchanged in spirit, but both the information set and action space expand. The network sees two target features: log-moneyness and remaining target time. It sees variance scaled by its long-run level. It also sees the hedge option’s log-moneyness, remaining maturity and its contemporaneous price divided by stock. These ratios normalise scale, and the option quote contains current variance information. The two outputs are delta units of stock and eta units of the liquid option held over the next interval. They are total holdings, not trades; trade increments would be differences from the previous holdings and matter once transaction costs are introduced. Both positions may be positive or negative, so a Black–Scholes call-delta sigmoid is unsuitable. Scaled tanh allows signed positions and bounds them at five for numerical stability; that bound is not an optimality theorem, and the observed neural option holding stayed near 1.33 in absolute value. This headline experiment is full-information simulation because true simulated variance enters the state; instantaneous variance would be latent in real markets. Finally, the target liability has \(K=0.9,T=0.5\), while the hedge option is initially near the money at \(K_h=1\) and remains alive to \(T_h=1\). Trading the target itself would largely trivialise the task.”
- **Optional if short on time:** Omit the sentence on the observed maximum option holding.
- **Transition:** “The first way we generated that option quote was fast and causal, but dynamically inconsistent.”
- **Likely question:** Does the option quote leak future information?
- **Answer outline:** No; \(C^h_{t_n}\) is contemporaneous. It does contain current variance information, which is why the robustness check is described as observable-market-information, not stock-return-only.
- **Report source:** Sec. 4.1.4; Algorithms A.3.3, A.6.10.
- **Code/result source:** Report Listing C.4 and Algorithm A.6.10; executable notebook absent.

## Slide 14 — Frozen-volatility repricing is inconsistent

- **Speaker / time:** Siphelele — 1:15
- **Central claim:** Plugging \(\sqrt v_t\) into Black–Scholes creates a cheap variance-sensitive price, but one governed by the wrong dynamic pricing equation.
- **Spoken notes:** “The first liquid-option proxy was a reasonable engineering step. At date \(t_n\), we insert the current Heston volatility \(\sqrt{v_{t_n}}\) into Black–Scholes and value the option as though that volatility remains constant until its maturity. At the next date we repeat the calculation using the newly simulated variance. This is causal, cheap and responsive to current variance, so it appeared to provide a useful second instrument. But the stock and variance still follow Heston while each valuation solves a frozen-volatility Black–Scholes equation. Recomputing the level every date does not make the resulting sequence satisfy the Heston pricing equation. The preliminary neural RMSE of 0.008198 was motivation only; it is not directly comparable with the final COS experiment because the traded-option process changes.”
- **Optional if short on time:** Omit the preliminary RMSE sentence.
- **Transition:** “A risk-neutral martingale diagnostic makes the mismatch visible.”
- **Likely question:** Is any approximation invalid as a hedge price?
- **Answer outline:** Approximation error in price level can be tolerable, but a traded path should be dynamically consistent with the simulated risk-neutral market; this proxy has a systematic drift artifact.
- **Report source:** Sec. 4.1.4, pp. 24–25; Algorithm A.6.5.
- **Code/result source:** Preliminary archive absent.

## Slide 15 — A martingale diagnostic exposes the inconsistency

- **Speaker / time:** Siphelele — 1:25
- **Central claim:** The proxy’s mean total movement is materially negative, while the COS-priced option is statistically consistent with zero under \(r=0\).
- **Spoken notes:** “The diagnostic measures the sample mean of the liquid option’s total movement from time zero to the target hedge horizon \(T=0.5\). The liquid option itself remains alive until \(T_h=1\). Under zero rates, a consistently risk-neutral-priced traded option should have approximately zero mean movement. This does not mean every path is flat; it means there is no predictable mean drift across paths. For the Black–Scholes proxy, the estimate is minus 0.009482 with standard error 0.000459—about twenty standard errors from zero. For the COS-priced option, it is minus 0.000118 with standard error 0.000479, statistically negligible and within ordinary simulation and discretisation error. We therefore say COS is consistent with the martingale diagnostic, not exactly drift-free. The test diagnoses dynamic inconsistency in the proxy path; it is not by itself a complete proof of executable real-market arbitrage.”
- **Optional if short on time:** Read only the proxy estimate and say that the COS estimate is well within one standard error.
- **Transition / handover:** “The diagnostic shows that the proxy path is dynamically inconsistent with the simulated Heston market. Glasson will now show which Heston terms produce this drift and how the final COS implementation addresses it.”
- **Likely question:** Could sampling noise explain the proxy drift?
- **Answer outline:** The magnitude is roughly 20 standard errors from zero; COS on the same setup is well within one.
- **Report source:** Table A.9; Sec. 4.1.4.
- **Code/result source:** Drift CSV absent.

## Glasson — Why the frozen-volatility proxy drifts

### Handover

Thanks, Siphelele.

The martingale diagnostic shows that the frozen-volatility proxy is not dynamically consistent with the simulated Heston market. Over the hedge horizon, its price process has a statistically significant negative average movement.

I’ll now explain where that movement comes from, how we replaced the proxy with Heston-consistent pricing, and how the final hedging strategies performed.

### Why the frozen-volatility proxy drifts

**Delivery cue — not spoken:** Point to the left box when saying what Black–Scholes cancels. Point to the right box when naming the three Heston effects. Do not read either equation aloud.

The function at the top of the slide is the price assigned to our liquid hedging option using the frozen-volatility Black–Scholes proxy.

At each hedge date, we take the current Heston variance, convert it into volatility, and insert it into the Black–Scholes formula.

The problem is that each Black–Scholes valuation treats that volatility as though it will remain constant until the hedge option expires, even though variance continues to evolve according to Heston.

To understand the effect of this mismatch, we apply Itô’s lemma to the Black–Scholes pricing function under the actual Heston stock and variance dynamics.

The equation on the left shows the terms cancelled by the frozen-volatility Black–Scholes equation: the time term, the stock-drift term and the stock-gamma term.

However, the three terms on the right remain.

The first comes from variance mean reversion interacting with the option’s sensitivity to variance.

The second comes from volatility of volatility interacting with curvature in the option value with respect to variance.

The third comes from the interaction between the stock and variance shocks.

Together, these terms create a residual drift under Heston.

Repricing the option at every date does not remove this residual. We are repeatedly evaluating a Black–Scholes function, but that function still does not satisfy the full Heston pricing equation.

The residual can be positive or negative depending on the current state. Under our submitted parameters and simulated states, however, its average contribution was negative, which is consistent with the martingale diagnostic on the previous slide.

## Glasson — COS evaluates a Heston-consistent option price

**Delivery cue — not spoken:** Point to the process strip when distinguishing Monte Carlo from COS. Point to the two hedge equations while explaining their economic purpose. Pause after: “The traded price process is therefore the same.”

We therefore replaced the proxy with a liquid-option price generated by the same Heston model used for the stock and variance states.

The expression at the top represents the risk-neutral value of the hedge option, conditional on the current stock price and variance.

To evaluate this efficiently, we use the COS method.

Heston gives us a characteristic function for the future log stock price. COS uses that characteristic function to construct a finite cosine expansion of the option value.

The important distinction is that COS is not used to generate the stock and variance paths.

Monte Carlo generates the Heston paths. COS then takes each simulated stock-and-variance state and returns the corresponding liquid-option price and sensitivities.

We independently validated the pricing and sensitivity implementation, with the details available in backup.

Once we have those sensitivities, we can construct an analytic stock-and-option hedge.

We choose the hedge-option position to match the target option’s variance exposure. We then choose the stock position to remove the remaining stock exposure.

This gives us two different analytic strategies.

The Heston COS benchmark calculates its hedge positions using Heston-consistent sensitivities.

The Black–Scholes proxy heuristic calculates its positions using frozen-volatility Black–Scholes sensitivities.

Crucially, both strategies are evaluated using the same COS-priced liquid-option path.

The traded price process is therefore the same. Only the rule used to choose the stock and option positions is different.

## Glasson — The stock-plus-option NN beats the strongest tested analytic heuristic in all three seeds

**Delivery cue — not spoken:** Highlight only the COS benchmark, strongest heuristic, and stock-plus-option NN in the representative table. Pause briefly before the three-seed headline. Do not read every row.

The table on the left shows the representative full-information run.

The model-consistent Heston COS benchmark achieved an RMSE of approximately zero point zero one four eight.

The strongest analytic strategy in our experiments was the Black–Scholes proxy Greek heuristic evaluated on the COS option path. Its RMSE was approximately zero point zero zero nine eight seven.

The stock-plus-option neural network achieved the lowest representative RMSE, approximately zero point zero zero seven four three.

It also achieved the lowest Loss CVaR ninety-five, which measures the average seller loss in the worst five per cent of test outcomes.

For the headline comparison, we fair-centre every strategy separately. In practical terms, this removes each strategy’s average test error.

RMSE therefore compares the remaining dispersion of the hedge errors, rather than differences in their average level. The same treatment is applied to both the neural and analytic strategies.

The table on the right gives our more conservative headline result.

Across all three submitted reruns, the stock-plus-option neural network outperformed the strongest tested analytic heuristic.

The RMSE improvements were twenty point six per cent, twenty-one point eight per cent and twenty-five point five per cent.

This gives a mean RMSE improvement of twenty-two point seven per cent.

The mean improvement in Loss CVaR ninety-five was twenty-seven point one per cent.

One result worth clarifying is that the Black–Scholes proxy heuristic performed better than the Heston COS Greek benchmark.

This does not mean that Black–Scholes is a better Heston pricing model.

The COS strategy uses more model-consistent prices and instantaneous sensitivities. However, matching local sensitivities is not the same as directly minimising terminal hedging error over a discrete trading grid.

The neural strategy is trained on the terminal-error objective itself, which allows it to adapt its positions to the specific objective and hedge frequency used in the experiment.

## Glasson — Three conclusions survive the diagnostics

**Delivery cue — not spoken:** Do not add qualifications beyond the three shown. Finish after the final conclusion sentence.

Our experiments support three main conclusions.

First, under Black–Scholes, the neural strategy recovered the known finite-grid hedge. This gave us a controlled setting in which we could validate the learning framework.

Second, the original network failed to generalise because important contract information was missing from its inputs and training distribution. Once we added strike and volatility conditioning, the identified generalisation failure was repaired over the tested range.

Third, under Heston, once the liquid hedging option was priced consistently with the simulated model, the stock-plus-option neural strategy achieved lower terminal error than the strongest tested analytic Greek heuristic in every submitted seed.

These conclusions remain bounded.

They are based on three submitted seeds, a frictionless simulated market, and the information assumptions used in our experiments. We also do not claim to have derived the finite-grid optimal stock-and-option hedge.

Our conclusion is therefore not that neural networks replace correct analytic hedging theory.

It is that a constrained and carefully validated neural policy can first recover a known solution, and then adapt when the state dynamics, information set and traded instruments become more complex.

Thank you.
