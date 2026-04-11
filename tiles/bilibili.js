// Bilibili availability check
const url = "https://www.bilibili.com";
const headers = { "User-Agent": "Mozilla/5.0" };

async function run() {
  try {
    const resp = await fetch(url, { method: "GET", headers, redirect: "follow" });
    const ok = resp.status >= 200 && resp.status < 400;
    return {
      title: "Bilibili",
      content: ok ? "OK" : `HTTP ${resp.status}`,
      status: ok ? "success" : "error",
    };
  } catch (e) {
    return {
      title: "Bilibili",
      content: String(e),
      status: "error",
    };
  }
}

module.exports = run();
