// ChatGPT App / landing availability check
const url = "https://chatgpt.com";

async function run() {
  try {
    const resp = await fetch(url, { method: "GET" });
    const ok = resp.status >= 200 && resp.status < 400;
    return {
      title: "ChatGPT App",
      icon: "https://fastly.jsdelivr.net/gh/StashNetworks/misc@main/collapsed-tiles/img/chatgpt.png",
      content: ok ? "Reachable" : `HTTP ${resp.status}`,
      status: ok ? "success" : "error",
    };
  } catch (e) {
    return { title: "ChatGPT App", content: String(e), status: "error" };
  }
}

module.exports = run();
