// Claude availability check
const url = "https://claude.ai";
const headers = { "User-Agent": "Mozilla/5.0" };
const icon = "https://cdn.simpleicons.org/anthropic";

async function run() {
  try {
    const resp = await fetch(url, { method: "GET", headers, redirect: "follow" });
    const ok = resp.status >= 200 && resp.status < 400;
    return {
      title: "Claude",
      icon,
      content: ok ? "OK" : `HTTP ${resp.status}`,
      status: ok ? "success" : "error",
    };
  } catch (e) {
    return {
      title: "Claude",
      icon,
      content: String(e),
      status: "error",
    };
  }
}

module.exports = run();
