data:extend({
  {
    type = "item-group",
    name = "pokemon-tcg",
    order = "z[pokemon-tcg]",
    icon = "__PokemonTCGFactory__/graphics/icons/pokemon-card.png",
    icon_size = 64
  },
  {
    type = "item-subgroup",
    name = "pokemon-cards",
    group = "pokemon-tcg",
    order = "a[cards]"
  }
})
