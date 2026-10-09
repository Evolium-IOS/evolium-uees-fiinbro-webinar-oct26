# Experiment 01 — AI Engineering Harness

## Goal
Compare the same engineering task in:
1. a normal conversational client;
2. a coding agent working inside a scoped repository with persistent instructions, source code, tests, Git, and terminal access.

This is **not** a Claude-vs-Codex benchmark.

## Recommended live comparison
Use **Claude Desktop → Claude Code** as the primary demonstration. Use Codex as the alternate/fallback harness.

## Prepare
Run:

```powershell
.\scripts\prepare-demo.ps1
```

This creates a standalone local Git repo:

```text
C:\Evolium\webinar-experiment-01-live
```

Open only that folder in VS Code.

## Baseline
The tiny Python project has eight tests: seven pass and one intentionally fails because a ready record without a valid customer_id reaches the output.

Run:

```powershell
python -m unittest discover -s tests -v
```

Reset after rehearsal with:

```powershell
.\scripts\reset-demo.ps1
```
