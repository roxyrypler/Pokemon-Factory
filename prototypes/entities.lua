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

local function set_machine_art(machine, icon, entity_sprite)
  machine.icon = icon
  machine.icon_size = 64
  machine.graphics_set = {
    animation = {
      filename = entity_sprite,
      width = 128,
      height = 128,
      frame_count = 1,
      shift = {0, 0},
      scale = 0.75
    }
  }
  machine.graphics_set_flipped = nil
end

shipping_box.name = "shipping-box"
shipping_box.icon = "__Pokemon-Factory__/graphics/icons/shipping-box.png"
shipping_box.icon_size = 64
shipping_box.minable = {
  mining_time = 0.2,
  result = "shipping-box"
}
shipping_box.inventory_size = 16
shipping_box.picture = {
  filename = "__Pokemon-Factory__/graphics/entities/shipping-box.png",
  width = 96,
  height = 96,
  shift = {0, 0},
  scale = 0.5
}

wood_chipper.name = "wood-chipper"
set_machine_art(
  wood_chipper,
  "__Pokemon-Factory__/graphics/icons/wood-chipper.png",
  "__Pokemon-Factory__/graphics/entities/wood-chipper.png"
)
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
set_machine_art(
  wood_pulper,
  "__Pokemon-Factory__/graphics/icons/wood-pulper.png",
  "__Pokemon-Factory__/graphics/entities/wood-pulper.png"
)
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
set_machine_art(
  paper_press,
  "__Pokemon-Factory__/graphics/icons/paper-press.png",
  "__Pokemon-Factory__/graphics/entities/paper-press.png"
)
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
set_machine_art(
  cardstock_press,
  "__Pokemon-Factory__/graphics/icons/cardstock-press.png",
  "__Pokemon-Factory__/graphics/entities/cardstock-press.png"
)
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
