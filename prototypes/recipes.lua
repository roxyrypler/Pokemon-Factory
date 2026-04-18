data:extend({
  {
    type = "recipe",
    name = "pokemon-card",
    enabled = true,
    ingredients = {
      { type = "item", name = "wood", amount = 1 }
    },
    results = {
      { type = "item", name = "pokemon-card", amount = 1 }
    },
    subgroup = "pokemon-cards",
    order = "a[pokemon-card]"
  },
  {
    type = "recipe",
    name = "shipping-box",
    enabled = true,
    ingredients = {
      { type = "item", name = "wood", amount = 4 }
    },
    results = {
      { type = "item", name = "shipping-box", amount = 1 }
    },
    subgroup = "pokemon-logistics",
    order = "a[shipping-box]"
  }
})
