# Web Development Setup

1. Install nginx with Homebrew

  $ brew install nginx

2. Install dnsmasq with Homebrew

  $ brew install dnsmasq

3. Copy `dev_resolver` to `/etc/resolver`

4. Copy `nginx.conf` and `servers` to `/usr/local/etc/nginx`

5. Copy `dnsmasq.conf` to `/usr/local/etc/dnsmasq.conf`

6. Copy nginx and dnsmasq launchctl files to `/Library/LaunchDaemons`
