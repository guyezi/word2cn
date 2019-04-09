#!/bin/bash
Green_font="\033[32m" && Yellow_font="\033[33m" && Red_font="\033[31m" && Font_suffix="\033[0m"
Info="${Green_font}[Info]${Font_suffix}"
Error="${Red_font}[Error]${Font_suffix}"
PANEL_DIR=/www/server/panel
bt_domain=https://api.loli.host
PLUGIN_RETURN="${Yellow_font}在面板安装插件完成之后，从下表选择你要破解的插件:${Font_suffix}"
MAIN_RETURN=${Red_font}[宝塔面板v6.9.0破解脚本]${Font_suffix}
MAIN_RETURNS=${Red_font}[升级专业版，请按提示进行操作！]${Font_suffix}
MAIN_RETURNQ=${Red_font}[全自动安装，请按提示进行操作！]${Font_suffix}
MAIN_RETURNSHOWTIME=${Red_font}[全自动安装宝塔专业Nginx防火墙版]${Font_suffix}
MAIN_RETURNFHQ=${Red_font}[防火墙破解]${Font_suffix}
MAIN_RETURNFHQN=${Red_font}[Nginx防火墙破解]${Font_suffix}
MAIN_RETURNFHQA=${Red_font}[Apache防火墙破解]${Font_suffix}

# 全自动安装宝塔破解 1
gametime(){
    # 下载全自动安装脚本
	wget -O install_6.0.sh ${bt_domain}/install_6.0.sh && chmod 755 install_6.0.sh && bash install_6.0.sh
	# 删除全自动安装脚本
	rm -rf /install_6.0.sh
}

# 全自动安装宝塔破解 2
gametimes(){
    # 下载全自动安装脚本
	wget -O install_6.0_s.sh ${bt_domain}/install_6.0_s.sh && chmod 755 install_6.0_s.sh && bash install_6.0_s.sh
	# 删除全自动安装脚本
	rm -rf /install_6.0_s.sh
}

# 已经安装宝塔破解 1
startshow(){
    # 创建 btpanel_6.9.0 目录
	mkdir /root/btpanel_6.9.0
	# 进入 btpanel_6.9.0 目录
	cd /root/btpanel_6.9.0
	# 下载破解包
	wget -O btpanel_6.9.0.zip ${bt_domain}/btpanel_6.9.0.zip
	# 解压破解包
	unzip -o btpanel_6.9.0.zip > /dev/null
	echo -e "${Info} 破解包下载解压操作完成，正在进行下一步操作!"
	
	# 删除宝塔插件目录
	rm -rf /www/server/panel/plugin
	# 创建宝塔插件目录
	mkdir /www/server/panel/plugin
	# 进入宝塔插件目录	
	cd /www/server/panel/plugin
	# 下载破解插件包
	wget -O plugin.zip ${bt_domain}/plugin.zip
	# 解压破解插件包
	unzip -o plugin.zip > /dev/null
	# 删除破解插件包
	rm -rf /www/server/panel/plugin/plugin.zip
	echo -e "${Info} 插件包下载解压操作完成，正在进行下一步操作!"
	
	# 进入宝塔环境安装sh目录
	cd /www/server/panel/install
	# 下载手动环境包
	wget -O web.zip ${bt_domain}/web.zip
	# 解压手动环境包
	unzip -o web.zip > /dev/null
	# 删除手动环境包
	rm -rf /www/server/panel/install/web.zip
	echo -e "${Info} 环境安装sh下载解压操作完成，正在进行下一步操作!"
	# 下载防火墙所需组件
	wget -O btwaf.sh ${bt_domain}/btwaf.sh
	# 下载监控报表所需组件
    wget -O total.sh ${bt_domain}/total.sh
	# 执行所需组件
	bt_zj
	# 移动文件 进行破解云端插件下载验证
	copy_class
}

# 已经安装宝塔破解 2
startshows(){
    # 创建 btpanel_6.9.0 目录
	mkdir /root/btpanel_6.9.0
	# 进入 btpanel_6.9.0 目录
	cd /root/btpanel_6.9.0
	# 下载破解包
	wget -O btpanel_6.9.0.zip ${bt_domain}/btpanel_6.9.0.zip
	# 解压破解包
	unzip -o btpanel_6.9.0.zip > /dev/null
	echo -e "${Info} 破解包下载解压操作完成，正在进行下一步操作!"
	
	# 删除宝塔插件目录
	rm -rf /www/server/panel/plugin
	# 创建宝塔插件目录
	mkdir /www/server/panel/plugin
	# 进入宝塔插件目录
	cd /www/server/panel/plugin
	# 下载破解插件包
	wget -O plugin_s.zip ${bt_domain}/plugin_s.zip
	# 解压破解插件包
	unzip -o plugin_s.zip > /dev/null
	# 删除破解插件包
	rm -rf /www/server/panel/plugin/plugin_s.zip
	echo -e "${Info} 插件包下载解压操作完成，正在进行下一步操作!"
	
	# 进入宝塔环境安装sh目录
	cd /www/server/panel/install
	# 下载手动环境包
	wget -O web.zip ${bt_domain}/web.zip
	# 解压手动环境包
	unzip -o web.zip > /dev/null
	# 删除手动环境包
	rm -rf /www/server/panel/install/web.zip
	echo -e "${Info} 环境安装sh下载解压操作完成，正在进行下一步操作!"
	# 下载防火墙所需组件
	wget -O btwaf_httpd.sh ${bt_domain}/btwaf_httpd.sh
	# 下载监控报表所需组件
    wget -O total.sh ${bt_domain}/total.sh
	# 执行所需组件
	bt_zjs
	# 移动文件 进行破解云端插件下载验证
	copy_class
}

