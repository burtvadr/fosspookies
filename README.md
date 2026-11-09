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

It is also the production standard behind a small real-world cookie business,
currently in progress — which is why batches, costs and deviations are recorded
rather than estimated.

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
<recipe-line>-recipe-v<version>
<recipe-line>-batch-v<version>-b<batch>
```

- `core-recipe-v0.1` — the recipe definition (`v0.1` = pre-1.0, still moving)
- `core-batch-v0.1-b1` — the first physical execution of that definition

Version = the recipe changed. Batch = same recipe, different execution.
Hyphens only, lowercase `v`, no underscores.

## Formulation

The reference formula lives in [recipes/core-recipe-v0.1.md](recipes/core-recipe-v0.1.md).
The first documented run lives in [recipes/core-batch-v0.1-b1.md](recipes/core-batch-v0.1-b1.md).

Documented ingredients are tiered, so nobody is forced to chase exact brands:

- **Tier 1 (critical):** flour, chocolate, butter, eggs
- **Tier 2 (relevant):** brown sugar, vanilla, salt type
- **Tier 3 (optional):** baking soda, white sugar

External ingredients (chocolate above all) are **versioned dependencies**: declare
what you used, record the label, and if the supplier reformulates, that becomes a new
dependency version. Exact reproducibility requires the declared reference or an
equivalent functional spec.

## The chocolate problem

The other ingredients are closer to commodities: flour can be specified by protein
content, butter by fat, eggs by weight. They drift slowly, and a class specification
gets you close anywhere in the world.

Chocolate is not a commodity. It is a formulated industrial product — cocoa mass,
cocoa butter, sugar, milk solids, emulsifiers, vanilla — and every maker uses a
different bean blend, roast and conching process. The label gives ingredient order
and cocoa %, not the full composition or how it behaves in dough. A brand can
reformulate without changing the product name. So "40% chocolate" specifies a
quantity, not a flavor.

That is the chocolate problem: **the same percentages, followed faithfully in Brazil
and in China, can produce different cookies** — not because the recipe failed, but
because one dependency is not specified.

What we do about it today:

- treat chocolate as a **versioned dependency** — brand, product, label, cocoa %,
  date; a reformulation is a new version, not a silent edit;
- LOD1 names the class (e.g. "65–72% couverture, no compound fat"), LOD2 pins the
  exact product;
- record deviations instead of hiding them (CDE in the b1 record).

What would actually solve it: **open chocolate** — a public specification for
composition ranges and process (fermentation, roast, conching), plus a reference
product anyone can make or buy. Even then, harvest and fermentation vary; the spec
would define acceptable ranges and tests, the way engineering standards do. That is
the long game, and it is only half a joke.

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
  [recipes/core-recipe-v0.1.md](recipes/core-recipe-v0.1.md), so editing the doc is
  all it takes to change the formula. `RECIPE=path/to/recipe.md` runs the same math on any other table.
  `bin/cookie 100 -c 30g` skips the questions; `bin/cookie --selftest` checks the math.
- **`bin/new-batch 2`** — scaffolds `recipes/core-batch-v0.1-b2.md` with the
  record sections ready to fill.
- **`bin/pending`** — lists every `_pending_` and blank left in the docs.
- **`bin/cost`** — batch cost, cost per cookie, suggested price. `bin/cost 1040` for
  13 cookies of 80 g; `--public` prints only totals. Accepts `RECIPE=` too.

## Any recipe, not only cookies

The math scales one flat table, whatever the rows are called:

```
| Ingredient | % |
|------------|--:|
```

Percentages sum to 100 and the tools do the rest. A vegan cookie (no eggs),
gummies, or a pizza dough are just different rows in a new recipe file:

```sh
RECIPE=recipes/vegan.md bin/cookie 80 -n 12   # grams
RECIPE=recipes/vegan.md bin/cost 960          # cost and price
```

New ingredient names are asked for a price once, then added to `costs.local`.

Two limits, said plainly:

- **One flat mix per batch.** Composite recipes (a whole pizza is dough + sauce +
  toppings) need nesting, which is not implemented.
- **Yield loss is per tool.** `-b` converts baked→raw with the cookie b1 ratio;
  other processes (gummy curing, bread proofing) would need their own factor.

`-c` (chocolate as percent or grams) is a cookie convenience; a recipe with no
chocolate rows ignores it.

## Clients

The core is data and a contract, not a UI. Planned native clients:

| Platform | Toolkit | Guideline | Status |
|----------|---------|-----------|--------|
| GNOME / Linux | GTK 4 | [GNOME HIG](https://developer.gnome.org/hig/) | planned |
| KDE / Linux | Qt 6 | [KDE HIG](https://develop.kde.org/hig/) | planned |
| Windows | WinUI 3 (Windows App SDK) | [Windows design](https://learn.microsoft.com/windows/apps/design/) | planned |
| Apple | SwiftUI | [Apple HIG](https://developer.apple.com/design/human-interface-guidelines/) | planned |
| Android | Jetpack Compose | [Material 3 / Android design](https://developer.android.com/design) | planned |
| Web | browser | WCAG 2.2 AA + web conventions | planned |

Each client should look and behave like a native app on its platform. Qt has no
single vendor HIG, so the KDE one is the reference.

### One core, native shells

Clients do not own recipe logic. The centralized piece is this contract, not a shared
UI toolkit:

- **input:** a recipe table (`| Ingredient | % |`) and a batch size;
- **output:** grams per ingredient, cost, price and profit — the same numbers
  `bin/cookie` and `bin/cost` print today;
- **verification:** shared fixtures (the existing `--selftest` cases) that every
  client must pass.

The shell scripts are the reference implementation. A client may call them,
reimplement the math natively, or share a core library — as long as it passes the
fixtures. Porting cost stays in the UI, where it belongs.

## Costs & profits

Prices live in `costs.local`, which is gitignored: **costs and profits are private
until someone asks for them to be public** — in person at a sale, or online. If that
ever happens, `bin/cost --public` prints a shareable summary with no per-ingredient
prices. Until then, the numbers stay on your machine.

## Prior art & credits

[pe7er/open-source-cookies](https://github.com/pe7er/open-source-cookies) — Peter
Martin, 2024, GPL-3.0 — is an earlier and simpler take on the same idea: one
shortbread recipe, a vegan variant, and an open-source license.

This project's own recipe was developed independently; the repository was found
afterwards. The credit is for the idea of applying open-source practice to a cookie
recipe. The only copied material is his recipe, vendored below under its original
license.

His recipes are included as references under GPL-3.0 (`LICENSES/GPL-3.0.txt`):
[original](recipes/pe7er-recipe.md) and [vegan](recipes/pe7er-recipe-vegan.md).
This repository's CC BY-SA 4.0 does not apply to them.

What is different here: LOD0–3 as a versioned standard, batch records with recorded
deviations, cost and profit tooling, a real business behind it, and native clients.

## License

[CC BY-SA 4.0](LICENSE) — the GPL spirit applied to documentation: use it, remix it,
sell it, keep it open. The logo/name: `Open Source Cookies™`, `© 2026 Open Source
Cookies contributors` in fine print.

Third-party works keep their own license: the pe7er recipes
([original](recipes/pe7er-recipe.md), [vegan](recipes/pe7er-recipe-vegan.md)) are
GPL-3.0 only (see `LICENSES/GPL-3.0.txt`).
