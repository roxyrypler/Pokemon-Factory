local shipping_box = table.deepcopy(data.raw.container["wooden-chest"])
local wood_chipper = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local wood_pulper = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
local paper_press = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local cardstock_press = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local disable_water_and_power = settings.startup["pokemon-factory-disable-water-and-power"].value

local function make_free_powered(machine)
  if disable_water_and_power then
    machine.energy_source = {
      type = "void"
    }
    machine.energy_usage = "1W"
  end
end

shipping_box.name = "shipping-box"
shipping_box.icon = "__base__/graphics/icons/wooden-chest.png"
shipping_box.icon_size = 64
shipping_box.minable = {
  mining_time = 0.2,
  result = "shipping-box"
}
shipping_box.inventory_size = 16

wood_chipper.name = "wood-chipper"
wood_chipper.icon = "__base__/graphics/icons/assembling-machine-1.png"
wood_chipper.icon_size = 64
wood_chipper.minable = {
  mining_time = 0.2,
  result = "wood-chipper"
}
wood_chipper.crafting_categories = {"pokemon-wood-chipping"}
wood_chipper.crafting_speed = 1
wood_chipper.energy_usage = "80kW"
wood_chipper.next_upgrade = nil
make_free_powered(wood_chipper)

wood_pulper.name = "wood-pulper"
wood_pulper.icon = "__base__/graphics/icons/chemical-plant.png"
wood_pulper.icon_size = 64
wood_pulper.minable = {
  mining_time = 0.2,
  result = "wood-pulper"
}
wood_pulper.crafting_categories = {"pokemon-pulping"}
wood_pulper.crafting_speed = 1
wood_pulper.energy_usage = "120kW"
wood_pulper.next_upgrade = nil
make_free_powered(wood_pulper)

paper_press.name = "paper-press"
paper_press.icon = "__base__/graphics/icons/assembling-machine-1.png"
paper_press.icon_size = 64
paper_press.minable = {
  mining_time = 0.2,
  result = "paper-press"
}
paper_press.crafting_categories = {"pokemon-paper-making"}
paper_press.crafting_speed = 0.75
paper_press.energy_usage = "100kW"
paper_press.next_upgrade = nil
make_free_powered(paper_press)

cardstock_press.name = "cardstock-press"
cardstock_press.icon = "__base__/graphics/icons/assembling-machine-1.png"
cardstock_press.icon_size = 64
cardstock_press.minable = {
  mining_time = 0.2,
  result = "cardstock-press"
}
cardstock_press.crafting_categories = {"pokemon-cardstock-pressing"}
cardstock_press.crafting_speed = 0.75
cardstock_press.energy_usage = "100kW"
cardstock_press.next_upgrade = nil
make_free_powered(cardstock_press)

data:extend({
  shipping_box,
  wood_chipper,
  wood_pulper,
  paper_press,
  cardstock_press
})
