extends Reference

const mod_name : String = "drs"

var added = [
	"wood", "woodpecker", "stick", "tree", "fire", "fruit_tree", "lumberjack", "campfire",
	"snow", "ice_block", "puddle", "snow_globe", "snowman", "penguin", "iceberg", "frosty",
	"hat", "magic_hat", "easter_egg", "scarecrow", "rocket_ship", "everyman", "bag_of_chips",
	"eagle", "angler_fish", "soil", "earth", "avatar", "flag", "landmine", "lawyer", "locksmith",
	"trash_can", "recycle_bin", "pawn", "knight", "rook", "bishop", "king", "queen",
	"jack", "card_king", "card_queen", "ace"
]

var regrouped = [
	["scarebirds", [
		"magpie", "crow"
	]],
	["key", [
		"key", "magic_key"
	]],
	["redsuits", [
		"hearts", "diamonds"
	]],
	["blacksuits", [
		"clubs", "spades"
	]],
	["acelikes", [
		"hearts", "diamonds", "spades", "clubs", "joker"
	]],
	["trash", [
		"shiny_pebble", "key", "banana_peel", "egg", "pearl", "candy", "beer", "seed", "coin"
	]],
	["earthbend", [
		"shiny_pebble"
	]],
	["waterbend", [
		"rain"
	]]
]

var updated = [
	"dog", "rabbit", "hooligan", "sun", "joker"
]

func load(modloader: Reference, mod_info, tree: SceneTree):
	for i in added:
		modloader.add_mod_symbol("res://" + mod_name + "/symbols/drs_" + i + ".gd")
	for i in regrouped:
		for j in i[1]:
			modloader.add_symbol_patch("res://" + mod_name + "/symbols/patches/Group.gd", {"id": j, "group": i[0]})
	for i in updated:
		modloader.add_symbol_patch("res://" + mod_name + "/symbols/patches/" + i + ".gd")