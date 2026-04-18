local MONEY_FRAME = "pokemon_factory_money_frame"
local MONEY_LABEL = "pokemon_factory_money_label"
local SELL_FRAME = "pokemon_factory_sell_frame"
local SELL_BUTTON = "pokemon_factory_sell_button"
local SELL_STATUS = "pokemon_factory_sell_status"

local SHIPPING_BOX = "shipping-box"
local SELL_ITEM = "pokemon-card"
local MONEY_PER_CARD = 1

local function ensure_storage()
  storage.money = storage.money or 0
end

local function get_screen_width(player)
  local resolution = player.display_resolution
  local width = 1920

  if resolution then
    width = resolution.width or resolution[1] or width
  end

  return width / (player.display_scale or 1)
end

local function set_top_center_location(player, element, width, y)
  element.location = {
    x = math.max(0, math.floor((get_screen_width(player) - width) / 2)),
    y = y
  }
end

local function position_money_hud(player)
  local frame = player.gui.screen[MONEY_FRAME]

  if frame then
    set_top_center_location(player, frame, 140, 8)
  end
end

local function update_money_hud(player)
  ensure_storage()

  local frame = player.gui.screen[MONEY_FRAME]
  if not frame then
    return
  end

  local label = frame[MONEY_LABEL]
  if label then
    label.caption = tostring(storage.money)
  end
end

local function create_money_hud(player)
  ensure_storage()

  local screen = player.gui.screen
  local frame = screen[MONEY_FRAME]

  if not frame then
    frame = screen.add({
      type = "frame",
      name = MONEY_FRAME,
      direction = "horizontal"
    })
    frame.style.width = 140
    frame.style.height = 42
    frame.style.horizontal_align = "center"
    frame.style.vertical_align = "center"
    frame.tooltip = {"gui.pokemon-factory-money-tooltip"}

    local icon = frame.add({
      type = "sprite",
      sprite = "item/pokemon-dollar"
    })
    icon.style.width = 28
    icon.style.height = 28

    local label = frame.add({
      type = "label",
      name = MONEY_LABEL,
      caption = tostring(storage.money)
    })
    label.style.font = "default-bold"
  end

  update_money_hud(player)
  position_money_hud(player)
end

local function update_all_money_huds()
  for _, player in pairs(game.players) do
    if player.valid then
      create_money_hud(player)
      update_money_hud(player)
    end
  end
end

local function destroy_sell_menu(player)
  local frame = player.gui.screen[SELL_FRAME]

  if frame then
    frame.destroy()
  end
end

local function position_sell_menu(player)
  local frame = player.gui.screen[SELL_FRAME]

  if frame then
    set_top_center_location(player, frame, 260, 56)
  end
end

local function create_sell_menu(player)
  destroy_sell_menu(player)

  local frame = player.gui.screen.add({
    type = "frame",
    name = SELL_FRAME,
    caption = {"gui.pokemon-factory-shipping"},
    direction = "vertical"
  })
  frame.style.width = 260

  local row = frame.add({
    type = "flow",
    direction = "horizontal"
  })
  row.style.vertical_align = "center"

  local card_icon = row.add({
    type = "sprite",
    sprite = "item/pokemon-card"
  })
  card_icon.style.width = 28
  card_icon.style.height = 28

  row.add({
    type = "label",
    caption = {"gui.pokemon-factory-sell-one-card"}
  })

  frame.add({
    type = "button",
    name = SELL_BUTTON,
    caption = {"gui.pokemon-factory-sell"}
  })

  frame.add({
    type = "label",
    name = SELL_STATUS,
    caption = ""
  })

  position_sell_menu(player)
  frame.bring_to_front()
end

local function get_open_shipping_box(player)
  local opened = player.opened

  if opened and opened.valid and opened.object_name == "LuaEntity" and opened.name == SHIPPING_BOX then
    return opened
  end

  return nil
end

local function sell_one_card(player)
  ensure_storage()

  local box = get_open_shipping_box(player)
  if not box then
    destroy_sell_menu(player)
    return
  end

  local inventory = box.get_inventory(defines.inventory.chest)
  local status = player.gui.screen[SELL_FRAME] and player.gui.screen[SELL_FRAME][SELL_STATUS]

  if not inventory or inventory.get_item_count(SELL_ITEM) < 1 then
    if status then
      status.caption = {"gui.pokemon-factory-no-card"}
    end
    return
  end

  inventory.remove({
    name = SELL_ITEM,
    count = 1
  })

  storage.money = storage.money + MONEY_PER_CARD
  update_all_money_huds()

  if status then
    status.caption = {"gui.pokemon-factory-sold-card"}
  end
end

script.on_init(function()
  ensure_storage()
  update_all_money_huds()
end)

script.on_configuration_changed(function()
  ensure_storage()
  update_all_money_huds()
end)

script.on_event(defines.events.on_player_created, function(event)
  local player = game.get_player(event.player_index)

  if player then
    create_money_hud(player)
  end
end)

script.on_event(defines.events.on_player_joined_game, function(event)
  local player = game.get_player(event.player_index)

  if player then
    create_money_hud(player)
  end
end)

script.on_event(defines.events.on_gui_opened, function(event)
  local player = game.get_player(event.player_index)

  if not player then
    return
  end

  if event.entity and event.entity.valid and event.entity.name == SHIPPING_BOX then
    create_sell_menu(player)
  else
    destroy_sell_menu(player)
  end
end)

script.on_event(defines.events.on_gui_closed, function(event)
  local player = game.get_player(event.player_index)

  if player then
    destroy_sell_menu(player)
  end
end)

script.on_event(defines.events.on_gui_click, function(event)
  if not event.element.valid or event.element.name ~= SELL_BUTTON then
    return
  end

  local player = game.get_player(event.player_index)

  if player then
    sell_one_card(player)
  end
end)

if defines.events.on_player_display_resolution_changed then
  script.on_event(defines.events.on_player_display_resolution_changed, function(event)
    local player = game.get_player(event.player_index)

    if player then
      position_money_hud(player)
      position_sell_menu(player)
    end
  end)
end

if defines.events.on_player_display_scale_changed then
  script.on_event(defines.events.on_player_display_scale_changed, function(event)
    local player = game.get_player(event.player_index)

    if player then
      position_money_hud(player)
      position_sell_menu(player)
    end
  end)
end
