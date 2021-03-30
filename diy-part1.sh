#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# https://github.com/yoyooe/n1
#
# echo '删除重复多余主题'
rm -rf ./feeds/freifunk/themes
rm -rf ./package/lean/luci-theme-netgear
rm -rf ./package/lean/luci-theme-argon
rm -rf ./feeds/lean/themes/luci-theme-material

# 从feed取消wifidog源码
# sed -i 's/^#\(.*apfree-wifidog\)/\1/' feeds.conf.default

# 添加源码到feed
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# echo '修改 默认IP'
sed -i "s/192.168.1.1/192.168.5.1/g" package/base-files/files/bin/config_generate
# echo '修改 主机名'
sed -i "s/OpenWrt/ACRH17/g" package/base-files/files/bin/config_generate

# echo '添加 小猫咪'
# git clone https://github.com/vernesong/OpenClash.git ./package/diy/OpenClash
# echo '添加 Passwall'
# git clone https://github.com/xiaorouji/openwrt-passwall.git ./package/diy/passwall
# luci-app-apfree_wifidog
git clone git clone https://github.com/ai2online/luci-app-apfree_wifidog.git ./package/lean
./scripts/feeds update -i
