tombs = {}
tombs.nodes = {}
tombs.recipes = {}
--break the file up to make it easier to maintain.
dofile(minetest.get_modpath('tombs')..'/machine.lua')
dofile(minetest.get_modpath('tombs')..'/collision_boxes.lua')
dofile(minetest.get_modpath('tombs')..'/gravestones.lua')
dofile(minetest.get_modpath('tombs')..'/formspec.lua')
dofile(minetest.get_modpath('tombs')..'/chisel.lua')

--support for other mods
if minetest.get_modpath('bakedclay') and (minetest.settings:get_bool('tombs.load_bakedclay')) then
   dofile(minetest.get_modpath('tombs')..'/bakedclay.lua')
   minetest.log('action', 'Tombs loaded support for bakedclay.')
end

if minetest.get_modpath('caverealms') and (minetest.settings:get_bool('tombs.load_caverealms')) then
   dofile(minetest.get_modpath('tombs')..'/caverealms.lua')
   minetest.log('action', 'Tombs loaded support for caverealms.')
end

if minetest.get_modpath('darkage') and (minetest.settings:get_bool('tombs.load_darkage')) then
   dofile(minetest.get_modpath('tombs')..'/darkage.lua')
   minetest.log('action', 'Tombs loaded support for darkage.')
end

if minetest.get_modpath('default') and (minetest.settings:get_bool('tombs.load_default')) then
   dofile(minetest.get_modpath('tombs')..'/default.lua')
   minetest.log('action', 'Tombs loaded support for default.')
end

if minetest.get_modpath('ethereal') and (minetest.settings:get_bool('tombs.load_ethereal')) then
   dofile(minetest.get_modpath('tombs')..'/ethereal.lua')
   minetest.log('action', 'Tombs loaded support for ethereal.')
end

if minetest.get_modpath('geominer') and (minetest.settings:get_bool('tombs.load_geominer')) then
   dofile(minetest.get_modpath('tombs')..'/geominer.lua')
   minetest.log('action', 'Tombs loaded support for geominer.')
end

if minetest.get_modpath('maple') and (minetest.settings:get_bool('tombs.load_maple')) then
   dofile(minetest.get_modpath('tombs')..'/maple.lua')
   minetest.log('action', 'Tombs loaded support for maple.')
end

if minetest.get_modpath('moreores') and (minetest.settings:get_bool('tombs.load_moreores')) then
   dofile(minetest.get_modpath('tombs')..'/moreores.lua')
   minetest.log('action', 'Tombs loaded support for moreores.')
end

if minetest.get_modpath('moretrees') and (minetest.settings:get_bool('tombs.load_moretrees')) then
   dofile(minetest.get_modpath('tombs')..'/moretrees.lua')
   minetest.log('action', 'Tombs loaded support for moretrees.')
end

if minetest.get_modpath('wool') and (minetest.settings:get_bool('tombs.load_wool')) then
   dofile(minetest.get_modpath('tombs')..'/wool.lua')
   minetest.log('action', 'Tombs loaded support for wool.')
end
