extends "res://modloader/SymbolPatcher.gd"

func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = "key"

func patch_groups(groups):
    groups.push_back("key")
    groups.push_back("trash")
    return groups