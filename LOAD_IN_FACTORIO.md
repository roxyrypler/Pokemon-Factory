# Loading Pokemon TCG Factory In Factorio

This guide loads the new proof-of-concept mod:

```text
PokemonTCGFactory_0.1.0
```

The mod currently adds one new crafting tab, `Pokemon TCG`, with one recipe:

```text
1 wood -> 1 Pokemon Card
```

## Requirements

- Factorio 2.0
- The folder `PokemonTCGFactory_0.1.0`
- No other mods are required

## Option 1: Copy The Mod Folder

On macOS, Factorio usually reads mods from:

```text
~/Library/Application Support/factorio/mods
```

From this repository, run:

```sh
mkdir -p "$HOME/Library/Application Support/factorio/mods"
cp -R "/Users/patrick/Documents/GitHub/Pokemon-Factory/PokemonTCGFactory_0.1.0" "$HOME/Library/Application Support/factorio/mods/"
```

Then start Factorio.

## Option 2: Symlink The Mod Folder

This is better while developing because Factorio loads the files directly from this repo. Any code changes you make here will be picked up after restarting Factorio.

```sh
mkdir -p "$HOME/Library/Application Support/factorio/mods"
ln -s "/Users/patrick/Documents/GitHub/Pokemon-Factory/PokemonTCGFactory_0.1.0" "$HOME/Library/Application Support/factorio/mods/PokemonTCGFactory_0.1.0"
```

If the symlink already exists and you want to recreate it:

```sh
rm "$HOME/Library/Application Support/factorio/mods/PokemonTCGFactory_0.1.0"
ln -s "/Users/patrick/Documents/GitHub/Pokemon-Factory/PokemonTCGFactory_0.1.0" "$HOME/Library/Application Support/factorio/mods/PokemonTCGFactory_0.1.0"
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
Pokemon Card
```

The recipe should be available from the start and should cost:

```text
1 wood
```

## If The Mod Does Not Appear

Check these things first:

- The folder name should be `PokemonTCGFactory_0.1.0`.
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
