#!/bin/bash
LANG=en_US.UTF-8

#修改强制登录开始
sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js
rm -rf /www/server/panel/data/bind.pl
#修改强制登录结束
echo -e "修改强制中..."
sleep 2
echo -e "修改强制登陆结束."

#判断plugin.json文件是否存在,存在删除之后再下载,不存在直接下载
plugin_file="/www/server/panel/data/plugin.json"
if [ -f ${plugin_file} ];then
    chattr -i /www/server/panel/data/plugin.json
    rm /www/server/panel/data/plugin.json
    cd /www/server/panel/data
    wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/plugin.json
    chattr +i /www/server/panel/data/plugin.json
else
    cd /www/server/panel/data
    wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/plugin.json
    chattr +i /www/server/panel/data/plugin.json
fi
echo -e "插件开心结束."
sleep 3

#判断repair.json文件是否存在,存在删除之后再下载,不存在直接下载
repair_file="/www/server/panel/data/repair.json"
if [ -f ${repair_file} ];then
    chattr -i /www/server/panel/data/repair.json
    rm /www/server/panel/data/repair.json
    cd /www/server/panel/data
    wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/repair.json
    chattr +i /www/server/panel/data/repair.json
else
    cd /www/server/panel/data
    wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/repair.json
    chattr +i /www/server/panel/data/repair.json
fi
echo -e "防修改结束."
sleep 3
     /etc/init.d/bt restart 	
sleep 3
    bt default
sleep 2 
echo -e "开心结束！"
