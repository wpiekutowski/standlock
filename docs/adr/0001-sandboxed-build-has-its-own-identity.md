# Sandboxed Build has its own bundle ID and appcast

The Sandboxed Build uses its own bundle ID (e.g. `com.yagizdokumaci.standlock.sandboxed`) and its own Sparkle appcast feed instead of sharing the Standard Build's identity. A Sparkle update that flipped an installed app from unsandboxed to sandboxed would move its UserDefaults into a fresh container and silently lose the user's schedules and statistics, so a separate identity keeps the user's choice sticky and needs no data migration. We rejected sharing the bundle ID with a migration step as fragile and surprising.

## Consequences

- The two builds can be installed side by side and do not share data or permission grants.
- The release pipeline needs a second appcast. This is follow-up work, out of scope for the initial sandbox work.
