sed -i "s|if (bind_user == 'True') {|if (bind_user == 'REMOVED') {|g" /www/server/panel/BTPanel/static/js/index.js
rm -rf /www/server/panel/data/bind.pl
rm -rf /www/server/panel/data/plugin.json
rm -rf /www/server/panel/data/repair.json
cd /www/server/panel/data
wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/plugin.json
wget https://cdn.jsdelivr.net/gh/ztkink/bthappy@latest/repair.json
chattr +i /www/server/panel/data/plugin.json
chattr +i /www/server/panel/data/repair.json
