// ChatGPT Web availability check
const url = "https://chatgpt.com";
const headers = { "User-Agent": "Mozilla/5.0" };

async function run() {
  try {
    const resp = await fetch(url, { method: "GET", headers });
    const ok = resp.status >= 200 && resp.status < 400;
    return {
      title: "ChatGPT Web",
      icon: "https://fastly.jsdelivr.net/gh/StashNetworks/misc@main/collapsed-tiles/img/chatgpt.png",
      content: ok ? "OK" : `HTTP ${resp.status}`,
      status: ok ? "success" : "error",
    };
  } catch (e) {
    return {
      title: "ChatGPT Web",
      content: String(e),
      status: "error",
    };
  }
}

module.exports = run();
