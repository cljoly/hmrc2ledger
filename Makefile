.PHONY: test
test:
	gawk -f hmrc2ledger.awk <exrates-monthly-1221.csv | ledger -f - >/dev/null
