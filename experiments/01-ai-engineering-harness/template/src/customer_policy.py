"""Mandatory runtime business policy for the demo; never silently substitute defaults."""

import json
from pathlib import Path

POLICY_FILE = Path(__file__).resolve().parent.parent / "config" / "customer_policy.json"


def load_customer_policy():
    """Read the active policy on each call so the local file remains authoritative."""
    with POLICY_FILE.open("r", encoding="utf-8") as source:
        policy = json.load(source)

    if (
        not isinstance(policy, dict)
        or not isinstance(policy.get("processable_status"), str)
        or not isinstance(policy.get("customer_id_regex"), str)
        or not isinstance(policy.get("reserved_customer_ids"), list)
        or not all(isinstance(value, str) for value in policy["reserved_customer_ids"])
    ):
        raise ValueError("Invalid customer policy schema")
    return policy
