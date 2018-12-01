function tombs.register_stones(recipe, name, desc, textures)
shapes = { --mesh identifier, shape
   {'_0', 'Rectangle'},
   {'_1', 'Cross'}
   }

for i in ipairs (shapes) do
   local mesh = shapes[i][1]
   local shape = shapes[i][2]

   minetest.register_node('tombs:'..name..mesh..'_0', {
      description = desc..' Grave Marker('..shape..')',
      drawtype = 'mesh',
      mesh = 'tombs'..mesh..'_0.obj',
      tiles = {textures..'.png'},
      paramtype = 'light',
      paramtype2 = 'facedir',
      selection_box = colbox_0_0,
      collision_box = colbox_0_0,
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

   minetest.register_node('tombs:'..name..mesh..'_1', {
      description = 'Offset '..desc..' Grave Marker('..shape..')',
      drawtype = 'mesh',
      mesh = 'tombs'..mesh..'_1.obj',
      tiles = {textures..'.png'},
      paramtype = 'light',
      paramtype2 = 'facedir',
      selection_box = colbox_0_1,
      collision_box = colbox_0_1,
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
end


tombs.register_stones('default:cobble', 'cobble', 'Cobble', 'default_cobble') --recipe, name, desc, texture
tombs.register_stones('default:stone', 'stone', 'Stone', 'default_stone')
tombs.register_stones('default:gold_ingot', 'gold', 'Gold', 'default_gold_block')
tombs.register_stones('default:acacia_wood', 'acacia', 'Acacia', 'default_acacia_wood')

function tombs.crafting(input, var)
   local mod, name = input:match("([^:]+):([^:]+)")
   if input == '' then
      output = {}
      return output
   elseif string.find(name, '_') then
      local name, junk = name:match('([^_]+)_([^_]+)')
      print ('this is name: '..input)
      output = {'tombs:'..name..'_0_'..var, 'tombs:'..name..'_1_'..var}
      return output
   end
   output = {'tombs:'..name..'_0_'..var, 'tombs:'..name..'_1_'..var}
   return output
end
