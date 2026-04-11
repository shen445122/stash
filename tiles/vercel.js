// Vercel availability check
const url = "https://vercel.com";
const headers = { "User-Agent": "Mozilla/5.0" };

async function run() {
  try {
    const resp = await fetch(url, { method: "GET", headers, redirect: "follow" });
    const ok = resp.status >= 200 && resp.status < 400;
    return {
      title: "Vercel",
      content: ok ? "OK" : `HTTP ${resp.status}`,
      status: ok ? "success" : "error",
    };
  } catch (e) {
    return {
      title: "Vercel",
      content: String(e),
      status: "error",
    };
  }
}

module.exports = run();
