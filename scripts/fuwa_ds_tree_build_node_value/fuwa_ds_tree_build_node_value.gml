/// @func fuwa_ds_tree_build_node_value
/// @arg {string} key1
/// @arg {real/string} value1
/// @arg {string} key2
/// @arg {real/string} value2
/// @arg [...]
// Returns node with specified key(s) and specified value(s)

var _key, _value = "";
if (argument_count % 2 != 0){
	show_debug_message("fuwa_ds_tree_build_node_value: Invalid number of arguments!");
	return -1;
}

var node = ds_map_create();
for (var i = 0; i < argument_count; i += 2) {
	_key = argument[i];
	_value = argument[i + 1];
	ds_map_add(node, _key, _value);
}
return node;
