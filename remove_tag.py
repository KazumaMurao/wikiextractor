import sys
import re

pettern = re.compile(r"^<[^>]*>$")
output = []
for line in sys.stdin:
  line = line.strip()
  if line == "</doc>":
    print("\x01".join(output))
    output = []
  else:
    output.append(re.sub(pettern, '', line))
