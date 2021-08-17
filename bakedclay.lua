local bakedclay = {
   {"white",      "White"},
   {"grey",       "Grey"},
   {"black",      "Black"},
   {"red",        "Red"},
   {"yellow",     "Yellow"},
   {"green",      "Green"},
   {"cyan",       "Cyan"},
   {"blue",       "Blue"},
   {"magenta",    "Magenta"},
   {"orange",     "Orange"},
   {"violet",     "Violet"},
   {"brown",      "Brown"},
   {"pink",       "Pink"},
   {"dark_grey",  "Dark Grey"},
   {"dark_green", "Dark Green"},
}

for i = 1, #bakedclay do
   local name, desc = unpack(bakedclay[i])
   tombs.register_stones('bakedclay:'..name, 'bc'..name, desc..' Bakedclay', 'baked_clay_'..name)
end
