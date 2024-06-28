## Chrome Extension to Fix Unreliable Zoom Chat Browser App Notification
### How to Install
- Download the ZIP file of this repository (green button) and unzip it **OR** use git clone.
- Open Chrome and go to the URL: chrome://extensions/
- In the top right, enable "Developer mode."
- In the top left, click "Load unpacked extension," and select the folder downloaded in the first step.
### Why Are Zoom Web Version Notifications Unreliable?
Zoom web only sends web notifications when the window is explicitly minimized or the tab is switched away.  
If you have the Zoom window open in the background and unfocused (you are working in another program), notifications won't be sent (undesired).

### What This Extension Changes
Notifications for new messages will always be sent, even if the window is not explicitly minimized.

### More Notification Troubleshooting
Check that notifications for Chrome in your OS settings are enabled.  
Check that notifications for Zoom are enabled in your Chrome settings.  
Check your notifications using this tool:  
https://www.bennish.net/web-notifications.html
