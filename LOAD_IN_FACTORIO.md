# Loading Pokemon TCG Factory In Factorio

This guide loads the new proof-of-concept mod:

```text
Pokemon-Factory
```

The mod currently adds a new crafting tab, `Pokemon TCG`, with proof-of-concept recipes:

```text
wood -> wood chips -> paper pulp -> paper roll -> paper sheet -> cardstock
Shipping Box
```

For now, `Disable water and electricity` is enabled by default. In this mode, mod machines do not need electricity and recipes do not need water. Item inputs are still required.

Disable `Disable water and electricity` in Factorio's startup mod settings later to test electricity and water inputs.

## Requirements

- Factorio 2.0
- The folder `Pokemon-Factory`
- No other mods are required

## Option 1: Copy The Mod Folder

On macOS, Factorio usually reads mods from:

```text
~/Library/Application Support/factorio/mods
```

From this repository, run:

```sh
mkdir -p "$HOME/Library/Application Support/factorio/mods"
cp -R "/Users/patrick/Documents/GitHub/Pokemon-Factory" "$HOME/Library/Application Support/factorio/mods/"
```

Then start Factorio.

## Option 2: Symlink The Mod Folder

This is better while developing because Factorio loads the files directly from this repo. Any code changes you make here will be picked up after restarting Factorio.

```sh
mkdir -p "$HOME/Library/Application Support/factorio/mods"
ln -s "/Users/patrick/Documents/GitHub/Pokemon-Factory" "$HOME/Library/Application Support/factorio/mods/Pokemon-Factory"
```

If the symlink already exists and you want to recreate it:

```sh
rm "$HOME/Library/Application Support/factorio/mods/Pokemon-Factory"
ln -s "/Users/patrick/Documents/GitHub/Pokemon-Factory" "$HOME/Library/Application Support/factorio/mods/Pokemon-Factory"
```

## Enable The Mod In Game

1. Launch Factorio.
2. Open `Mods` from the main menu.
3. Find `Pokemon TCG Factory`.
4. Make sure it is enabled.
5. Disable the old `PokemonTCGFactory_0.5.0` version if it appears.
6. Click `Confirm`.
7. Factorio will restart if needed.

## Check That It Loaded

Start a new freeplay game or load a test save.

Open the crafting menu and look for:

```text
Pokemon TCG
```

Inside that tab, you should see:

```text
Wood Chipper
Wood Pulper
Paper Press
Cardstock Press
Shipping Box
```

These recipes and machines should be available from the start.

## Check Paper Production

1. Craft and place a `Wood Chipper`.
2. Craft and place a `Wood Pulper`.
3. Craft and place a `Paper Press`.
4. Craft and place a `Cardstock Press`.
5. Run the chain:

```text
Wood Chipper: wood -> wood chips
Wood Pulper: wood chips -> paper pulp
Paper Press: paper pulp -> paper roll
Paper Press: paper roll -> paper sheet
Cardstock Press: paper sheets -> cardstock
```

## Check Selling

The temporary generic `Pokemon Card` has been removed, so there are currently no sellable items.

You can still craft and place a `Shipping Box` to verify the shipping UI opens. `Evaluate` should report that there are no sellable items in the box.

## If The Mod Does Not Appear

Check these things first:

- The folder name should be `Pokemon-Factory`.
- The folder should contain `info.json` directly inside it.
- The folder should be inside Factorio's `mods` directory.
- The mod targets Factorio `2.0`, so it will not load in Factorio `1.1`.
- If both old and new versions appear, disable the old `0.5.0` version.

## Useful Development Loop

When using the symlink option:

1. Edit files in this repo.
2. Quit Factorio fully.
3. Start Factorio again.
4. Check whether the mod loads.
5. If Factorio reports a prototype error, read the error message and fix the Lua file it names.

Factorio reads prototype files only during startup, so changes to `data.lua`, `info.json`, or files in `prototypes/` require a restart.
