#!/usr/bin/awk -f
#
# Copyright 2022 Clément Joly
# https://cj.rs/hmrc2ledger
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# The CSV files provided by HMRC seem to only use comma separators, no quoting,
# so just a separator should be fine here
BEGIN {
	FS = ","
}

# Output
# P date symbol price
NR > 1 {
	print "P", format_date($5), "\302\243HMRC", $4, $3
	print "P", format_date($6), "\302\243HMRC", $4, $3
}


# Convert a date in European format to ISO
function format_date(eu_date)
{
	split(eu_date, date, "/")
	return (date[3] "-" date[2] "-" date[1])
}
