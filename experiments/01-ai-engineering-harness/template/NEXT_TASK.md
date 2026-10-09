# Task

Update `select_processable_records` so records without a valid `customer_id` do not reach the returned result.

A valid customer_id:
- exists;
- is a string;
- is not empty after trimming whitespace.

Preserve:
- public function signature;
- behavior for valid ready records;
- input order;
- input objects without mutation.

Run:
`python -m unittest discover -s tests -v`

All tests must pass.
Inspect git diff.
Do not commit.
