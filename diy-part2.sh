#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改主机名
sed -i 's/OpenWrt/NW874/g' package/base-files/files/bin/config_generate