# 移动文件 进行破解云端插件下载验证
copy_class(){
    # 取消 插件列表 升级专业版 提示！
    cp -pf /root/btpanel_6.9.0/soft.js ${PANEL_DIR}/BTPanel/static/js/soft.js
	# 宝塔首页添加 专业版永久授权 提示 以及 免费售后 ！
	cp -pf /root/btpanel_6.9.0/index.html ${PANEL_DIR}/BTPanel/templates/default/index.html
	# 修改云端插件下载验证
	cp -pf /root/btpanel_6.9.0/panelPlugin.py ${PANEL_DIR}/class/panelPlugin.py
	echo -e "${Info} 文件修改完成，正在进行下一步操作!"
	# 删除破解包
	delete
	# 执行宝塔重启
	restart_btpanel
}

# 删除破解包
delete(){
    # 删除破解包
	rm -rf /root/btpanel_6.9.0
}

#执行所需组件
bt_zj(){
    # 进入宝塔环境安装sh目录
	cd /www/server/panel/install
    # 安装防火墙组件
	bash btwaf.sh install
	# 安装监控报表组件
	bash total.sh install
	# 删除已经安装的防火墙组件sh
	rm -rf /www/server/panel/install/btwaf.sh
	# 删除已经安装的监控报表组件sh
	rm -rf /www/server/panel/install/total.sh
}

#执行所需组件
bt_zjs(){
    # 进入宝塔环境安装sh目录
	cd /www/server/panel/install
    # 安装防火墙组件
	bash btwaf_httpd.sh install
	# 安装监控报表组件
	bash total.sh install
	rm -rf /www/server/panel/install/btwaf_httpd.sh
	# 删除已经安装的监控报表组件sh
	rm -rf /www/server/panel/install/total.sh
}

# 移动文件 进行破解云端插件下载验证
restart_btpanel(){
    # 重启宝塔面板
	/etc/init.d/bt restart
	echo -e "${Info} 重启宝塔面板完成，宝塔专业版安装成功!"
}

# 删除脚本
delete_s(){
    # 删除脚本文件
    rm -rf bt_6.9.0.sh
	# 删除 nginx 宝塔面板文件
	rm -rf install_6.0.sh
	# 删除 apache 宝塔面板文件
	rm -rf install_6.0_s.sh
}

# nginx 防火墙修复 A
getwaf(){
    # 下载防火墙安装sh并安装
	wget -O waf.sh ${bt_domain}/waf.sh && chmod 755 waf.sh && bash waf.sh install
	# 删除防火墙sh文件
	rm -rf /waf.sh
	echo -e "\033[43;35m Nginx 防火墙：A 部分修复完毕！ \033[0m \n" 
}

# nginx 防火墙修复 B
getwaf_s(){
    # 插件防火墙破解目录
	mkdir /root/getwaf
	# 进入防火墙破解目录
	cd /root/getwaf
	# 下载防火墙破解补丁
	wget -O btwaf_main.py ${bt_domain}/co/btwaf_main.py	
	# 进行破解覆盖操作
	install_btwaf
}

# apache 防火墙修复
getwaf_r(){
    wget -O waf_s.sh ${bt_domain}/waf_s.sh && chmod 755 waf_s.sh && bash waf_s.sh install
	# 删除防火墙sh文件
	rm -rf /waf_s.sh
    echo -e "\033[43;35m Apache 防火墙：修复完毕！ \033[0m \n" 
}

# nginx 防火墙覆盖操作
install_btwaf(){
    # 移动破解文件到防火墙插件目录
	cp -pf /root/getwaf/btwaf_main.py ${PANEL_DIR}/plugin/btwaf/btwaf_main.py
	# 删除破解文件包
	rm -rf /root/getwaf
	echo -e "\033[43;35m Nginx 防火墙：B 部分修复完毕！ \033[0m \n" 
}

