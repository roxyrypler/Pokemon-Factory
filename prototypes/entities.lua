local shipping_box = table.deepcopy(data.raw.container["wooden-chest"])

shipping_box.name = "shipping-box"
shipping_box.icon = "__base__/graphics/icons/wooden-chest.png"
shipping_box.icon_size = 64
shipping_box.minable = {
  mining_time = 0.2,
  result = "shipping-box"
}
shipping_box.inventory_size = 16

data:extend({
  shipping_box
})
