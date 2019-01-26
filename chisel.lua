   minetest.register_tool('tombs:chisel', {
      description = 'Stone Chisel',
      inventory_image = 'tombs_chisel.png',
      wield_image = 'tombs_chisel.png',
})

   minetest.register_craft({
      output = 'tombs:chisel',
      recipe = {
         {'default:steel_ingot', ''},
         {'', 'default:tin_ingot'},
      }
   })
