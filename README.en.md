# fiction-prose-jp

A fiction-writing rulebook skill for Claude Code and Codex, written in Japanese. It removes the tell-tale "AI smell" from Japanese novel prose — metronome-like chains of short sentences, hollow intensifiers, mood summaries — and goes beyond style: it also manages continuity (inventory, time, distances, and what each character actually knows), enforces a three-point check on every judgement sentence (grounds, how the character learned it, and scope), and ships a mechanical post-writing checklist.

This is a short English summary. All content and the primary README are in Japanese: [README.md](README.md).

## Install

Copy the folder under `skills/` into Claude Code's `~/.claude/skills/` or Codex's `$HOME/.agents/skills/`. An existing skill with the same name is overwritten.

Windows (PowerShell):

```powershell
# Claude Code (no argument; the existing default)
powershell -ExecutionPolicy Bypass -File .\install.ps1
# Codex
powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target codex
# Both
powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target both
```

Mac / Linux:

```sh
# Claude Code (no argument; the existing default)
sh install.sh
# Codex
sh install.sh codex
# Both
sh install.sh both
```

When a request matches a skill's `description`, Claude Code and Codex can load it automatically. Claude Code can invoke it explicitly with `/fiction-prose-jp`; Codex uses `$skill-name` (for example, `$fiction-prose-jp`), and `/skills` lists the available skills. Restart the relevant host if the installation is not reflected.

## License

Custom source-available license — free to use for personal or commercial work (your writing is yours), but redistributing, republishing, or selling the files themselves is not permitted. See [LICENSE](LICENSE) (Japanese text is authoritative).
