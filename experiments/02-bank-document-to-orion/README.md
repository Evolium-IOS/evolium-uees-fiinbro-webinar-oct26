# Experiment 02 — Bank Documents → Operational System

## Goal
Show how a focused research/prototype question can reveal the need for a broader operational system.

Initial technical flow:
```text
document → identify input type → extract fields → validate → bounded repair/retry → structured result
```

Operational questions that follow:
```text
rules → context → human review → workflow → decisions → governance
```

## Upload the bank project here
Place the source under:
```text
experiments/02-bank-document-to-orion/app/
```

Before pushing to this **public repository**, remove:
- .env files;
- API keys and credentials;
- private/real bank statements;
- personal information;
- virtual environments and caches.

After upload, the source must be inspected before we define the actual local launcher. The next pass will add:
- reproducible setup;
- one-command localhost UI launcher;
- sanitized demo input;
- exact presenter runbook;
- fallback evidence/screenshots;
- student replication instructions.

Do not rewrite the project architecture before inspecting the uploaded source.
