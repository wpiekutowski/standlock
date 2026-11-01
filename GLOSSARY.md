# StandLock

A macOS menu bar app that interrupts work with full-screen breaks, enforced at a strictness the user picks per schedule.

## Language

**Break**:
A full-screen overlay on every display that the user must wait out, or dismiss in a way the Discipline Level allows.
_Avoid_: Reminder, notification

**Schedule**:
A named rule for when Breaks happen, with its own Discipline Level.

**Discipline Level**:
How hard a Break is to dismiss: Gentle, Firm or Strict. Chosen per Schedule.
_Avoid_: Strictness, mode, difficulty

**Strict**:
The Discipline Level at which the Break blocks keyboard and mouse input and only an emergency key combination ends it.

**Input Blocking**:
Preventing keyboard and mouse input for the duration of a Strict Break.

## Builds

**Standard Build**:
The unsandboxed edition of the app. It supports every feature.
_Avoid_: Full build, regular build

**Sandboxed Build**:
The edition of the app that runs inside the macOS App Sandbox, shipped as a separate direct download with its own identity and update feed. It omits features the sandbox rules out.
_Avoid_: Lite build, restricted build

**Capability**:
Something a build can or cannot do, such as Input Blocking. Features are gated by Capability, never by asking which build is running.
