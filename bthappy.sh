sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js
rm -rf /www/server/panel/data/bind.pl
echo "去除强制登录结束"
sleep 5s
echo "5秒后开始开心"
chattr -i /www/server/panel/data/plugin.json
chattr -i /www/server/panel/data/repair.json
rm -rf /www/server/panel/data/plugin.json
rm -rf /www/server/panel/data/repair.json
cd /www/server/panel/data
wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/plugin.json
wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/repair.json
sleep 5s
echo "5秒后开始修改plugin和repair权限，禁止更改"
chattr +i /www/server/panel/data/plugin.json
chattr +i /www/server/panel/data/repair.json
