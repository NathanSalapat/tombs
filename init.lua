tombs = {}
tombs.nodes = {}
tombs.recipes = {}
--break the file up to make it easier to maintain.
dofile(minetest.get_modpath('tombs')..'/machine.lua')
dofile(minetest.get_modpath('tombs')..'/collision_boxes.lua')
dofile(minetest.get_modpath('tombs')..'/gravestones.lua')
dofile(minetest.get_modpath('tombs')..'/formspec.lua')

--support for other mods
if minetest.get_modpath('default') and (minetest.settings:get_bool('tombs.load_default')) then
   dofile(minetest.get_modpath('tombs')..'/default.lua')
end

if minetest.get_modpath('wool') and (minetest.settings:get_bool('tombs.load_wool')) then
   dofile(minetest.get_modpath('tombs')..'/wool.lua')
end
