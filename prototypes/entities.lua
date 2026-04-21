local shipping_box = table.deepcopy(data.raw.container["wooden-chest"])
local wood_chipper = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local wood_pulper = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
local paper_press = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local cardstock_press = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local pigment_extractor = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local ink_maker = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local sheet_printer = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local cardstock_cutter = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
local disable_water_and_power = settings.startup["pokemon-factory-disable-water-and-power"].value
local machine_collision_box_5x5 = {{-2.2, -2.2}, {2.2, 2.2}}
local machine_selection_box_5x5 = {{-2.5, -2.5}, {2.5, 2.5}}

local function make_free_powered(machine)
  if disable_water_and_power then
    machine.energy_source = {
      type = "void"
    }
    machine.energy_usage = "1W"
  end
end

local function set_machine_art(machine, icon, entity_sprite, sprite_size, sprite_scale)
  sprite_size = sprite_size or 320
  sprite_scale = sprite_scale or 0.5

  machine.icon = icon
  machine.icon_size = 64
  machine.graphics_set = {
    animation = {
      filename = entity_sprite,
      width = sprite_size,
      height = sprite_size,
      frame_count = 1,
      shift = {0, 0},
      scale = sprite_scale
    }
  }
  machine.graphics_set_flipped = nil
end

local function set_machine_footprint_5x5(machine)
  machine.collision_box = machine_collision_box_5x5
  machine.selection_box = machine_selection_box_5x5
end

shipping_box.name = "shipping-box"
shipping_box.icon = "__Pokemon-Factory__/graphics/icons/shipping-box.png"
shipping_box.icon_size = 64
shipping_box.minable = {
  mining_time = 0.2,
  result = "shipping-box"
}
shipping_box.inventory_size = 16
shipping_box.collision_box = {{-0.35, -0.35}, {0.35, 0.35}}
shipping_box.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
shipping_box.picture = {
  filename = "__Pokemon-Factory__/graphics/entities/shipping-box.png",
  width = 320,
  height = 320,
  shift = {0, 0},
  scale = 0.1
}

wood_chipper.name = "wood-chipper"
set_machine_art(
  wood_chipper,
  "__Pokemon-Factory__/graphics/icons/wood-chipper.png",
  "__Pokemon-Factory__/graphics/entities/wood-chipper.png"
)
set_machine_footprint_5x5(wood_chipper)
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
set_machine_footprint_5x5(wood_pulper)
wood_pulper.minable = {
  mining_time = 0.2,
  result = "wood-pulper"
}
wood_pulper.crafting_categories = {"pokemon-pulping"}
wood_pulper.crafting_speed = 1
wood_pulper.energy_usage = "120kW"
wood_pulper.next_upgrade = nil
wood_pulper.fluid_boxes = {
  {
    production_type = "input",
    volume = 100,
    pipe_connections = {
      {
        flow_direction = "input",
        direction = defines.direction.north,
        position = {0, -2}
      }
    }
  }
}
make_free_powered(wood_pulper)

paper_press.name = "paper-press"
set_machine_art(
  paper_press,
  "__Pokemon-Factory__/graphics/icons/paper-press.png",
  "__Pokemon-Factory__/graphics/entities/paper-press.png"
)
set_machine_footprint_5x5(paper_press)
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
set_machine_footprint_5x5(cardstock_press)
cardstock_press.minable = {
  mining_time = 0.2,
  result = "cardstock-press"
}
cardstock_press.crafting_categories = {"pokemon-cardstock-pressing"}
cardstock_press.crafting_speed = 0.75
cardstock_press.energy_usage = "100kW"
cardstock_press.next_upgrade = nil
make_free_powered(cardstock_press)

pigment_extractor.name = "pigment-extractor"
set_machine_art(
  pigment_extractor,
  "__Pokemon-Factory__/graphics/icons/pigment-extractor.png",
  "__Pokemon-Factory__/graphics/entities/pigment-extractor.png"
)
set_machine_footprint_5x5(pigment_extractor)
pigment_extractor.minable = {
  mining_time = 0.2,
  result = "pigment-extractor"
}
pigment_extractor.crafting_categories = {"pokemon-pigment-extraction"}
pigment_extractor.crafting_speed = 0.75
pigment_extractor.energy_usage = "100kW"
pigment_extractor.next_upgrade = nil
make_free_powered(pigment_extractor)

ink_maker.name = "ink-maker"
set_machine_art(
  ink_maker,
  "__Pokemon-Factory__/graphics/icons/ink-maker.png",
  "__Pokemon-Factory__/graphics/entities/ink-maker.png"
)
set_machine_footprint_5x5(ink_maker)
ink_maker.minable = {
  mining_time = 0.2,
  result = "ink-maker"
}
ink_maker.crafting_categories = {"pokemon-ink-making"}
ink_maker.crafting_speed = 1
ink_maker.energy_usage = "80kW"
ink_maker.next_upgrade = nil
make_free_powered(ink_maker)

sheet_printer.name = "sheet-printer"
set_machine_art(
  sheet_printer,
  "__Pokemon-Factory__/graphics/icons/sheet-printer.png",
  "__Pokemon-Factory__/graphics/entities/sheet-printer.png"
)
set_machine_footprint_5x5(sheet_printer)
sheet_printer.minable = {
  mining_time = 0.2,
  result = "sheet-printer"
}
sheet_printer.crafting_categories = {"pokemon-sheet-printing"}
sheet_printer.crafting_speed = 0.75
sheet_printer.energy_usage = "120kW"
sheet_printer.next_upgrade = nil
make_free_powered(sheet_printer)

cardstock_cutter.name = "cardstock-cutter"
set_machine_art(
  cardstock_cutter,
  "__Pokemon-Factory__/graphics/icons/cardstock-manipulator.png",
  "__Pokemon-Factory__/graphics/entities/cardstock-manipulator.png"
)
set_machine_footprint_5x5(cardstock_cutter)
cardstock_cutter.minable = {
  mining_time = 0.2,
  result = "cardstock-cutter"
}
cardstock_cutter.crafting_categories = {
  "pokemon-card-cutting",
  "pokemon-card-sorting"
}
cardstock_cutter.crafting_speed = 1
cardstock_cutter.energy_usage = "100kW"
cardstock_cutter.next_upgrade = nil
make_free_powered(cardstock_cutter)

data:extend({
  shipping_box,
  wood_chipper,
  wood_pulper,
  paper_press,
  cardstock_press,
  pigment_extractor,
  ink_maker,
  sheet_printer,
  cardstock_cutter
})
