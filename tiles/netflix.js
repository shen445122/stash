// Netflix availability check
const url = "https://www.netflix.com";

async function run() {
  try {
    const resp = await fetch(url, { method: "GET" });
    const ok = resp.status >= 200 && resp.status < 400;
    return {
      title: "Netflix",
      icon: "https://fastly.jsdelivr.net/gh/StashNetworks/misc@main/collapsed-tiles/img/netflix.png",
      content: ok ? "OK" : `HTTP ${resp.status}`,
      status: ok ? "success" : "error",
    };
  } catch (e) {
    return { title: "Netflix", content: String(e), status: "error" };
  }
}

module.exports = run();
