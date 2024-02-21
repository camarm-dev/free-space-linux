# Clean your linux system

This repository contains bash scripts to clean your linux system.

For the moment, these are cleaned:
- APT cache
- Unused snaps
- Cached thumbnails
- System logs

## Known issues

The script `clean/snaps.sh`, parse unused snaps to deleted them. The problem is that the word used for parsing is _`désactivé`_, a french word (because my snap is french).

To resolves this, just edit `clean/snaps.sh`:

```diff
- snap list --all | awk '/désactivé/{print $1, $3}' |
+ snap list --all | awk '/disabled/{print $1, $3}' |
```

## Sctructure

- `cleaner.sh`; Main script
- `clean/`
	- `apt.sh`; Apt cleaner script
	- `snaps.sh`; Snaps cleaner script
	- `thumbnails.sh`; Thumbnails cleaning script
	- `journal.sh`; Journal cleaning script

## Contribute

Don't hesitate to contribute to add more cleaning scripts !

