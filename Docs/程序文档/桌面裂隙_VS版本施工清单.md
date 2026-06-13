# 《桌面裂隙》VS 版本施工清单

> **文档类型：程序文档**  
> **适用项目：桌面裂隙 / Desktop Rift**  
> **对应版本：VS 版本**  
> **依据文档：《桌面裂隙》VS 版本计划规划、《桌面裂隙》项目目录资产结构**  
> **文档用途：将 VS 版本规划拆解为可执行的程序、场景、资产与验证施工清单**

---

## 1. 施工目标

VS 版本施工目标是完成一个“桌面边缘地下城裂隙”的最小视觉概念样机，用于验证第一眼表达、低打扰观看感和基础演出关系。

本版本不追求完整玩法闭环，只施工以下核心内容：

- 桌面裂隙主场景。
- 贴边窗口观看形态。
- 基础地下城空间层次。
- 少量魔物和冒险者演出。
- 极简状态 UI。
- 基础环境动效和低打扰反馈。
- 人工验证场景与验收记录。

---

## 2. 施工边界

### 2.1 本版本必须完成

- 能运行一个 VS 演示主场景。
- 能看到桌面边缘裂隙和地下城空间。
- 至少有一个魔物待机或活动表现。
- 至少有一个冒险者靠近、退场或被处理的微事件表现。
- 能展示常驻状态和收起状态的视觉概念。
- 能展示极简 UI 信息和少量交互反馈。
- 能通过人工测试判断是否满足 VS 验收标准。

### 2.2 本版本可以简化

- 桌面贴边可以先使用普通 Godot 窗口模拟，不强制实现全部原生窗口能力。
- 魔物和冒险者可以先使用占位像素图、色块或临时动画。
- 地下城房间可以先使用静态图层或简单节点，不要求可建造。
- 微事件可以先使用固定脚本演出，不要求真实 AI。
- UI 可以先使用静态或半静态状态，不要求完整数据绑定。

### 2.3 本版本禁止扩展

- 不做完整建造系统。
- 不做完整自动战斗结算。
- 不做正式资源经济。
- 不做正式离线收益。
- 不做完整存档。
- 不做正式数据表驱动全量内容。
- 不做多平台发布适配。
- 不做复杂新手引导和商店包装。

---

## 3. 推荐施工目录

VS 版本只需要建立最小必要目录。后续版本再继续扩展完整项目结构。

```text
TaskBarIRift/
├─ assets/
│  ├─ art/
│  │  ├─ desktop/
│  │  ├─ dungeon/
│  │  ├─ characters/
│  │  │  ├─ monsters/
│  │  │  └─ adventurers/
│  │  └─ ui/
│  └─ audio/
│     ├─ sfx/
│     └─ ambience/
├─ scenes/
│  ├─ desktop/
│  ├─ dungeon/
│  ├─ entities/
│  │  ├─ monsters/
│  │  └─ adventurers/
│  ├─ ui/
│  └─ vfx/
├─ scripts/
│  ├─ desktop/
│  ├─ dungeon/
│  ├─ entities/
│  ├─ ui/
│  └─ utils/
└─ tests/
   └─ manual/
```

---

## 4. 阶段一：工程目录与主场景搭建

### 4.1 目录创建

| 状态 | 路径 | 用途 |
|---|---|---|
| 待施工 | `assets/art/desktop` | 裂隙边缘、窗口框、桌面形态视觉资产 |
| 待施工 | `assets/art/dungeon` | 房间、背景、地块、地下城装饰 |
| 待施工 | `assets/art/characters/monsters` | 魔物占位图和正式草图 |
| 待施工 | `assets/art/characters/adventurers` | 冒险者占位图和正式草图 |
| 待施工 | `assets/art/ui` | 极简 UI 图标和按钮 |
| 待施工 | `assets/audio/sfx` | UI、魔物、冒险者和裂隙音效 |
| 待施工 | `assets/audio/ambience` | 低打扰环境音 |
| 待施工 | `scenes/desktop` | 桌面裂隙主场景和窗口概念场景 |
| 待施工 | `scenes/dungeon` | 地下城空间和房间场景 |
| 待施工 | `scenes/entities/monsters` | 魔物演出场景 |
| 待施工 | `scenes/entities/adventurers` | 冒险者演出场景 |
| 待施工 | `scenes/ui` | VS 状态 UI 和提示 UI |
| 待施工 | `scenes/vfx` | 裂隙脉动、金币掉落、吞噬等演出 |
| 待施工 | `scripts/desktop` | 窗口形态和演示流程脚本 |
| 待施工 | `scripts/dungeon` | 地下城视觉控制脚本 |
| 待施工 | `scripts/entities` | 角色演出基础脚本 |
| 待施工 | `scripts/ui` | UI 显示和交互脚本 |
| 待施工 | `tests/manual` | 人工验证场景 |

