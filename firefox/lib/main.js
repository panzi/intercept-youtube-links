var data = require("sdk/self").data;
var pageMod = require("sdk/page-mod");

pageMod.PageMod({
	include: ["*"],
	attachTo: ["top"],
	contentScriptWhen: "ready",
	contentScriptFile: data.url("content.js")
});
