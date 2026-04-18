local item_definitions = require("definitions.items")

local prototype_fields = {
  "icon",
  "icon_size",
  "hidden",
  "subgroup",
  "order",
  "place_result",
  "stack_size"
}

local item_prototypes = {}

for _, item in ipairs(item_definitions) do
  local prototype = {
    type = "item",
    name = item.name
  }

  for _, field in ipairs(prototype_fields) do
    if item[field] ~= nil then
      prototype[field] = item[field]
    end
  end

  table.insert(item_prototypes, prototype)
end

data:extend(item_prototypes)
