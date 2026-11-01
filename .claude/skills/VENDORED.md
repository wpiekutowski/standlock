# Vendored skills

The skill folders in this directory are copied verbatim from Matt Pocock's
[mattpocock/skills](https://github.com/mattpocock/skills) repository. They are
the full set the upstream Claude Code plugin (`mattpocock-skills`) publishes,
as listed in its `.claude-plugin/plugin.json`. Claude Code loads them as
project skills, so everyone working in this repo gets the same versions.

- Source: https://github.com/mattpocock/skills
- Tag: `v1.3.2`
- Commit: `d1478fcb140db0b93c0c8df17bcfd311844749d0`
- License: MIT, see [LICENSE.mattpocock-skills](LICENSE.mattpocock-skills)

Do not edit the vendored folders in place. Local changes are lost on the next
update and make the diff against upstream hard to read. If a skill needs to
behave differently here, put the rule in `AGENTS.md`, or copy the skill under a
new name and say so below.

If you also have the `mattpocock-skills` plugin installed, every skill shows up
twice (once plain, once as `mattpocock-skills:<name>`). Uninstall the plugin or
ignore the duplicates.

## Skills

Engineering: `ask-matt`, `code-review`, `codebase-design`, `diagnosing-bugs`,
`domain-modeling`, `grill-with-docs`, `implement`, `implement-spec`,
`improve-codebase-architecture`, `pr`, `prototype`, `research`, `retro`,
`setup-matt-pocock-skills`, `tdd`, `to-spec`, `to-tickets`, `triage`,
`wayfinder`, `wizard`.

Productivity: `grill-me`, `grilling`, `handoff`, `teach`, `to-questionnaire`,
`wait-what`, `writing-for-agents`.

## Updating

Pick a release tag upstream, then from the repo root:

```bash
TAG=v1.3.2   # the new tag
SRC=$(mktemp -d)
git -c advice.detachedHead=false clone --quiet --depth 1 --branch "$TAG" https://github.com/mattpocock/skills.git "$SRC"
find .claude/skills -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
for s in $(python3 -c "import json,sys; print(' '.join(json.load(open(sys.argv[1]))['skills']))" "$SRC/.claude-plugin/plugin.json"); do
  cp -R "$SRC/$s" .claude/skills/
done
cp "$SRC/LICENSE" .claude/skills/LICENSE.mattpocock-skills
git -C "$SRC" rev-parse HEAD   # put this and the tag above
rm -rf "$SRC"
```

Then update the tag, commit and skill list in this file, review the diff, and
commit the result as one change.
