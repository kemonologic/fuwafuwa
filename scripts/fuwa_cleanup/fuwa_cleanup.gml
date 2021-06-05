/// @func fuwa_cleanup
/// @desc {void} Setup for fuwafuwa controller (for destroy/cleanup event)

ds_map_destroy(global._fuwa_instanceMap);
ds_list_destroy(global._fuwa_instanceList); // destroys all timers underneath, as they're all nested