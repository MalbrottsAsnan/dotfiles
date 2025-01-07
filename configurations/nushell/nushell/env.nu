# env.nu
#
# Installed by:
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Configure starship (https://starship.rs/guide/)
mut starship_cfg_dir = ""

if "XDG_CONFIG_HOME" in $env {
	$starship_cfg_dir = $env.XDG_CONFIG_HOME
} else {
	$starship_cfg_dir = $env.HOME | path join ".config"
}

$env.STARSHIP_CONFIG = $starship_cfg_dir | path join "starship/starship.toml"

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