### 4.2 主场景创建

| 状态 | 文件 | 说明 |
|---|---|---|
| 待施工 | `scenes/desktop/vs_desktop_demo.tscn` | VS 版本演示入口主场景 |
| 待施工 | `scenes/desktop/rift_window_mock.tscn` | 模拟桌面边缘裂隙窗口 |
| 待施工 | `scenes/dungeon/vs_dungeon_strip.tscn` | 狭长地下城空间展示 |
| 待施工 | `scenes/ui/vs_status_hud.tscn` | 极简状态 UI |

### 4.3 脚本创建

| 状态 | 文件 | 说明 |
|---|---|---|
| 待施工 | `scripts/desktop/vs_desktop_demo.gd` | 组织 VS 演示流程和节点引用 |
| 待施工 | `scripts/desktop/rift_window_mock.gd` | 控制裂隙窗口模拟状态 |
| 待施工 | `scripts/dungeon/vs_dungeon_strip.gd` | 控制地下城层次和环境动效 |
| 待施工 | `scripts/ui/vs_status_hud.gd` | 控制极简 UI 文案与按钮反馈 |

### 4.4 验证清单

- Godot 能打开项目且无导入错误。
- VS 主场景能被设置为运行入口或通过编辑器直接运行。
- 主场景节点职责清晰，桌面、地下城、UI 不混在同一脚本中。
- 运行后能看到裂隙窗口、地下城条带和基础 UI。

---

## 5. 阶段二：桌面裂隙视觉施工

### 5.1 视觉资产

| 状态 | 资产 | 说明 |
|---|---|---|
| 待施工 | `assets/art/desktop/rift_edge_base.png` | 裂隙边缘基础图 |
| 待施工 | `assets/art/desktop/rift_glow_loop.png` | 裂隙发光或脉动序列 |
| 待施工 | `assets/art/desktop/collapsed_bar_mock.png` | 收起状态概念图 |
| 待施工 | `assets/art/dungeon/dungeon_backdrop.png` | 地下城背景层 |
| 待施工 | `assets/art/dungeon/room_core_mock.png` | 核心房概念图 |
| 待施工 | `assets/art/dungeon/room_lair_mock.png` | 魔物巢穴概念图 |
| 待施工 | `assets/art/dungeon/room_entrance_mock.png` | 入口房概念图 |

### 5.2 场景节点建议

`rift_window_mock.tscn` 建议节点结构：

```text
RiftWindowMock (Control 或 Node2D)
├─ BackgroundLayer
├─ RiftEdgeLayer
├─ DungeonViewport
├─ VfxLayer
├─ EntityLayer
└─ UiAnchor
```

### 5.3 动效施工

| 状态 | 内容 | 说明 |
|---|---|---|
| 待施工 | 裂隙脉动 | 轻微缩放、透明度或发光变化 |
| 待施工 | 环境灯闪烁 | 房间内微弱灯光变化 |
| 待施工 | 核心呼吸 | 核心房有低频视觉反馈 |
| 待施工 | 背景暗流 | 裂隙深处有缓慢流动感 |

### 5.4 验证清单

- 第一眼能看出画面是桌面裂隙，而不是普通矩形窗口。
- 画面有地下空间层次，不是单层贴图。
- 动效不刺眼、不高频、不影响长期观看。
- 小尺寸下仍能看清裂隙、房间和核心区域。

---

## 6. 阶段三：魔物与冒险者演出施工

### 6.1 魔物场景

| 状态 | 文件 | 说明 |
|---|---|---|
| 待施工 | `scenes/entities/monsters/vs_slime.tscn` | 史莱姆待机和轻微移动 |
| 待施工 | `scenes/entities/monsters/vs_mimic.tscn` | 宝箱怪闭合、张嘴或吞噬演出 |
| 待施工 | `scripts/entities/vs_monster_actor.gd` | VS 版本魔物演出基础脚本 |

### 6.2 冒险者场景

| 状态 | 文件 | 说明 |
|---|---|---|
| 待施工 | `scenes/entities/adventurers/vs_adventurer.tscn` | 冒险者靠近、停顿、退场或受击演出 |
| 待施工 | `scripts/entities/vs_adventurer_actor.gd` | VS 版本冒险者演出基础脚本 |

### 6.3 微事件演出

