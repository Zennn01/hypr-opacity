# hypr-opacity

Toggle Hyprland window opacity at runtime.

Transparent mode uses:

- Active opacity: `0.85`
- Inactive opacity: `0.75`
- Normal mode: `1.0 / 1.0`

Uses `hyprctl eval`, required by Hyprland 0.56+ Lua configs. No config reload needed.

## Requirements

- Hyprland 0.56+
- `hyprctl`
- POSIX shell
- Optional: `notify-send` for notifications

## Install

Clone repo, then run:

```sh
./install.sh
```

Installer copies command to:

```text
~/.local/bin/hypr-opacity-mode
```

Installer backs up existing target as:

```text
~/.local/bin/hypr-opacity-mode.backup.YYYYMMDDHHMMSS
```

## Usage

```sh
~/.local/bin/hypr-opacity-mode toggle
~/.local/bin/hypr-opacity-mode transparent
~/.local/bin/hypr-opacity-mode normal
```

State is saved at:

```text
~/.local/state/hypr-opacity-mode
```

## Keybind

Add this to your Hyprland Lua keybind module:

```lua
hl.bind("SUPER + O", hl.dsp.exec_cmd("$HOME/.local/bin/hypr-opacity-mode toggle"))
```

If `$HOME` is not expanded by your dispatcher, use the absolute path:

```lua
hl.bind("SUPER + O", hl.dsp.exec_cmd("/home/YOUR_USERNAME/.local/bin/hypr-opacity-mode toggle"))
```

## Uninstall

From this repository:

```sh
./uninstall.sh
```

Uninstall removes command only. It leaves state file and backups untouched.

## Tuning

Edit values in `hypr-opacity-mode`:

```sh
active_opacity = 0.85
inactive_opacity = 0.75
```

Higher value means more opaque. `1.0` means fully opaque.
