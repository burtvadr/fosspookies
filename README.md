# fosspookies

**Open Source Cookies** — open, reproducible cookie recipes and food standards.

> Open Source Cookies é uma iniciativa aberta dedicada ao estudo e à documentação
> da produção destes cookies. Buscamos compartilhar livremente receitas, métodos,
> custos, ingredientes e descobertas para tornar esse conhecimento mais acessível,
> transparente e reproduzível.

The goal is a **reference cookie** anyone in the world can reproduce by following a
documented formulation — free to make, free to sell, free to market as open/free.
Part of the *Alimentos Abertos* (open food) idea: study food and its production, and
publish that study so it is freely and identically reproducible, commercial or not.

## Levels of Detail (LOD)

A recipe is published at several depths. Pick the level you care about; deeper levels
are optional.

| Level | What you get | What it takes |
|-------|--------------|---------------|
| **LOD0** | Percentages only. "Make the cookie." | A scale |
| **LOD1** | Ingredient classes (e.g. "65–72% couverture, no compound fat") | Reading labels |
| **LOD2** | Reference implementation: exact brands, products, lots used | Same products |
| **LOD3** | Full process fidelity: temps, timings, mixing cues, tray behavior | Following the record |

Following only LOD0 should get you ~95% of the intended result. Higher LOD is for
perfectionists — down to buying chocolate bars from Brazil if you want.

## Naming

Separate **what changed** from **which run it was**:

```
<recipe-line>-v<version>-b<batch>
```

- `core-batch-v0.1` — the recipe definition (`v0.1` = pre-1.0, still moving)
- `core-batch-v0.1-b1` — the first physical execution of that definition

Version = the recipe changed. Batch = same recipe, different execution.
Hyphens only, lowercase `v`, no underscores.

## Formulation

The reference formula lives in [recipes/core.md](recipes/core.md).
The first documented run lives in [recipes/core-batch-v0.1-b1.md](recipes/core-batch-v0.1-b1.md).

Documented ingredients are tiered, so nobody is forced to chase exact brands:

- **Tier 1 (critical):** flour, chocolate, butter, eggs
- **Tier 2 (relevant):** brown sugar, vanilla, salt type
- **Tier 3 (optional):** baking soda, white sugar

External ingredients (chocolate above all) are **versioned dependencies**: declare
what you used, record the label, and if the supplier reformulates, that becomes a new
dependency version. Exact reproducibility requires the declared reference or an
equivalent functional spec.

## Honesty rule

> Transparency about uncertainty is more valuable than fabricated precision.

If a number is unknown, write a range or mark it unknown. Deviations get reported,
not quietly corrected — see the Chocolate Deviation Event in the b1 record.

## Community principle

If you improve a recipe, process, measurement technique, or reproducibility guide
derived from this project, please consider sharing it back — pull request, issue,
discussion, message, a comment in person. This is a request, not a legal requirement:
a community norm, so the collective quality of open food standards keeps rising.

Selling cookies and selling modified versions is explicitly fine.

## Assets

- `artwork/` — logo and character SVGs (spookie, cookie, crumbles, labels)
- `package/` — printable packaging labels, `portugues/` in PNG and SVG
  (`tamanhos` lists the print sheet: sizes and counts per 10-piece run);
  `english/` reserved, not started
- `references/` — icon sources used in the labels
- `descrição` — short Portuguese text for the GitHub repo description

## Tools

POSIX `sh` (tested under dash), only `awk`/`grep` needed:

- **`bin/cookie`** — interactive recipe calculator. It asks how many cookies, raw or
  baked weight, and whether chocolate is a percent or fixed grams, then prints the
  gram table. Reads percentages straight from the LOD0 table in
  [recipes/core.md](recipes/core.md), so editing the doc is all it takes to change
  the formula. `bin/cookie 100 -c 30g` skips the questions; `bin/cookie --selftest`
  checks the math.
- **`bin/new-batch 2`** — scaffolds `recipes/core-batch-v0.1-b2.md` with the
  record sections ready to fill.
- **`bin/pending`** — lists every `_pending_` and blank left in the docs.
- **`bin/cost`** — batch cost, cost per cookie, suggested price. `bin/cost 1040` for
  13 cookies of 80 g; `--public` prints only totals.

## Costs & profits

Prices live in `costs.local`, which is gitignored: **costs and profits are private
until someone asks for them to be public** — in person at a sale, or online. If that
ever happens, `bin/cost --public` prints a shareable summary with no per-ingredient
prices. Until then, the numbers stay on your machine.

## License

[CC BY-SA 4.0](LICENSE) — the GPL spirit applied to documentation: use it, remix it,
sell it, keep it open. The logo/name: `Open Source Cookies™`, `© 2026 Open Source
Cookies contributors` in fine print.
