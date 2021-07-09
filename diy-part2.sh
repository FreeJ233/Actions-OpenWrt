#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#删除默认主题
rm -rf /openwrt/package/lean/luci-theme-argon
#添加默认主题
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
#修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

#添加passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall

#添加helloworld
#git clone https://github.com/fw876/helloworld.git package/helloworld

#修改默认Lan地址
sed -i 's/192.168.1.1/192.168.2.10/g' package/base-files/files/bin/config_generate

#修改主题名称
sed -i 's/'OpenWrt'/'U1+'/g' package/base-files/files/bin/config_generate

#修改登录密码
sed -i 's/root::0:0:99999:7:::/root:$1$xx6y.OEi$TtpqSyLy5Fz8SF8f9DRVy.:18217:0:99999:7:::/g' package/base-files/files/etc/shadow
