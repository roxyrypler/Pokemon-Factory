data:extend({
  {
    type = "recipe",
    name = "Paper",
    enabled = "false",
    ingredients = 
    {
      {"wood", 2},
    },
    result = "Paper"
  },
  {
      type = "recipe",
      name = "Ink",
      enabled = "false",
      ingredients = 
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      result = "Ink"
  },
  {
      type = "recipe",
      name = "Pokemon-Card",
      enabled = true,
      ingredients = 
      {
        {"Ink", 1},
        {"Paper", 1}
      },
      results =
      {
        {name="Pokemon-Card", amount = 100},
      },
      subgroup = "cards",
      icon = "__PokemonTCGFactory__/graphics/icons/PokemonCard.png",
      icon_size = 64,
      category = "printer"
  },
  {
      type = "recipe",
      name = "Pokemon-Booster-Pack",
      enabled = true,
      ingredients = 
      {
        {"Pokemon-Card", 10},
      },
      result = "Pokemon-Booster-Pack"
  },
  {
      type = "recipe",
      name = "Pokemon-Booster-Box",
      enabled = true,
      ingredients = 
      {
        {"Pokemon-Booster-Pack", 36},
      },
      result = "Pokemon-Booster-Box"
  },
  {
    type = "recipe",
    name = "printer",
    enabled = true,
    ingredients = 
    {
      {"wood", 1},
    },
    result = "printer"
  },
  {
    type = "recipe",
    name = "printer",
    enabled = true,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1}
    },
    result = "printer"
  },
})