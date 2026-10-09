def select_processable_records(records):
    """Return ready records as detached dictionaries, preserving input order."""
    return [
        dict(record)
        for record in records
        if record.get("status") == "ready"
    ]
