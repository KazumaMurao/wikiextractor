import sys

for line in sys.stdin:
  s = set(line.strip().split(" "))
  print(" ".join(list(s)))
