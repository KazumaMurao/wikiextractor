import sys

output = []
for line in sys.stdin:
  output.append(line.strip())
print("\x01".join(output))
