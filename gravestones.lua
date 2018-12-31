function tombs.register_stones(recipe, name, desc, textures, light)
shapes = { --mesh identifier, shape, col
   {'_0', 'Rectangle', colbox_0_0, colbox_0_1},
   {'_1', 'Cross', colbox_1_0, colbox_1_1},
   {'_2', 'Pointed', colbox_0_0, colbox_0_1},
   {'_3', 'Short Slanted', colbox_3_0, colbox_3_1},
   {'_4', 'Short Flat', colbox_4_0, colbox_4_1},
   {'_5', 'Fancy Cross', colbox_5_0, colbox_5_1},
   {'_6', 'Staggered', colbox_6_0, colbox_6_1},
   {'_7', 'Celtic Cross', colbox_7_0, colbox_7_1},
   {'_8', 'Obelisk', colbox_8_0, colbox_8_1},
   {'_9', 'Stacked', colbox_9_0, colbox_9_0},
   {'_10', 'Rounded', colbox_0_0, colbox_0_1},
   {'_11', 'Sam', colbox_11_0, colbox_11_1},
   }

local group = {oddly_breakable_by_hand=2, not_in_creative_inventory=1}

if minetest.settings:get_bool('tombs.creative') then
   group = {oddly_breakable_by_hand=2}
end

for i in ipairs (shapes) do
   local mesh = shapes[i][1]
   local shape = shapes[i][2]
   local centered_col = shapes[i][3]
   local offset_col = shapes[i][4]

   minetest.register_node('tombs:'..string.lower(name)..mesh..'_0', {
      description = desc..' Headstone ('..shape..')',
      drawtype = 'mesh',
      mesh = 'tombs'..mesh..'_0.obj',
      tiles = {textures..'.png'},
      paramtype = 'light',
      paramtype2 = 'facedir',
      light_source = light,
      selection_box = centered_col,
      collision_box = centered_col,
      groups = group,
      on_construct = function(pos)
         local meta = minetest.get_meta(pos)
         meta:set_string('formspec', 'field[text;;${text}]')
         meta:set_string('infotext', '')
      end,
      after_place_node = function(pos, placer)
         local meta = minetest.get_meta(pos)
         meta:set_string('owner',placer:get_player_name())
      end,
      on_receive_fields = function(pos, formname, fields, sender)
         local meta = minetest.get_meta(pos)
         if sender:get_player_name() == meta:get_string('owner') then
            if not fields.text then return end
            meta:set_string('text', fields.text)
            meta:set_string('infotext', fields.text)
         end
      end,
   })

   minetest.register_node('tombs:'..string.lower(name)..mesh..'_1', {
      description = 'Offset '..desc..' Headstone ('..shape..')',
      drawtype = 'mesh',
      mesh = 'tombs'..mesh..'_1.obj',
      tiles = {textures..'.png'},
      paramtype = 'light',
      paramtype2 = 'facedir',
      light_source = light,
      selection_box = offset_col,
      collision_box = offset_col,
      groups = group,
      on_construct = function(pos)
         local meta = minetest.get_meta(pos)
         meta:set_string('formspec', 'field[text;;${text}]')
         meta:set_string('infotext', '')
      end,
      after_place_node = function(pos, placer)
         local meta = minetest.get_meta(pos)
         meta:set_string('owner',placer:get_player_name())
      end,
      on_receive_fields = function(pos, formname, fields, sender)
         local meta = minetest.get_meta(pos)
         if sender:get_player_name() == meta:get_string('owner') then
            if not fields.text then return end
            meta:set_string('text', fields.text)
            meta:set_string('infotext', fields.text)
         end
      end,
   })

end

   tombs.nodes[recipe] = true
   tombs.recipes[recipe] = string.lower(name)

end

function tombs.crafting(input, var)
   local name = tombs.recipes[input]
   output =
   {'tombs:'..name..'_0_'..var, 'tombs:'..name..'_1_'..var,  'tombs:'..name..'_2_'..var,
    'tombs:'..name..'_3_'..var, 'tombs:'..name..'_4_'..var,  'tombs:'..name..'_5_'..var,
    'tombs:'..name..'_6_'..var, 'tombs:'..name..'_7_'..var,  'tombs:'..name..'_8_'..var,
    'tombs:'..name..'_9_'..var, 'tombs:'..name..'_10_'..var, 'tombs:'..name..'_11_'..var,
    }
   return output
end
