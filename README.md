# stash

一个偏 **自用、轻量、可持续迭代** 的 Stash 配置仓库。  
目标不是堆很多花哨分类，而是做出 **精美实用、可自托管、可继续扩展** 的 tile 配置与脚本。

## 项目方向

- **轻量模板化**：保持仓库结构清楚，不做过度工程化
- **自托管优先**：脚本与资源尽量放在自己的 repo 里，不依赖外部 raw 文件
- **先实用，再扩张**：优先把现有 tile 做成真的可用，而不是继续加一堆占位项
- **便于迭代**：配置文件、示例、脚本分开，方便后续逐个打磨

---

## 当前内容

### Stash override 配置
- `collapsed-tiles.stoverride`：基础折叠面板示例
- `ai-tools.stoverride`：AI 工具面板
- `streaming.stoverride`：流媒体面板
- `developer-sites.stoverride`：开发者网站面板
- `stash-ru-bundle.stoverride`：引入 remnawave 模板的独立 override

### 对应示例
- `examples/collapsed-tiles.yaml`
- `examples/ai-tools.yaml`
- `examples/streaming.yaml`
- `examples/developer-sites.yaml`
- `examples/stash-ru-bundle.yaml`

### 本仓库自托管脚本
- `tiles/*.js`

---

## 脚本状态

### 已做成可执行检查版本
- `chatgpt-web.js`
- `chatgpt-app.js`
- `youtube.js`
- `netflix.js`
- `github.js`
- `vercel.js`
- `cloudflare.js`
- `openai.js`
- `claude.js`
- `gemini.js`
- `copilot.js`
- `bilibili.js`
- `perplexity.js`
- `anthropic.js`
- `stackoverflow.js`
- `primevideo.js`
- `disneyplus.js`
- `grok.js`

这些脚本已经从 `TODO` 占位提升到**真实可运行的可用检查版本**。

### 当前状态
- 主流 AI 服务、开发站点、常见流媒体 tile 已经基本覆盖到“可运行检查版本”
- 当前下一阶段重点不再是把 placeholder 补齐，而是继续提升：
  - 文案一致性
  - pack 展示效果
  - README 成品感
  - 示例配置的上手友好度

---

## 使用说明

当前所有配置文件里引用的 `script-providers` 都已经改为指向本仓库内的 JS 文件，不再依赖外部仓库脚本。

推荐 raw 链接格式：

```text
https://raw.githubusercontent.com/shen445122/stash/main/<file>
```

例如：

```text
https://raw.githubusercontent.com/shen445122/stash/main/collapsed-tiles.stoverride
```

### 快速开始

如果你只是想直接试用，优先从 `examples/` 里的 YAML 开始：

- `examples/ai-tools.yaml`
- `examples/developer-sites.yaml`
- `examples/streaming.yaml`
- `examples/test-static.yaml`（用于定位 script-provider / JS 执行问题）

它们现在都已经：
- 带 `desc` 说明
- 使用更统一的 icon 风格
- 默认指向本仓库自托管的 `tiles/*.js`

适合先复制、再按自己的面板需求调整。

---

## 设计方向

当前仓库的美化方向是：

- **先统一信息密度**：title / content / status 风格尽量一致
- **再统一品牌感**：尽量为主流服务补 icon，减少“有些很完整、有些很素”的割裂感
- **控制克制感**：不追求花哨堆砌，而是保持整洁、轻量、能长期维护

---

## 后续优化建议

如果继续往“精美实用”推进，优先级建议是：

1. **继续补剩余 tile 的真实检查逻辑**
2. **继续统一 icon / 文案风格**，让整个面板更整洁
3. **增加每类配置的截图或效果说明**，提高可读性
4. **逐步减少 placeholder 感**，让仓库从“模板集合”变成“能直接拿来用的成品集合”
