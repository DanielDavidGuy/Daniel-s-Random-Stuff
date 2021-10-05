extends "res://modloader/SymbolPatcher.gd"

var group
func init(modloader: Reference, params):
	self.modloader = modloader
	self.id = params.id
	group = params.group

func patch_groups(groups):
	groups.push_back(group)
	return groups