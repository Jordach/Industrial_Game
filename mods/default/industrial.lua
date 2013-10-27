--industrial.lua

--[[ Things to know:
please do not remove the multiline comments from the .lua files. these may
help the developers on how minetest.<methods> work, and may also include hints
on how large pieces of code work.

PLEASE DO NOT DELETE THEM FROM THE FILES, MERGES WITH THEM WILL BE REVERTED.

thank you.
--]]


-- Ores

--[[ Notes:
clust_scarcity is the chances of the ore to spawn, eg, as a percentage
clust num ores is the maximum number of ores possible for that cluster
clust_size is the size of an area (number is cubed) where the ore will spawn

absheight is the only flag availible for flags of the ore definition, please
do not change them, as it WILL cause a CRASH within minetest.


--]]

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_titanium",
	wherein        = "default:stone",
	clust_scarcity = 9*9*9,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -512,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -512,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_osmium",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -31000,
	height_max     = -2048,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_platinum",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 5,
	clust_size     = 4,
	height_min     = -31000,
	height_max     = -256,
	flags          = "absheight",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iridium",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -2048,
	flags          = "absheight",
})

-- Node defs;

--[[ Notes:
the ore nodes for now are terribly basic and will need a fuckton of work
the recipes for basic shit will need to be tamed as well as adding new
tools

there should be at least three types of ingot quality:
low, good, perfect, each tier having better tools, better speed:
perfect iron pick is as good as a mese pick
a low quality iron pick is a slightly more durable stone pick
a good quality iron pick is a normal minetest_game iron pick
--]]

minetest.register_node("default:stone_with_titanium", {
	description = "Titanium Ore",
	tiles = {"default_stone.png^indus_mineral_titanium.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "default:titanium_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_osmium", {
	description = "Osmium Ore",
	tiles = {"default_stone.png^indus_mineral_osmium.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "default:osmium_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_platinum", {
	description = "Platinum Ore",
	tiles = {"default_stone.png^indus_mineral_platinum.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "default:platinum_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_iridium", {
	description = "Iridium Ore",
	tiles = {"default_stone.png^indus_mineral_iridium.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "default:iridium_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^indus_mineral_diamond.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "default:iridium_lump",
	sounds = default.node_sound_stone_defaults(),
})

-- cooking and crafting

--[[ Notes:
the point of the moulds are to create higher quality ingots, eg, clay ones
produce good quality, and platinum moulds create perfect quality ingots
the better the quality, the better the tool. it's that simple.

replacements are used to retrieve the ingot mould, eg, like peeling an
egg off of a frying pan, (if it worked that way irl, you'd lose the
pan everytime you cooked an egg; which is something you wouldnt want.)

another note is that some ingots might cutting with diamonds, such as osmium
and iridium.

textures with _nck_ in their name(s) are uncooked versions, such as the clay
mould, which the cooked one is: indus_clay_mould.png and then uncooked one is
indus_NCK_clay_mould.png (the nck is in caps to highlight what i mean by
uncooked.
--]]

minetest.register_craft({
	type = "cooking",
	output = "default:clay_mould", --ingot mould
	recipe = "default:uncooked_mould", --the material is clay
})

minetest.register_craftitem("default:clay_mould", {
	description = "Cooked Clay Mould",
	inventory_image = "indus_clay_mould.png",
})

minetest.register_craftitem("default:uncooked_clay_mould", {
	description = "Uncooked Clay Mould",
	inventory_image = "indus_nck_clay_mould.png",
})