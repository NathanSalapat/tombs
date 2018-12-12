local dyes = {
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

for i = 1, #dyes do
	local name, desc = unpack(dyes[i])
   tombs.register_stones('wool:'..name, name, desc, 'wool_'..name)
end
