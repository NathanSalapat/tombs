tombs = {}


minetest.register_node('tombs:machine', {
   description = 'Gravestone Engraver',
   tiles = {'tombs_machine_1.png'},
   groups = {oddly_breakable_by_hand=3},
   on_construct = function(pos)
      local meta = minetest.get_meta(pos)
      meta:set_string('infotext', 'pizza machine')
      meta:set_string('formspec', 'size[8,7.5]'..
      'list[context;tool;0,0;1,1]'..
      'label[1,0;Tool/Bones]'..
      'list[context;input;0,1;1,1]'..
      'label[1,1;Material]'..
      'list[context;output;0,2;1,1]'..
      'label[1,2;Output]'..
      'item_image_button[4,0;1,1;tombs:cobble_0_0;0;]'..
      'checkbox[6,2.5;offset;Offset Node?;]'..
      'list[current_player;main;0,3.5;8,4]')
      local inv = meta:get_inventory()
      inv:set_size('tool', 1)
      inv:set_size('input', 1)
      inv:set_size('output', 1)
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
--[[      if fields['offset'] == 'true' then --mesh should be offset version
         minetest.chat_send_all('hello world')
         return offset = '1'
      end
      if fields['offset'] == 'false' then
         minetest.chat_send_all('goodbye world')
         return offset = '0'
         --]]
      if fields['0'] then
         local itemstack = inv:get_stack('input', 1)
         local material = itemstack:get_name()
         local tool = inv:get_stack('tool', 1)
         local tool_name = tool:get_name()
         if tool_name == 'bones:bones' then
            if material == 'default:cobble' then
               inv:add_item('output', 'tombs:cobble_0_0')
            elseif material == 'default:stone' then
               inv:add_item('output', 'tombs:stone_0_0')
            else
               return
            end
                  itemstack:take_item(1)
                  inv:set_stack('input',1,itemstack)
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


minetest.register_node('tombs:cobble_0_0', {
   description = 'cobblestone grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_0.obj',
   tiles = {'default_cobble.png'},
   paramtype = 'light',
   paramtype2 = 'facedir',
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})

minetest.register_node('tombs:cobble_0_1', {
   description = 'cobblestone grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_1.obj',
   tiles = {'default_cobble.png'},
   paramtype = 'light',
   paramtype2 = 'facedir',
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})

minetest.register_node('tombs:stone_0_0', {
   description = 'stone grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_0.obj',
   tiles = {'default_stone.png'},
   paramtype = 'light',
   paramtype2 = 'facedir',
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})
