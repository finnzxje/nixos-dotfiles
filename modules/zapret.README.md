# Zapret Module Notes

This file documents how `modules/zapret.nix` is currently configured.

## Current design

- Module file: `modules/zapret.nix`
- Enable flag in host config: `zapret.enable = true;`
- Hostlist path used by params: `/var/lib/zapret/hostlist.txt`
- Service user: `root` (forced in module to avoid hostlist permission issues)

## Why these path variables exist

In `modules/zapret.nix`:

- `SHARE_PATH` points to zapret package data in Nix store.
- `QUICK_INITIAL` points to fake QUIC packet template shipped by zapret.
- `CLIENT_HELLO` points to fake TLS ClientHello template shipped by zapret.

These replace invalid hardcoded paths like `/zapret/fake/...`.

## One-time local setup

Create private hostlist directory and file:

```bash
sudo mkdir -p /var/lib/zapret
sudo chown finnzxje:finnzxje /var/lib/zapret
sudo chmod 700 /var/lib/zapret

sudo touch /var/lib/zapret/hostlist.txt
sudo chown finnzxje:finnzxje /var/lib/zapret/hostlist.txt
sudo chmod 600 /var/lib/zapret/hostlist.txt
```

Edit hostlist (one domain per line):

```bash
nvim /var/lib/zapret/hostlist.txt
```
