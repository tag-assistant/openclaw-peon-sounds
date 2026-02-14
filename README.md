# peon-sounds 🐗

Game character voice lines for your OpenClaw agent. Hear your agent working from across the room using [peon-ping](https://peonping.com) — 57+ sound packs including Warcraft, StarCraft, Portal, TF2, and more.

## Install

1. Install peon-ping:
```bash
brew install PeonPing/tap/peon-ping
peon-ping-setup
```

2. Add this skill to OpenClaw:
```bash
# Copy to your skills directory
cp -r . ~/.openclaw/workspace/skills/peon-sounds
```

## Usage

Tell your agent:
- *"Play a peon sound"*
- *"Let me know when you're done"* → plays completion sound
- *"Peon mode"* → sounds for the session

Or call directly:
```bash
bash play.sh complete    # "Work, work." / "Okie dokie."
bash play.sh greeting    # "Ready to work?"
bash play.sh permission  # "Something need doing?"
bash play.sh error       # "Me not that kind of orc!"
```

## Sound Packs

Switch packs with `peon packs use <name>`. Run `peon packs list` to see all installed.

## Requirements

- macOS (uses `afplay`)
- [peon-ping](https://github.com/PeonPing/peon-ping) installed via Homebrew

## Credits

Powered by [peon-ping](https://peonping.com) and the [CESP spec](https://github.com/PeonPing/openpeon).

## License

MIT. Sound files licensed per their respective packs (see peon-ping).
