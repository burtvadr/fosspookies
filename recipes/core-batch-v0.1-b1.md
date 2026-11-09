# core-batch-v0.1-b1

First documented execution of the CORE recipe line.

This batch establishes the initial practical reference for Open Source Cookies. Its
documentation preserves both expected process data and observed deviations,
including ingredient uncertainty and environmental variation. It is intentionally
imperfect — the historical baseline future refinements build on.

> core-batch-v0.1-b1 is the only canonical batch that can never be canonically
> reproduced.

## Status

| Field | Value |
|-------|-------|
| Date | _pending_ |
| Status | First documented batch |
| Classification | Pre-release reference |
| Reproducibility | Partial (see HCI-001) |
| Operator | _pending_ |

## Batch summary

| Field | Value |
|-------|-------|
| Total raw dough mass | 1060 g |
| Target raw cookie mass | 80 g |
| Number of cookies | 13 |
| Observed baked mass | ~70 g each _(weigh both)_ |
| Rest | 24 h refrigerated |
| Ambient | winter, cold oven despite preheat |

Formula: [core-recipe-v0.1.md](core-recipe-v0.1.md) — kept fixed.

## Process workflow

**Mixing** — hand mixed. Dry combined separately from wet, then incorporated until
homogeneous. Chopped chocolate folded in.

**Rest** — 24 h in the fridge.

**Portioning** — 80 g per cookie. _weigh each_

## Oven & surfaces

**Preheat** — preheated, but winter caught the oven cold; effective temperature well
below target (see TER-001). _record preheat duration, set temp, rack position_

**Dish A** (larger) — glass, greased with part of 1 g oil. _weight, dimensions, position_

**Dish B** (smaller, lower) — glass, greased with the rest of the 1 g oil. Bottom dish
cooked noticeably slower. _weight, dimensions, position_

**Oil** — 1 g total across both dishes. _application method, split between dishes_

## Baking results

| | Dish A | Dish B |
|---|--------|--------|
| Bake duration | _pending_ (> 36 min) | _pending_ (> 36 min) |
| Doneness | _pending_ | _pending_ |
| Raw center present | yes (some) | yes (some) |
| Spread / texture | _pending_ | _pending_ |

## TER-001 — Thermal Event Report

Winter ambient conditions significantly reduced effective oven heating despite
preheating.

- Observed bake duration: **> 36 min** for 80 g cookies (target ~27 min)
- Uneven doneness, partial raw centers
- Glass dish thermal lag significant; lower dish slower
- _record observed range per dish once weighed_

**Lesson:** winter preheat needs compensation; tray position and material strongly
affect the bake. 27 min is the fixed-size reference only when the oven is actually
at temperature.

## HCI-001 — Chocolate Deviation Event

During preparation, an indeterminate quantity of milk chocolate was removed from the
ingredient pool prior to incorporation. Cause: unauthorized paternal sampling during
the chocolate fragmentation stage.

**Reference allocation**

| | Product | Qty | Nominal mass |
|---|---------|-----|--------------|
| Dark | Neugebauer 40% | 2 × 130 g | 260 g |
| Milk | Hershey (May 2026) | 2 × 82 g | 164 g |
| **Total** | | | **424 g** |

- Observed reduction: unknown integer number of segmented units removed, estimated
  3–5 pieces
- Upper bound of certainty: less than half of one bar consumed → milk chocolate lost
  is **< 41 g**
- Non-chocolate ingredients: 636 g (= 60% of 1060 g) — intact

**Resulting chocolate composition** (of the 40% chocolate share)

| | Nominal | Actual |
|---|---------|--------|
| Dark | 61.32% | 61.32 – 70.99% |
| Milk | 38.68% | 29.01 – 38.68% |

Exact ratio unknown. Batch status: **non-deterministic** — an observational
reference, not an executable formulation.

> Transparency about uncertainty is more valuable than fabricated precision.

Deviation taxonomy for future weirdness: CDE (chocolate), MDI (mass drift), TSE
(thermal), HCI (human consumption interference), UAV (ambient variation).

## Ingredient registry

_Pending — to be documented, chocolate label details last (separate write-up)._

- Flour: brand, protein %, composition, lot _(tier 1, likely to change)_
- Brown sugar / white sugar: brand, texture, moisture _(tier 2/3)_
- Butter: brand, salted/unsalted, browning notes _(tier 1)_
- Eggs: classification, average weight _(tier 1)_
- Vanilla: type _(tier 2)_
- Chocolate A / B: label photos, declared ingredient order, cocoa % _(tier 1)_

## Physical measurements

_Raw:_ diameter _____ height _____
_Baked:_ diameter _____ height _____ mass _____ moisture loss _____

## Sensory evaluation

Edge crispness __/10 · Center chew __/10 · Sweetness __/10 · Chocolate balance __/10
Notes: _____

## Lessons learned

- Winter preheat needs compensation before the clock starts
- Tray position and material dominate bake time; glass lags
- Chocolate prep needs controlled accounting (weigh after chopping, cover the bowl)
- Bake-time heuristics ("27 min") only hold when the oven is truly at temperature

## Next batch (v0.1-b2)

- [ ] controlled chocolate accounting
- [ ] oven thermal stabilization
- [ ] tray standardization (or weigh both glass dishes)
- [ ] tighter bake-time target
- [ ] ingredient registry completion
