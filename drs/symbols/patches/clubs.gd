extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "clubs"

func patch_groups(groups):
	groups.push_back("blacksuits")
	groups.push_back("acelikes")
	return groups