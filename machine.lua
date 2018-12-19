minetest.register_craft({
   output = 'tombs:machine',
   recipe = {
      {'default:stone', 'default:stone', 'default:stone'},
      {'default:steel_ingot', 'default:diamond', 'default:steel_ingot'},
      {'default:stone', 'default:stone', 'default:stone'}
   }
})

minetest.register_node('tombs:machine', {
   description = 'Gravestone Engraver',
   tiles = {
      'tombs_machine_side.png',
      'tombs_machine_side.png',
      'tombs_machine_side.png',
      'tombs_machine_side.png',
      'tombs_machine_side.png',
      'tombs_machine_front.png',
   },
   groups = {oddly_breakable_by_hand=3},
   paramtype2 = 'facedir',
   on_construct = function(pos)
      local meta = minetest.get_meta(pos)
      meta:set_string('infotext', 'Gravestone Creator')
      meta:set_string('formspec', machine_formspec_centered)
      meta:set_string('var', 0)
      local inv = meta:get_inventory()
      inv:set_size('tool', 1)
      inv:set_size('input', 1)
      inv:set_size('output', 15)
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      local input_stack = inv:get_stack('input', 1)
      local input = input_stack:get_name()
      if fields ['offset'] then
         meta:set_string('formspec', machine_formspec_offset)
         meta:set_string('var', 1)
         tombs.populate_output(pos)
      elseif fields ['centered'] then
         meta:set_string('formspec', machine_formspec_centered)
         meta:set_string('var', 0)
         tombs.populate_output(pos)
      end
   end,
   can_dig = function(pos)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      if inv:is_empty('tool') and
      inv:is_empty('input') and
      inv:is_empty('output') then
         return true
      else
         return false
      end
   end,
   allow_metadata_inventory_put = function(pos, listname, index, stack, player)
      if listname == 'input' then
         local input = stack:get_name()
         if not tombs.nodes[input] then
            return 0
         else
            return 99
         end
      end
      if listname == 'tool' then
         if stack:get_name() == ('bones:bones') then
            return 99
         else
            return 0
         end
      end
      if listname == 'output' then
         return 0
      end
   end,
   on_metadata_inventory_put = function(pos)
      tombs.populate_output(pos)
   end,
   on_metadata_inventory_take = function(pos, listname, index, stack, player)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      local input_stack = inv:get_stack('input', 1)
      local tool_stack = inv:get_stack('tool', 1)
      local input = input_stack:get_name()
      local var = meta:get_string('var')
      if listname == 'input' then
         inv:set_list('output', {})
      elseif listname == 'tool' then
         inv:set_list('output', {})
      elseif listname == 'output' then
         input_stack:take_item(1)
         tool_stack:take_item(1)
         inv:set_stack('tool',1,tool_stack)
         inv:set_stack('input',1,input_stack)
         if inv:is_empty('input') then
            inv:set_list('output', {})
         elseif inv:is_empty('tool') then
            inv:set_list('output', {})
         else
         tombs.populate_output(pos)
         end
      end
   end,
})

function tombs.populate_output(pos)
   local meta = minetest.get_meta(pos)
   local inv = meta:get_inventory()
   local input_stack = inv:get_stack('input', 1)
   local tool_stack = inv:get_stack('tool', 1)
   local input = input_stack:get_name()
   local var = meta:get_string('var')
   if tombs.nodes[input] and tool_stack:get_name() == ('bones:bones') then
      inv:set_list('output', tombs.crafting(input, var))
   else
      inv:set_list('output', {})
   end
end
