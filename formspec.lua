machine_formspec_centered =
'size[8,7.5]'..
'list[context;tool;0,0;1,1]'..
'label[1,0;Bones]'..
'list[context;input;0,1;1,1]'..
'label[1,1;Material]'..
'label[0,2;Click to change to offset versions.]'..
'button[0,2.5;2,1;offset;Offset]'..
'list[current_name;output;3,0;5,3]'..
'list[current_player;main;0,3.5;8,4]'

machine_formspec_offset =
'size[8,7.5]'..
'list[context;tool;0,0;1,1]'..
'label[1,0;Bones]'..
'list[context;input;0,1;1,1]'..
'label[1,1;Material]'..
'label[0,2;Click to change to centered versions.]'..
'button[0,2.5;2,1;centered;Centered]'..
'list[current_name;output;3,0;5,3]'..
'list[current_player;main;0,3.5;8,4]'

tomb_formspec =
'size[4,2]'..
'field[1,1;3,1;text;Write Something, Enter to Close;${infotext}]'
