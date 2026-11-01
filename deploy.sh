#!/usr/bin/env bash
set -euo pipefail
# CADCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/cadcraft#readme
# 更新日期：2026-11-01
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fL -o cadcraft.AppImage https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-linux-x86_64.AppImage
echo "88ae616958413b8fa56259df6f70fb695ab90b472e4c63cf955ae6a6471bb11d  cadcraft.AppImage" | sha256sum -c -
chmod +x cadcraft.AppImage
echo "安装完成：运行 ./cadcraft.AppImage，打开 examples 里的示例 DXF 试标注与图层"

echo ""

echo "下载与校验完成，安装包在 .download 目录"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/cadcraft#readme"
