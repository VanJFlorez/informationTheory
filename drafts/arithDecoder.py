
def main():
  encode('COMOCOCO')
  decode(0.687)

def encode(text):
  l = 0
  u = 1
  for c in text:
    sz = u - l
    o = l
    if c == 'M':
      l = o + (sz*0)
      u = o + (sz*0.125)
    elif c == 'C':
      l = o + (sz*0.125)
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
    if 0 <= tag and tag < 0.125:
      s = s + 'M'
      l = 0
      u = 0.125
    elif 0.125 <= tag and tag < 0.5:
      s = s + 'C'
      l = 0.125
      u = 0.5
    else:
      s = s + 'O'
      l = 0.5
      u = 1
  print(s)

if __name__ == "__main__":
    main()