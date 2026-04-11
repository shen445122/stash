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

这些脚本已经从 `TODO` 占位提升到**真实可运行的可用检查版本**。

### 仍待继续升级的脚本
- `grok.js`
- `perplexity.js`
- `disneyplus.js`
- `primevideo.js`
- `stackoverflow.js`
- `anthropic.js`

下一批优先建议：
- `perplexity.js`
- `stackoverflow.js`
- `anthropic.js`
- `primevideo.js`

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

---

## 后续优化建议

如果继续往“精美实用”推进，优先级建议是：

1. **继续把第二批 tile 脚本做成真实检查逻辑**
2. **补 icon / 文案统一风格**，让整个面板更整洁
3. **增加每类配置的截图或效果说明**，提高可读性
4. **逐步减少 placeholder 感**，让仓库从“模板集合”变成“能直接拿来用的成品集合”