wafdler(){
clear
echo -e "${Green_font}
#=======================================
 请一定看清楚说明，再去破解防火墙插件！
#=======================================
${Font_suffix}"

echo -e "${MAIN_RETURNFHQ}"
echo -e "1.Nginx 防火墙 6.3\n2.Apache 防火墙 5.9\n3.返回上一步"
read -p "输入数字以选择:" fugitive

while [[ ! "${fugitive}" =~ ^[0-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" fugitive
	done
	
if [[ "${fugitive}" == "1" ]]; then
	wafn
elif [[ "${fugitive}" == "2" ]]; then
    wafa
elif [[ "${fugitive}" == "3" ]]; then
    main

fi
}

wafn(){
clear
echo -e "${Green_font}
#=======================================
第一步：先执行修复补丁A 会自动安装防火墙
第二步：接着打开防火墙，会显示插件已到期
第三步：然后执行 修复补丁B  在启动防火墙
#=======================================
${Font_suffix}"

echo -e "${MAIN_RETURNFHQN}"
echo -e "1.Nginx 防火墙 修复补丁 A ${MAIN_RETURNBT0}\n2.Nginx 防火墙 修复补丁 B ${MAIN_RETURNBT1}\n3.返回上一步"
read -p "输入数字以选择:" fhqn_s


while [[ ! "${fhqn_s}" =~ ^[0-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" fhqn_s
	done

if [[ "${fhqn_s}" == "1" ]]; then
	getwaf
elif [[ "${fhqn_s}" == "2" ]]; then
    getwaf_s
elif [[ "${fhqn_s}" == "3" ]]; then
    wafdler
fi	
}

wafa(){
clear
echo -e "${Green_font}
#=======================================
Apahce：直接执行修复补丁会自动安装防火墙
#=======================================
${Font_suffix}"

echo -e "${MAIN_RETURNFHQA}"
echo -e "1.Apache 防火墙 修复补丁\n2.返回上目录"
read -p "输入数字以选择:" fhqa_s

while [[ ! "${fhqa_s}" =~ ^[0-2]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" fhqa_s
	done

if [[ "${fhqa_s}" == "1" ]]; then
	getwaf_r
elif [[ "${fhqa_s}" == "2" ]]; then
    wafdler

fi	
}


startshowtimes(){
clear
echo -e "${Green_font}
#=======================================
# Name:         bt-6.9.0-crack
# Version:      6.9.0
# Author:       樱花博客
# Copyright:    https://www.loli.team
#=======================================
${Font_suffix}"

echo -e "${MAIN_RETURNSHOWTIME}"
echo -e "1.宝塔专业Nginx防火墙版\n2.宝塔专业Apache防火墙版\n3.返回上一步"
read -p "输入数字以选择:" showtimes

while [[ ! "${showtimes}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" showtimes
	done

if [[ "${showtimes}" == "1" ]]; then
	gametime
elif [[ "${showtimes}" == "2" ]]; then
    gametimes	
elif [[ "${showtimes}" == "3" ]]; then
    main	
else
	clear
	exit 1
fi	
}

startshowtime(){
clear
echo -e "${Green_font}
#=======================================
# Name:         bt-6.9.0-crack
# Version:      6.9.0
# Author:       樱花博客
# Copyright:    https://www.loli.team
#=======================================
${Font_suffix}"

echo -e "${MAIN_RETURNSHOWTIME}"
echo -e "1.宝塔专业Nginx防火墙版\n2.宝塔专业Apache防火墙版\n3.返回上一步"
read -p "输入数字以选择:" showtime

while [[ ! "${showtime}" =~ ^[1-3]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" showtime
	done

if [[ "${showtime}" == "1" ]]; then
	startshow
elif [[ "${showtime}" == "2" ]]; then
    startshows	
elif [[ "${showtime}" == "3" ]]; then
    main	
else
	clear
	exit 1
fi	
}

main(){
clear
echo -e "${Green_font}
#=======================================
# Name:         bt-6.9.0-Sakura
# Version:      6.9.0
# Author:       樱花博客
# Copyright:    https://www.loli.team
#=======================================
${Font_suffix}"
echo -e "${MAIN_RETURN}"
echo -e "1.全新破解版宝塔 ${MAIN_RETURNQ}\n2.已安装宝塔破解 ${MAIN_RETURNS}\n3.修复防火墙\n4.退出脚本"
read -p "输入数字以选择:" function

while [[ ! "${function}" =~ ^[1-4]$ ]]
	do
		echo -e "${Error} 无效输入"
		echo -e "${Info} 请重新选择" && read -p "输入数字以选择:" function
	done

if [[ "${function}" == "1" ]]; then
	startshowtimes
elif [[ "${function}" == "2" ]]; then
    startshowtime
elif [[ "${function}" == "3" ]]; then
    wafdler	
elif [[ "${function}" == "4" ]]; then
    delete_s
else
	clear
	exit 1
fi	
}

main
