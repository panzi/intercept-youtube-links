Intercept YouTube Links
=======================

For some stupid reason YouTube automatically plays videos on the watch page.
This makes it basically unusable to me, because I want to browse YouTube and
open many videos in tabs and then watch one tab after the other (or let it open
in the browser session for some days before I close it again).

Up until now I could force YouTube to use the flash plugin (by sending an old
Safari user agent string) and then I used the click-to-play functionallity of
Chrome/Firefox to stop flash from automatically playing. But this does not work
anymore, and neither did all the "disable YouTube autoplay" add-ons/extensions.

So I wrote this simple add-on that simply replaces all links to YouTube watch
pages with a link to a "hop-page" that provides the real link (and a video
thumbnail).

However, you will only get to the hop-page if you open the link in a new tab or
window (via middle-click/context menu/D'n'D). Otherwise the normal watch page
will still load so your normal YouTube browsing will not be disturbed (note: it
will break YouTubes fancy dynamic page loading, which cause more troubles than
good for me anyway, and revert to plain old page instead).

Installation
------------

This add-on comes in three variants: A Chrome extension, a Firefox add-on and
a user script. To install the Chrome extension you have to download the crx file
and then drop it into the extensions setting window. To use the user script on
Firefox you first need to install the [Grease Monkey][1] add-on. Chrome should
be able to install user scripts without the need for any further add-on, but I
guess you have to do the same download and drop into the extensions settings
window dance.

 * [Chrome Extension v1.0](https://github.com/panzi/intercept-youtube-links/releases/download/v1.0/intercept-youtube-links.crx)
 * [Firefox Add-on v1.0](https://github.com/panzi/intercept-youtube-links/releases/download/v1.0/intercept-youtube-links.xpi)
 * [User Script v1.0](https://github.com/panzi/intercept-youtube-links/releases/download/v1.0/intercept-youtube-links.user.js)

[1] https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/
