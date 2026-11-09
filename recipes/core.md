# CORE

Canonical formulation for the Open Source Cookies reference cookie.
Total dough mass normalized to 100%.

## LOD0 — Formulation

| Ingredient | % |
|------------|--:|
| Flour (all-purpose) | 18% |
| Brown sugar | 11% |
| White sugar | 3.5% |
| Chocolate, milk | 20% |
| Chocolate, dark | 20% |
| Baking soda | 0.5% |
| Salt | 0.5% |
| Eggs | 13% |
| Brown butter | 13% |
| Vanilla essence | 0.5% |
| **Total** | **100%** |

Percentages sum to 100%, so any batch size scales directly:

```
ingredient_g = total_dough_g × pct / 100
```

Example, 1060 g batch (the b1 scale):

| Ingredient | % | g |
|------------|--:|--:|
| Flour | 18 | 190.8 |
| Brown sugar | 11 | 116.6 |
| White sugar | 3.5 | 37.1 |
| Chocolate, milk | 20 | 212.0 |
| Chocolate, dark | 20 | 212.0 |
| Baking soda | 0.5 | 5.3 |
| Salt | 0.5 | 5.3 |
| Eggs | 13 | 137.8 |
| Brown butter | 13 | 137.8 |
| Vanilla | 0.5 | 5.3 |
| **Total** | **100** | **1060.0** |

Yields 13 cookies at 80 g raw (≈ 70 g baked).

## LOD3 — Process (as executed in b1)

1. Brown the butter, cool to soft.
2. Mix dry ingredients separately from wet.
3. Hand-mix wet into dry until homogeneous.
4. Fold in chopped chocolate.
5. Rest dough **24 h refrigerated**.
6. Portion 80 g, bake.

Reference bake: **~27 min** for fixed 80 g portions. If the first batch is too soft,
the oven is too low — see the thermal notes in the batch record.

## Ingredient tiers

- **Tier 1 (document):** flour, chocolate, butter, eggs — they move the result.
- **Tier 2 (document if practical):** brown sugar, vanilla, salt type.
- **Tier 3 (optional):** baking soda, white sugar — usually minor.

Chocolate is a versioned external dependency: no open chocolate exists yet, so record
brand, product, ingredient order, cocoa % and date. If the supplier changes it, cut a
new dependency version instead of pretending nothing happened. See
[the chocolate problem](../README.md#the-chocolate-problem).

## Replication guidance

Exact brand matching is optional. Percentage fidelity carries most of the result —
approximate adherence should reproduce ~95% of intended behavior. Deeper LOD
documentation is there for whoever wants the rest.
