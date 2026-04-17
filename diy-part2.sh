#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
sed -i 's/OpenWrt/NW874-360T7/g' package/base-files/files/bin/config_generate

# 添加 Coremark 开机自启
cat > package/base-files/files/etc/init.d/coremark << 'EOF'
#!/bin/sh /etc/rc.common
START=99
start() {
    if [ ! -f /etc/bench.log ]; then
        /etc/coremark.sh > /etc/bench.log 2>&1 &
    fi
}
EOF

chmod +x package/base-files/files/etc/init.d/coremark

cat > package/base-files/files/etc/coremark.sh << 'EOF'
#!/bin/sh
coremark > /tmp/bench.log
sleep 1
cat /tmp/bench.log >> /etc/bench.log
EOF

chmod +x package/base-files/files/etc/coremark.sh
