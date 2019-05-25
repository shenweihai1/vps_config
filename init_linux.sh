cd /root/
yum install git wget zsh
echo ""

[ ! -d "vps_config" ] && git clone git@github.com:shenweihai1/vps_config.git vps_config
[ -d "vps_config" ] && cd vps_config && git pull && cd ..
echo ""

[ ! -d "sparky" ] && git clone git@github.com:shenweihai1/sparky.git sparky 
[ -d "sparky" ] && cd sparky && git pull && cd ..
echo ""

[ ! -d "everything" ] && git clone git@github.com:shenweihai1/everything.git everything 
[ -d "everything" ] && cd everything && git pull && cd ..
echo ""
cp /root/everything/vimrc /root/.vimrc

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

[ ! -d "/etc/yum.repos.d/nginx.repo" ] && echo "[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=0
enabled=1
" > /etc/yum.repos.d/nginx.repo 
yum install nginx
echo ""

cp /root/vps_config/nginx/default.conf /etc/nginx/conf.d/default.conf 
cp /root/vps_config/nginx/nginx.conf /etc/nginx/nginx.conf 
cp -r /root/vps_config/pdf /root/

nginx -t 
echo ""

SERVICE="nginx"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running, reload it"
    nginx -s reload
else
    echo "$SERVICE stopped, start it"
    nginx
fi
echo ""
