data:extend({
    {
        type = "technology",
        name = "Pokemon-Factory",
        icon = "__PokemonTCGFactory__/graphics/icons/PokemonCard.png",
        icon_size = 64,
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "Paper"
          },
          {
            type = "unlock-recipe",
            recipe = "Ink"
          },
          {
            type = "unlock-recipe",
            recipe = "Pokemon-Card"
          },
          {
            type = "unlock-recipe",
            recipe = "Pokemon-Booster-Pack"
          },
          {
            type = "unlock-recipe",
            recipe = "Pokemon-Booster-Box"
          },
          {
            type = "unlock-recipe",
            recipe = "printer"
          }
        },
        unit =
        {
          count = 10,
          ingredients =
          {
            {"automation-science-pack", 2},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
          },
          time = 10
        }
    }
})