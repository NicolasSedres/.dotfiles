function handleCreated(tab) {
  if (tab.url === "about:newtab") {
    const redirectURL = "https://nicolassedres.github.io/";
    browser.tabs.update(tab.id, { url: redirectURL });
  }
}
browser.tabs.onCreated.addListener(handleCreated);

