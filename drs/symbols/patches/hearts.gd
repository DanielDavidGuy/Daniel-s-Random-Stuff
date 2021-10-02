extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "hearts"

func patch_groups(groups):
	groups.push_back("redsuits")
	groups.push_back("acelikes")
	return groups