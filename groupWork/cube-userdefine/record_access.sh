#!/bin/sh
killall -9 envset_proc
rm -f instance/server/aspect_policy.cfg
rm -f instance/dianzhu/aspect_policy.cfg

yes|cp instance/server/plugin_config.cfg.access instance/server/plugin_config.cfg
yes|cp instance/server/sys_config.cfg.label instance/server/sys_config.cfg
yes|cp instance/server/router_policy.cfg.record instance/server/router_policy.cfg
yes|cp instance/server/aspect_policy.cfg.access instance/server/aspect_policy.cfg

yes|cp instance/dianzhu/sys_config.cfg.record instance/dianzhu/sys_config.cfg
yes|cp instance/dianzhu/router_policy.cfg.record instance/dianzhu/router_policy.cfg
sleep 1

sh run_cube.sh exec_def/_user_server.def &
sleep 1
sh run_cube.sh exec_def/_dianzhu_client.def login.msg write.msg read.msg
#sh run_cube.sh exec_def/_user_client.def login.msg
