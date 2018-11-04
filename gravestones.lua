--[[
minetest.register_node('tombs:cobble_0_0', {
   description = material..' grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_0.obj',
   tiles = texture_image,
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = col_box_0_0,
   collision_box = col_box_0_0,
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})

minetest.register_node('tombs:cobble_0_1', {
   description = 'offset '..material..'' grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_0.obj',
   tiles = texture_image,
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = col_box_0_1,
   collision_box = col_box_0_1,
   groups = {cracky=2, oddly_breakable_by_hand=1,},

})
--]]

minetest.register_node('tombs:cobble_0_0', {
   description = 'cobblestone grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_0.obj',
   tiles = {'default_cobble.png'},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = colbox_0_0,
	collision_box = colbox_0_0,
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})

minetest.register_node('tombs:cobble_0_1', {
   description = 'offset cobblestone grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_1.obj',
   tiles = {'default_cobble.png'},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = colbox_0_1,
   collision_box = colbox_0_1,
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})

minetest.register_node('tombs:stone_0_0', {
   description = 'stone grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_0.obj',
   tiles = {'default_stone.png'},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = colbox_0_0,
	collision_box = colbox_0_0,
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})

minetest.register_node('tombs:stone_0_1', {
   description = 'offset stone grave marker',
   drawtype = 'mesh',
   mesh = 'tombs_0_1.obj',
   tiles = {'default_stone.png'},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = colbox_0_1,
   collision_box = colbox_0_1,
   groups = {cracky=2, oddly_breakable_by_hand=1,},
})
