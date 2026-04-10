// Claude availability check\nconst url = \"https://claude.ai\";\n\nasync function run() {\n  try {\n    const resp = await fetch(url, { method: \"GET\" });\n    const ok = resp.status >= 200 && resp.status < 400;\n    return {\n      title: \"Claude\", \n      content: ok ? \"Available\" : `HTTP ${resp.status}`,\n      status: ok ? \"success\" : \"error\"\n    };\n  } catch (e) {\n    return { title: \"Claude\", content: String(e), status: \"error\" };\n  }\n}\n\nmodule.exports = run();\nEOF

# 2. Create gemini.js with actual check logic
cat << 'EOF' > /Users/shen.szr/.openclaw/workspace/stash/tiles/gemini.js
// Gemini availability check\nconst url = \"https://gemini.ai\";\n\nasync function run() {\n  try {\n    const resp = await fetch(url, { method: \"GET\" });\n    const ok = resp.status >= 200 && resp.status < 400;\n    return {\n      title: \"Gemini\", \n      content: ok ? \"Available\" : `HTTP ${resp.status}`,\n      status: ok ? \"success\" : \"error\"\n    };\n  } catch (e) {\n    return { title: \"Gemini\", content: String(e), status: \"error\" };\n  }\n}\n\nmodule.exports = run();\nEOF

# 3. Create github.js with actual check logic
cat << 'EOF' > /Users/shen.szr/.openclaw/workspace/stash/tiles/github.js
// GitHub availability check\nconst url = \"https://github.com\";\n\nasync function run() {\n  try {\n    const resp = await fetch(url, { method: \"GET\" });\n    const ok = resp.status >= 200 && resp.status < 400;\n    return {\n      title: \"GitHub\", \n      content: ok ? \"Available\" : `HTTP ${resp.status}`,\n      status: ok ? \"success\" : \"error\"\n    };\n  } catch (e) {\n    return { title: \"GitHub\", content: String(e), status: \"error\" };\n  }\n}\n\nmodule.exports = run();\nEOF

# 4. Create bilibili.js with actual check logic
cat << 'EOF' > /Users/shen.szr/.openclaw/workspace/stash/tiles/bilibili.js
// Bilibili availability check\nconst url = \"https://www.bilibili.com\";\n\nasync function run() {\n  try {\n    const resp = await fetch(url, { method: \"GET\" });\n    const ok = resp.status >= 200 && resp.status < 400;\n    return {\n      title: \"Bilibili\", \n      content: ok ? \"Available\" : `HTTP ${resp.status}`,\n      status: ok ? \"success\" : \"error\"\n    };\n  } catch (e) {\n    return { title: \"Bilibili\", content: String(e), status: \"error\" };\n  }\n}\n\nmodule.exports = run();\nEOF

# 如果一切成功，进行 git 提交
cd /Users/shen.szr/.openclaw/workspace/stash
git add tiles/claude.js tiles/gemini.js tiles/github.js tiles/bilibili.js
if git diff --cached --quiet; then
  echo 'No changes to commit.'
else
  git commit -m "Implement functional checks for Claude, Gemini, GitHub, and Bilibili"
  git push origin HEAD
  echo 'DONE'
  git rev-parse --short HEAD
fi