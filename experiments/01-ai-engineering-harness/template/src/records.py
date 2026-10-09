from src.customer_policy import load_customer_policy


def select_processable_records(records):
    """Return processable records as detached dictionaries, preserving input order."""
    policy = load_customer_policy()  # A required local policy; never assume its content.
    return [
        dict(record)
        for record in records
        if record.get("status") == policy["processable_status"]
    ]
