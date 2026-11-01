# CADCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/cadcraft#readme
# 更新日期：2026-11-01
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o cadcraft.msi https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-windows-x64.msi
$h=(Get-FileHash .\cadcraft.msi -Algorithm SHA256).Hash.ToLower()
if ($h -ne "8788212a7e9f662360773676690f869ef890797d8b50446b76cc60053779e87c") { throw "SHA256 校验失败" }
Start-Process msiexec.exe -ArgumentList '/i', "$PWD\cadcraft.msi" -Wait
Write-Host "安装完成：从开始菜单打开 CADCraft，先载入示例 DXF"

Write-Host ''

Write-Host '下载与校验完成，安装包在 .download 目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/cadcraft#readme'
