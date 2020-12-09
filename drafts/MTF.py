from collections import deque

def main():
  encode("banana")
  encode("comococo")

def encode(text):
  ll = deque(['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'])
  out = []
  for c in text:
    i = ll.index(c)
    ll.remove(c)
    ll.appendleft(c)
    out.append(i)
  print(out)
  
if __name__ == "__main__":
    main()