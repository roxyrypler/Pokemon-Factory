return {
  {
    name = "pokemon-dollar",
    icon = "__Pokemon-Factory__/graphics/icons/dollar-sign.png",
    icon_size = 64,
    hidden = true,
    stack_size = 1
  },
  {
    name = "pokemon-card",
    icon = "__Pokemon-Factory__/graphics/icons/pokemon-card.png",
    icon_size = 64,
    subgroup = "pokemon-cards",
    order = "a[pokemon-card]",
    stack_size = 100,
    sell_price = 1
  },
  {
    name = "shipping-box",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64,
    subgroup = "pokemon-logistics",
    order = "a[shipping-box]",
    place_result = "shipping-box",
    stack_size = 50
  }
}
