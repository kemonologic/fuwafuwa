/// @func fuwa_clean_autodestroy
/// @desc {void} To be run by timer controller.

var _instanceMap = global._fuwa_instanceMap;
var _instanceList = global._fuwa_instanceList;

// Prune list of destroyed instances backwards to avoid skipping as we are deleting in-place
for (var i = ds_list_size(_instanceList) - 1; i >= 0; i--){
	var _instanceNode = _instanceList[| i];
	
	if (_instanceNode[? "NUM_AUTODESTROY"] == 0){
		continue;
	}
	
	var _instanceID = _instanceNode[? "INSTANCE"];
	
	if (!instance_exists(_instanceID)){ // If instance is gone...
		if (_instanceNode[? "NUM_AUTODESTROY"] == ds_list_size(_timerList)){
			ds_map_destroy(_instanceNode); // Prune branch and timers underneath
			ds_map_delete(_instanceMap,_instanceID); // Remove map entry
			ds_list_delete(_instanceList,i);
		}
		else{
			var _timerList = _instanceNode[? "TIMER_LIST"];
			for (var j = ds_list_size(_timerList) - 1; j >= 0; j--){
				var _timer = _timerList[| j];
				if (_timer[? "AUTODESTROY"]){
					ds_list_delete(_timerList,j);
					ds_map_destroy(_timer);
				}
			}
		}
	}
}
