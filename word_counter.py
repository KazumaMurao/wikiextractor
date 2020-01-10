import sys
from collections import Counter

if len(sys.argv) > 1:
  cutoff = int(sys.argv[1])
else:
  cutoff = -1

c = Counter()

for line in sys.stdin:
  c.update(line.strip().split(" "))

n = 0

for key, val in c.most_common():
  if val < cutoff:
    break
  if "\x01" not in key:
    sys.stdout.write("\t".join([str(n), key, str(val)]) + "\n")
    n += 1