| 状态 | 内容 | 说明 |
|---|---|---|
| 待施工 | 冒险者靠近入口 | 冒险者从入口方向进入画面 |
| 待施工 | 魔物观察冒险者 | 魔物朝向或小动作响应 |
| 待施工 | 宝箱怪吞噬或吓退 | 用固定演出表达反勇者视角 |
| 待施工 | 金币掉落 | 冒险者结果后的轻量奖励反馈 |
| 待施工 | 状态提示 | UI 显示一句简短事件提示 |

### 6.4 验证清单

- 至少一个魔物有可识别的小动作。
- 至少一个冒险者有进入或退场动作。
- 魔物和冒险者的关系能暗示“地下城在回收冒险者”。
- 演出可以循环播放，不需要用户高频操作。
- 演出节奏适合桌面边缘观看。

---

## 7. 阶段四：极简 UI 与交互施工

### 7.1 UI 场景

| 状态 | 文件 | 说明 |
|---|---|---|
| 待施工 | `scenes/ui/vs_status_hud.tscn` | 顶层状态和版本提示 |
| 待施工 | `scenes/ui/vs_tooltip.tscn` | 鼠标悬停提示 |
| 待施工 | `scenes/ui/vs_collapse_button.tscn` | 收起按钮概念 |

### 7.2 UI 信息

VS 版本建议只展示以下信息：

- 项目名或裂隙名。
- 简短状态，例如“裂隙稳定”“有冒险者靠近”。
- 少量资源占位，例如金币图标和数字占位。
- 收起或展开概念按钮。
- 鼠标悬停时的一句说明。

### 7.3 交互施工

| 状态 | 内容 | 说明 |
|---|---|---|
| 待施工 | 鼠标悬停反馈 | 裂隙或魔物轻微高亮 |
| 待施工 | 点击魔物反馈 | 魔物播放小动作或提示 |
| 待施工 | 收起状态切换 | 主画面与收起条之间切换概念 |
| 待施工 | 展开状态切换 | 从收起条回到主画面 |

### 7.4 验证清单

- UI 不遮挡地下城主体。
- UI 文案能帮助玩家理解概念。
- 收起和展开反馈清楚。
- 所有交互都是低频、低打扰。

---

## 8. 阶段五：声音与低打扰反馈施工

### 8.1 音频资产

| 状态 | 资产 | 说明 |
|---|---|---|
| 待施工 | `assets/audio/ambience/rift_ambience_loop.ogg` | 低音量环境氛围 |
| 待施工 | `assets/audio/sfx/sfx_rift_pulse.wav` | 裂隙脉动音 |
| 待施工 | `assets/audio/sfx/sfx_ui_hover.wav` | UI 悬停音 |
| 待施工 | `assets/audio/sfx/sfx_mimic_bite.wav` | 宝箱怪演出音 |
| 待施工 | `assets/audio/sfx/sfx_coin_drop.wav` | 金币掉落音 |

### 8.2 音频施工要求

- 默认音量必须偏低。
- 音效不能频繁触发。
- 环境音应能长时间循环，不产生明显疲劳。
- UI 音效应轻、短、弱。
- 如果音频资源暂缺，可以先使用静音占位和接口预留。

### 8.3 验证清单

- 长时间播放不会明显打扰用户。
- 关闭音量或静音后不影响 VS 演示理解。
- 演出音效与视觉反馈同步。

---

## 9. 阶段六：人工验证场景施工

### 9.1 测试场景

| 状态 | 文件 | 说明 |
|---|---|---|
| 待施工 | `tests/manual/vs_desktop_view_test.tscn` | 桌面观看感验证 |
| 待施工 | `tests/manual/vs_animation_loop_test.tscn` | 动效循环验证 |
| 待施工 | `tests/manual/vs_ui_readability_test.tscn` | UI 小尺寸可读性验证 |

### 9.2 人工验证表

建议在施工完成后记录以下问题：

| 检查项 | 通过标准 | 结果 |
|---|---|---|
| 第一眼识别 | 3 秒内看懂是桌面地下城裂隙 | 待记录 |
| 低打扰 | 放在桌面边缘 10 分钟不明显烦躁 | 待记录 |
| 角色关系 | 能看出魔物与冒险者存在对抗或回收关系 | 待记录 |
| 小尺寸可读性 | 缩小后仍能辨认主要元素 | 待记录 |
| 暗黑可爱风格 | 画面不是纯恐怖，也不是普通可爱宠物 | 待记录 |
| 继续期待 | 观看后愿意看到后续入侵和结算玩法 | 待记录 |

---

## 10. 建议实施顺序

### 10.1 第一步：搭建空工程结构

