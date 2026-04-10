// GitHub availability check\nconst url = \"https://github.com\";\n\nasync function run() {\n  try {\n    const resp = await fetch(url, { method: \"GET\" });\n    const ok = resp.status >= 200 && resp.status < 400;\n    return {\n      title: \"GitHub\", \n      content: ok ? \"Available\" : `HTTP ${resp.status}`,\n      status: ok ? \"success\" : \"error\"\n    };\n  } catch (e) {\n    return { title: \"GitHub\", content: String(e), status: \"error\" };\n  }\n}\n\nmodule.exports = run();\nEOF

# 2. Create bilibili.js with actual check logic
cat << 'EOF' > /Users/shen.szr/.openclaw/workspace/stash/tiles/bilibili.js
// Bilibili availability check\nconst url = \"https://www.bilibili.com\";\n\nasync function run() {\n  try {\n    const resp = await fetch(url, { method: \"GET\" });\n    const ok = resp.status >= 200 && resp.status < 400;\n    return {\n      title: \"Bilibili\", \n      content: ok ? \"Available\" : `HTTP ${resp.status}`,\n      status: ok ? \"success\" : \"error\"\n    };\n  } catch (e) {\n    return { title: \"Bilibili\", content: String(e), status: \"error\" };\n  }\n}\n\nmodule.exports = run();\nEOF

# 确保文件成功创建后再进行 Git 提交
cd /Users/shen.szr/.openclaw/workspace/stash
git add tiles/github.js tiles/bilibili.js
if git diff --cached --quiet; then
  echo 'No changes to commit.'
else
  git commit -m "Implement functional checks for GitHub and Bilibili"
  git push origin HEAD
  echo 'DONE'
  git rev-parse --short HEAD
fi