#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改主机名
sed -i 's/OpenWrt/NW874-360T7/g' package/base-files/files/bin/config_generate

# Coremark 开机自启
cat > package/base-files/files/etc/init.d/coremark << 'EOF'
#!/bin/sh /etc/rc.common
START=99
start() {
    [ ! -f /etc/bench.log ] && /etc/coremark.sh &
}
EOF
chmod +x package/base-files/files/etc/init.d/coremark
ln -sf ../init.d/coremark package/base-files/files/etc/rc.d/S99coremark

cat > package/base-files/files/etc/coremark.sh << 'EOF'
#!/bin/sh
sleep 2
coremark > /etc/bench.log
EOF
chmod +x package/base-files/files/etc/coremark.sh