创建 VS 所需最小目录、主场景和基础脚本，让项目可以运行一个空的演示入口。

### 10.2 第二步：完成裂隙和地下城静态画面

先完成裂隙边缘、地下背景、入口、核心和少量房间的静态组合，确认第一眼表达。

### 10.3 第三步：加入基础环境动效

加入裂隙脉动、灯光闪烁和核心呼吸，确认“活体地下城”感受。

### 10.4 第四步：加入角色演出

加入至少一个魔物和一个冒险者，用固定流程演示靠近、响应、退场或被回收。

### 10.5 第五步：加入极简 UI 和收起概念

加入状态提示、悬停反馈和收起展开概念，让桌面常驻形态更完整。

### 10.6 第六步：加入声音和人工测试场景

加入低打扰音效或静音占位，并通过人工验证场景检查观看体验。

---

## 11. Godot 实现注意事项

- 场景要保持小而可复用，不要把所有内容堆进一个根节点脚本。
- UI 节点如果放在 `Container` 下，不要假设普通锚点布局一定生效，需要检查尺寸标记和最小尺寸。
- 脚本尽量使用静态类型，方便后续扩展到 FVS 和 MVP。
- 高频播放或循环对象不要频繁创建销毁，优先使用隐藏、重置和复用。
- 节点引用应在 `_ready` 或 `@onready` 中缓存，不要在循环中反复查找节点。
- 角色演出和 UI 提示之间尽量用信号或演示控制器协调，避免互相硬引用。
- VS 阶段资源可以是占位，但文件路径和命名应按正式结构执行。

---

## 12. VS 完成验收清单

| 状态 | 验收项 | 说明 |
|---|---|---|
| 待验收 | 主场景可运行 | `vs_desktop_demo.tscn` 能正常启动 |
| 待验收 | 裂隙形态清晰 | 第一眼能识别桌面边缘裂隙 |
| 待验收 | 地下城层次清晰 | 能区分入口、房间和深处空间 |
| 待验收 | 魔物有记忆点 | 至少一个魔物有清晰动作或性格暗示 |
| 待验收 | 冒险者有演出 | 至少一个冒险者完成靠近或退场流程 |
| 待验收 | 微事件成立 | 能表达地下城对冒险者的处理或威胁 |
| 待验收 | UI 低打扰 | UI 不遮挡主体且信息量克制 |
| 待验收 | 收起概念成立 | 能看到常驻与收起两种状态概念 |
| 待验收 | 声音低打扰 | 音效不频繁、不刺耳，可长时间接受 |
| 待验收 | 人工验证记录完成 | 关键验证项有记录结果 |

---

## 13. 进入 FVS 前必须确认

进入 FVS 版本前，程序侧需要确认以下事项：

1. VS 主场景结构可以继续扩展，不需要推倒重做。
2. 桌面裂隙视觉比例和主窗口尺寸方向已经基本确定。
3. 魔物、冒险者、房间和 UI 的资源路径命名已经符合项目结构。
4. 微事件演出证明“冒险者进入地下城会发生结果”的方向可行。
5. 低打扰观看体验没有明显问题。
6. 后续 FVS 可以在现有结构上加入最小玩法链路。

---

## 14. 施工产物汇总

VS 版本完成后，至少应留下以下产物：

```text
scenes/desktop/vs_desktop_demo.tscn
scenes/desktop/rift_window_mock.tscn
scenes/dungeon/vs_dungeon_strip.tscn
scenes/entities/monsters/vs_slime.tscn
scenes/entities/monsters/vs_mimic.tscn
scenes/entities/adventurers/vs_adventurer.tscn
scenes/ui/vs_status_hud.tscn
scripts/desktop/vs_desktop_demo.gd
scripts/desktop/rift_window_mock.gd
scripts/dungeon/vs_dungeon_strip.gd
scripts/entities/vs_monster_actor.gd
scripts/entities/vs_adventurer_actor.gd
scripts/ui/vs_status_hud.gd
tests/manual/vs_desktop_view_test.tscn
tests/manual/vs_animation_loop_test.tscn
tests/manual/vs_ui_readability_test.tscn
```

如果阶段资源仍为占位图，也应按正式路径存放，避免 FVS 阶段重新整理目录。

---

## 15. 总结

VS 版本施工重点是“看起来像、放得住、记得住”。

程序施工不应追求完整系统，而应服务于桌面裂隙的第一眼概念、活体地下城的基础演出、低打扰桌面观看和后续 FVS 玩法链路扩展。只要 VS 版本能稳定展示桌面边缘地下城的核心魅力，就可以进入下一阶段的 FVS 玩法验证。

