import unittest

from src.records import select_processable_records


class SelectProcessableRecordsTests(unittest.TestCase):
    def test_returns_ready_record(self):
        rows = [{"customer_id": "C-001", "email": "a@example.com", "amount": 25, "status": "ready"}]
        self.assertEqual(select_processable_records(rows), rows)

    def test_excludes_pending_record(self):
        rows = [{"customer_id": "C-001", "email": "a@example.com", "amount": 25, "status": "pending"}]
        self.assertEqual(select_processable_records(rows), [])

    def test_preserves_order(self):
        rows = [
            {"customer_id": "C-002", "status": "ready"},
            {"customer_id": "C-001", "status": "ready"},
        ]
        self.assertEqual(
            [row["customer_id"] for row in select_processable_records(rows)],
            ["C-002", "C-001"],
        )

    def test_returns_detached_dicts(self):
        rows = [{"customer_id": "C-001", "status": "ready"}]
        result = select_processable_records(rows)
        self.assertIsNot(result[0], rows[0])

    def test_does_not_mutate_input(self):
        rows = [{"customer_id": "C-001", "status": "ready"}]
        snapshot = [dict(row) for row in rows]
        select_processable_records(rows)
        self.assertEqual(rows, snapshot)

    def test_preserves_zero_amount(self):
        rows = [{"customer_id": "C-001", "amount": 0, "status": "ready"}]
        self.assertEqual(select_processable_records(rows)[0]["amount"], 0)

    def test_handles_empty_input(self):
        self.assertEqual(select_processable_records([]), [])

    def test_excludes_missing_customer_id(self):
        rows = [{"email": "missing@example.com", "amount": 50, "status": "ready"}]
        self.assertEqual(select_processable_records(rows), [])


if __name__ == "__main__":
    unittest.main()
