# NeoVim Configuration!

A custom configuration for NeoVim that fulfills what I need and want out of NeoVim (for the moment).

All plugins are logically separated for `lua` being where items are fetched, and initial configuration happens, and `after` where plugins are configured and setup.

This is done to ensure that if a plugin has a loading issue, it doesn't affect all keybinds and other plugins.
