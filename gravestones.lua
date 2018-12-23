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
   }

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
      groups = {cracky=2, oddly_breakable_by_hand=1,},
      on_construct = function(pos)
         local meta = minetest.get_meta(pos)
         meta:set_string('formspec', tomb_formspec)
         meta:set_string('infotext', '')
      end,
      on_receive_fields = function(pos, formname, fields, sender)
         local meta = minetest.get_meta(pos)
         meta:set_string('infotext', fields.text)
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
      groups = {cracky=2, oddly_breakable_by_hand=1,},
      on_construct = function(pos)
         local meta = minetest.get_meta(pos)
         meta:set_string('formspec', tomb_formspec)
         meta:set_string('infotext', '')
      end,
      on_receive_fields = function(pos, formname, fields, sender)
         local meta = minetest.get_meta(pos)
         meta:set_string('infotext', fields.text)
      end,
   })

end

   tombs.nodes[recipe] = true
   tombs.recipes[recipe] = string.lower(name)

end

function tombs.crafting(input, var)
   local name = tombs.recipes[input]
   output =
   {'tombs:'..name..'_0_'..var, 'tombs:'..name..'_1_'..var, 'tombs:'..name..'_2_'..var,
    'tombs:'..name..'_3_'..var, 'tombs:'..name..'_4_'..var, 'tombs:'..name..'_5_'..var,
    'tombs:'..name..'_6_'..var, 'tombs:'..name..'_7_'..var, 'tombs:'..name..'_8_'..var,
    'tombs:'..name..'_9_'..var,
    }
   return output
end
