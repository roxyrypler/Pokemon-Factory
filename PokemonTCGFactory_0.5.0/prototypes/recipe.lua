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
      enabled = "false",
      ingredients = 
      {
        {"Ink", 1},
        {"Paper", 1}
      },
      result = "Pokemon-Card"
  },
  {
      type = "recipe",
      name = "Pokemon-Booster-Pack",
      enabled = "false",
      ingredients = 
      {
        {"Pokemon-Card", 10},
      },
      result = "Pokemon-Booster-Pack"
  },
  {
      type = "recipe",
      name = "Pokemon-Booster-Box",
      enabled = "false",
      ingredients = 
      {
        {"Pokemon-Booster-Pack", 36},
      },
      result = "Pokemon-Booster-Box"
  }
})