# stash

Stash 自用配置与示例集合。

## 当前内容

### 折叠面板配置
- `collapsed-tiles.stoverride`：基础折叠面板示例
- `ai-tools.stoverride`：AI 工具折叠面板
- `streaming.stoverride`：流媒体折叠面板
- `developer-sites.stoverride`：开发者站点折叠面板

### 对应示例
- `examples/collapsed-tiles.yaml`
- `examples/ai-tools.yaml`
- `examples/streaming.yaml`
- `examples/developer-sites.yaml`

### 本仓库自托管脚本
- `tiles/*.js`

## 说明

当前所有配置文件里引用的 `script-providers` 都已经改为指向本仓库内的 JS 文件，不再依赖外部仓库脚本。

推荐 raw 链接格式：

```text
https://raw.githubusercontent.com/shen445122/stash/main/<file>
```

例如：

```text
https://raw.githubusercontent.com/shen445122/stash/main/collapsed-tiles.stoverride
```
