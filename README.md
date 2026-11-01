# CADCraft 一键安装指南

> 第三方部署指南 · 非 CADCraft 官方仓库。官方项目：[storytold/cadcraft](https://github.com/storytold/cadcraft)
> 内容来自官方文档（2026-11-01）。项目迭代快，请以[官方文档](https://github.com/storytold/cadcraft#readme)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 熟悉的那套 CAD 操作都在：输命令、开对象捕捉、按图层管标注，打开的是标准 DXF 文件。

⚠️ 官方把状态标为「early development」，功能在快速补齐，别直接用在正式出图流程上。支持 Windows、macOS、Linux 与 FreeBSD 安装包，也有浏览器版。DXF 是主要交换格式，复杂图纸的块与真彩色可能还原不全。安装包未签名时系统会拦一次。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/cadcraft-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载安装包并比对 SHA256，装完打开示例 DXF 确认标注与图层正常，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## CADCraft 是什么？

CADCraft 是开源的命令行、对象捕捉、图层、标注、填充、块和 DXF 都在，原生跑桌面，也能在浏览器里用（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/storytold/cadcraft?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

原生 2D/3D CAD：命令行输入、对象捕捉、图层管理、标注与引线、填充、块与属性、DXF 读写，桌面端原生运行并提供 WebAssembly 浏览器版。

- 纯 Rust 原生：大图打开与缩放都跟手
- 操作习惯不变：命令行、捕捉、图层照旧
- 标准 DXF：进出自如，能和别人交换图纸
- 标注齐全：尺寸、多行文字、表格、引线
- 三平台安装包 + 浏览器版
- Apache-2.0，可商用可二开

（来源：[官方仓库](https://github.com/storytold/cadcraft)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 7.3k stars 10 月新项目 | 名称搜索 71 条结果 |
| 纯 Rust 原生 | 打开大图流畅 |
| 标准 DXF 进出自如 | — |
| 标注、引线、表格等制图元素齐全 | — |
| 三平台安装包 + 浏览器版 | — |
| Apache-2.0 | 可商用可二开 |

| 需要注意 | 说明 |
|---|---|
| 官方标注 early development | — |
| 复杂 DXF 兼容性有限 | — |
| 与商业 CAD 的高级功能仍有差距 | — |
| 浏览器版处理大图吃力 | — |
| 中文图纸的字体需自行确认 | — |

> 以上基于官方文档与社区反馈整理（2026-11-01），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o cadcraft.AppImage https://github.com/storytold/cadcraft/releases/download/v0.15.1/cadcraft-0.15.1-linux-x86_64.AppImage
echo "88ae616958413b8fa56259df6f70fb695ab90b472e4c63cf955ae6a6471bb11d  cadcraft.AppImage" | sha256sum -c -
chmod +x cadcraft.AppImage
echo "安装完成：运行 ./cadcraft.AppImage，打开 examples 里的示例 DXF 试标注与图层"
```

安装包来源：[https://github.com/storytold/cadcraft/releases/latest](https://github.com/storytold/cadcraft/releases/latest)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认 early development 状态、DXF 能力与三平台安装包 | 已核对 2026-11-01 |
| Release v0.15.1 的 SHA256SUMS.txt 已下载核对（Windows 与 Linux） | 已核对 2026-11-01 |
| 未实测安装与制图 | 说明 2026-11-01 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-11-01 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-11-01 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP；本仓库的 MCP 只提供安装步骤、示例文件与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-11-01）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\cadcraft-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包对照（v0.15.1）

| 平台 | 文件 |
|---|---|
| Windows x64 | cadcraft-0.15.1-windows-x64.msi |
| Windows 便携版 | cadcraft-0.15.1-windows-x64-portable.zip |
| Windows ARM64 | 对应 msi 与便携包 |
| macOS 通用 | cadcraft-0.15.1-macos-universal.dmg |
| Linux x64 | cadcraft-0.15.1-linux-x86_64.AppImage / .deb |
| Linux ARM64 | AppImage / deb / rpm / flatpak |
| FreeBSD | tar.gz |

Release 里带 `SHA256SUMS.txt`，可一次核对全部文件。

## 从源码构建

```bash
cargo run --release -p cadcraft
```

## 建议先跑示例

仓库的 `examples/` 里有公寓平面图 `apartment.dxf`，涵盖墙体填充、TrueType 多行文字、表格、多重引线与建筑标注，用来验证显示是否正常最直接。

## 注意

- 早期开发阶段，别用于正式交付图纸
- 复杂 DXF 的块与真彩色可能还原不全
- 浏览器版适合查看与轻改，重活放桌面端
- 大图纸注意显存，3D 视图尤其明显
- Apache-2.0，二次分发保留声明

## 常见坑

- Windows 安装被 SmartScreen 拦：核对 SHA256 后仍报，选仍要运行
- macOS 提示无法验证：在隐私与安全性里允许
- AppImage 打不开：先 chmod +x，缺 FUSE 用 --appimage-extract
- 打开别人图纸乱版：块与真彩色兼容有限，先导出简化版
- 中文显示成方框：把字体文件装进系统，或改用通用字体
- 3D 视图卡顿：降低渲染质量或改用 2D 视图
- 保存后打不开：确认对方 CAD 支持该 DXF 版本

## 免责声明

本仓库为第三方指南，与 CADCraft 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-11-01），项目迭代快，请以[官方文档](https://github.com/storytold/cadcraft#readme)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
