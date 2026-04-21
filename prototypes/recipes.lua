local disable_water_and_power = settings.startup["pokemon-factory-disable-water-and-power"].value

local function ingredients_without_water_when_disabled(ingredients)
  if not disable_water_and_power then
    return ingredients
  end

  local filtered_ingredients = {}

  for _, ingredient in ipairs(ingredients) do
    if ingredient.type ~= "fluid" or ingredient.name ~= "water" then
      table.insert(filtered_ingredients, ingredient)
    end
  end

  return filtered_ingredients
end

data:extend({
  {
    type = "recipe",
    name = "wood-chipper",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "wood-chipper", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "a[wood-chipper]"
  },
  {
    type = "recipe",
    name = "wood-pulper",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "wood-pulper", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "b[wood-pulper]"
  },
  {
    type = "recipe",
    name = "paper-press",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "paper-press", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "c[paper-press]"
  },
  {
    type = "recipe",
    name = "cardstock-press",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "cardstock-press", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "d[cardstock-press]"
  },
  {
    type = "recipe",
    name = "pigment-extractor",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "pigment-extractor", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "e[pigment-extractor]"
  },
  {
    type = "recipe",
    name = "ink-maker",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "ink-maker", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "f[ink-maker]"
  },
  {
    type = "recipe",
    name = "sheet-printer",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "sheet-printer", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "g[sheet-printer]"
  },
  {
    type = "recipe",
    name = "cardstock-cutter",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "cardstock-cutter", amount = 1 }
    },
    subgroup = "pokemon-machines",
    order = "h[cardstock-cutter]"
  },
  {
    type = "recipe",
    name = "wood-chips",
    category = "pokemon-wood-chipping",
    enabled = true,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "wood", amount = 1 }
    },
    results = {
      { type = "item", name = "wood-chips", amount = 4 }
    },
    subgroup = "pokemon-paper-materials",
    order = "a[wood-chips]"
  },
  {
    type = "recipe",
    name = "paper-pulp",
    category = "pokemon-pulping",
    enabled = true,
    energy_required = 2,
    ingredients = ingredients_without_water_when_disabled({
      { type = "item", name = "wood-chips", amount = 4 },
      { type = "fluid", name = "water", amount = 100 }
    }),
    results = {
      { type = "item", name = "paper-pulp", amount = 4 }
    },
    subgroup = "pokemon-paper-materials",
    order = "b[paper-pulp]"
  },
  {
    type = "recipe",
    name = "paper-roll",
    category = "pokemon-paper-making",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "paper-pulp", amount = 4 }
    },
    results = {
      { type = "item", name = "paper-roll", amount = 2 }
    },
    subgroup = "pokemon-paper-materials",
    order = "c[paper-roll]"
  },
  {
    type = "recipe",
    name = "paper-sheet",
    category = "pokemon-paper-making",
    enabled = true,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "paper-roll", amount = 1 }
    },
    results = {
      { type = "item", name = "paper-sheet", amount = 8 }
    },
    subgroup = "pokemon-paper-materials",
    order = "d[paper-sheet]"
  },
  {
    type = "recipe",
    name = "cardstock",
    category = "pokemon-cardstock-pressing",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "paper-sheet", amount = 4 }
    },
    results = {
      { type = "item", name = "cardstock", amount = 1 }
    },
    subgroup = "pokemon-paper-materials",
    order = "e[cardstock]"
  },
  {
    type = "recipe",
    name = "shipping-box",
    enabled = true,
    ingredients = {},
    results = {
      { type = "item", name = "shipping-box", amount = 1 }
    },
    subgroup = "pokemon-logistics",
    order = "a[shipping-box]"
  },
  {
    type = "recipe",
    name = "color-pigments",
    category = "pokemon-pigment-extraction",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "coal", amount = 1 },
      { type = "item", name = "iron-ore", amount = 1 },
      { type = "item", name = "copper-ore", amount = 1 },
      { type = "item", name = "stone", amount = 1 }
    },
    results = {
      { type = "item", name = "color-pigments", amount = 4 }
    },
    subgroup = "pokemon-ink-materials",
    order = "a[color-pigments]"
  },
  {
    type = "recipe",
    name = "printing-ink",
    category = "pokemon-ink-making",
    enabled = true,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "color-pigments", amount = 1 }
    },
    results = {
      { type = "item", name = "printing-ink", amount = 2 }
    },
    subgroup = "pokemon-ink-materials",
    order = "b[printing-ink]"
  },
  {
    type = "recipe",
    name = "backside-printed-cardstock",
    category = "pokemon-sheet-printing",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "cardstock", amount = 1 },
      { type = "item", name = "printing-ink", amount = 1 }
    },
    results = {
      { type = "item", name = "backside-printed-cardstock", amount = 1 }
    },
    subgroup = "pokemon-card-printing",
    order = "a[backside-printed-cardstock]"
  },
  {
    type = "recipe",
    name = "finished-printed-cardstock-sheet",
    category = "pokemon-sheet-printing",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "backside-printed-cardstock", amount = 1 },
      { type = "item", name = "printing-ink", amount = 1 }
    },
    results = {
      { type = "item", name = "finished-printed-cardstock-sheet", amount = 1 }
    },
    subgroup = "pokemon-card-printing",
    order = "b[finished-printed-cardstock-sheet]"
  },
  {
    type = "recipe",
    name = "unsorted-cards",
    category = "pokemon-card-cutting",
    enabled = true,
    energy_required = 1,
    ingredients = {
      { type = "item", name = "finished-printed-cardstock-sheet", amount = 1 }
    },
    results = {
      { type = "item", name = "unsorted-cards", amount = 10 }
    },
    subgroup = "pokemon-card-printing",
    order = "c[unsorted-cards]"
  },
  {
    type = "recipe",
    name = "sorted-card-piles",
    icon = "__Pokemon-Factory__/graphics/icons/common-card-pile.png",
    icon_size = 64,
    category = "pokemon-card-sorting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "unsorted-cards", amount = 10 }
    },
    results = {
      { type = "item", name = "common-card-pile", amount = 5 },
      { type = "item", name = "uncommon-card-pile", amount = 2 },
      { type = "item", name = "trainer-card-pile", amount = 1 },
      { type = "item", name = "energy-card-pile", amount = 1 },
      { type = "item", name = "rare-card-pile", amount = 1 }
    },
    subgroup = "pokemon-card-printing",
    order = "d[sorted-card-piles]"
  }
})
