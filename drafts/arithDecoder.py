
def main():
  encode('AACBCA')
  decode(0.63215699)

def encode(text):
  l = 0
  u = 1
  for c in text:
    sz = u - l
    o = l
    if c == 'A':
      l = o + (sz*0)
      u = o + (sz*0.2)
    elif c == 'B':
      l = o + (sz*0.2)
      u = o + (sz*0.5)
    else:
      l = o + (sz*0.5)
      u = o + (sz*1)
    print(l, u)

def decode(tag):
  s = ""
  l = 0
  u = 1
  for i in range(20):
    tag = (tag - l)/(u - l)
    if 0 <= tag and tag < 0.2:
      s = s + 'A'
      l = 0
      u = 0.2
    elif 0.2 <= tag and tag < 0.5:
      s = s + 'B'
      l = 0.2
      u = 0.5
    else:
      s = s + 'C'
      l = 0.5
      u = 1
  print(s)

if __name__ == "__main__":
    main()