# Mac OS X Screenshot Location

Change the default location of screenshots to `~/Pictures/Screenshots` instead
of `~/Desktop`.

```bash
defaults write com.apple.screencapture location /Users/loganleger/Pictures/Screenshots
killall SystemUIServer
```
