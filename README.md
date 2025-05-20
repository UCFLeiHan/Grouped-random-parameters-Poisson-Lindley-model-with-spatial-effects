# Grouped Random Parameters Poisson-Lindley Model with Spatial Effects

This repository implements the econometric models presented in:

> **Wang, C., Abdel-Aty, M., & Han, L. (2025).**
> *Grouped random parameters Poisson-Lindley model with spatial effects addressing crashes at intersections: Insights from visual environment features and spatiotemporal instability.*
> Analytic Methods in Accident Research, **100387**. [https://doi.org/10.1016/j.amar.2025.100387](https://doi.org/10.1016/j.amar.2025.100387)

---

## Overview

These WinBUGS scripts fit the following count-data models (more in Codes):

* **Grouped RPP-Lindley with spatial effects** (primary specification in the AMAR paper)
* **Grouped RPP-Lindley** (no spatial effects)
* **Grouped RPNB-Lindley** (Poisson-Gamma as a reference “NB” specification)

While designed for crash counts at intersections, these routines can be applied to any nonnegative count outcome (e.g., hospital admissions, incident tallies).

---

## Key Features

* **Macro- and micro-level spatial effects** via conditional autoregressive (CAR) priors
* **Random parameter (RP) grouping** to capture unobserved heterogeneity
* **Lindley mixing distribution** for over-dispersion beyond Poisson

> **Note:** The “NB” (negative binomial) implementations here use a Poisson–Gamma mixing representation to ensure direct comparability with Poisson-based specifications. See Geedipally et al. (2014) for guidance on DIC usage in crash models.

---

## Citation

If you use these scripts or adapt them in any form, please cite:

> Wang, C., Abdel-Aty, M., & Han, L. (2025). Grouped random parameters Poisson-Lindley model with spatial effects addressing crashes at intersections: Insights from visual environment features and spatiotemporal instability. *Analytic Methods in Accident Research*, **100387**. [https://doi.org/10.1016/j.amar.2025.100387](https://doi.org/10.1016/j.amar.2025.100387)

---

## Related Resources

* **Poisson–Gamma (NB) Lindley codebase** by Amir Pooyan:
  [https://github.com/Econometrics-in-r/Negative-Binomial-Lindley-Model-for-Excess-Zero-Data](https://github.com/Econometrics-in-r/Negative-Binomial-Lindley-Model-for-Excess-Zero-Data)
* **Model selection caution**:
  Geedipally, S. R., Lord, D., & Dhavala, S. S. (2014). A caution about using deviance information criterion while modeling traffic crashes. *Safety Science*, 62, 495–498.

---
