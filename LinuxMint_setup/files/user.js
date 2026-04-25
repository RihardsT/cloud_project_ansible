// https://support.mozilla.org/en-US/kb/about-config-editor-firefox
user_pref("browser.bookmarks.restore_default_bookmarks", false);
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand", true);
// Not sure if this will work
user_pref("browser.search.defaultenginename", "DuckDuckGo"); // DuckDuckGo or Google
user_pref("browser.search.selectedEngine", "DuckDuckGo"); // DuckDuckGo or Google

// To enable loading custom stylesheet, to expand Edit Bookmarks menu
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// https://www.reddit.com/r/FirefoxCSS/comments/g30phz/expand_all_bookmark_folders_on_new_bookmark_edit/
user_pref("browser.bookmarks.editDialog.firstEditField", "foldersExpander"); // Default: namePicker
