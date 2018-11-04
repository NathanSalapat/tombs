local center = '0'

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
      meta:set_string('formspec', machine_formspec)
      local inv = meta:get_inventory()
      inv:set_size('tool', 1)
      inv:set_size('input', 1)
      inv:set_size('output', 1)
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      if fields['offset'] == 'true' then --mesh should be offset version
         center = '1'
      elseif fields['offset'] == 'false' then
         center = '0'
      end
      if fields['0'] then
         local input = inv:get_stack('input', 1)
         local tool = inv:get_stack('tool', 1)
         if tool:get_name() == 'bones:bones' then
            if input:get_name() == 'default:cobble' then
               inv:add_item('output', 'tombs:cobble_0_'..center)
            elseif input:get_name() == 'default:stone' then
               inv:add_item('output', 'tombs:stone_0_'..center)
            else
               return
            end
                  input:take_item(1)
                  inv:set_stack('input',1,input)
                  tool:take_item(1)
                  inv:set_stack('tool',1,tool)
         end
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
})
