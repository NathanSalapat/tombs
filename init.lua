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
   print 'Tombs loaded bakedclay support.'
end

if minetest.get_modpath('caverealms') and (minetest.settings:get_bool('tombs.load_caverealms')) then
   dofile(minetest.get_modpath('tombs')..'/caverealms.lua')
   print 'Tombs loaded caverealms support.'
end

if minetest.get_modpath('darkage') and (minetest.settings:get_bool('tombs.load_darkage')) then
   dofile(minetest.get_modpath('tombs')..'/darkage.lua')
   print 'Tombs loaded darkage support.'
end

if minetest.get_modpath('default') and (minetest.settings:get_bool('tombs.load_default')) then
   dofile(minetest.get_modpath('tombs')..'/default.lua')
   print 'Tombs loaded default support.'
end

if minetest.get_modpath('ethereal') and (minetest.settings:get_bool('tombs.load_ethereal')) then
   dofile(minetest.get_modpath('tombs')..'/ethereal.lua')
   print 'Tombs loaded ethereal support.'
end

if minetest.get_modpath('geominer') and (minetest.settings:get_bool('tombs.load_geominer')) then
   dofile(minetest.get_modpath('tombs')..'/geominer.lua')
   print 'Tombs loaded geominer support.'
end

if minetest.get_modpath('maple') and (minetest.settings:get_bool('tombs.load_maple')) then
   dofile(minetest.get_modpath('tombs')..'/maple.lua')
   print 'Tombs loaded maple support.'
end

if minetest.get_modpath('moreores') and (minetest.settings:get_bool('tombs.load_moreores')) then
   dofile(minetest.get_modpath('tombs')..'/moreores.lua')
   print 'Tombs loaded moreores support.'
end

if minetest.get_modpath('moretrees') and (minetest.settings:get_bool('tombs.load_moretrees')) then
   dofile(minetest.get_modpath('tombs')..'/moretrees.lua')
   print 'Tombs loaded moretrees support.'
end

if minetest.get_modpath('wool') and (minetest.settings:get_bool('tombs.load_wool')) then
   dofile(minetest.get_modpath('tombs')..'/wool.lua')
   print 'loaded wool support.'
end
