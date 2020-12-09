def main():
  decode([6,3,4,5,2,3,1,6,2,9,11,16,12,14,4,20,10,8,23,13])

def decode(data):
  table = ['A','_','H','I','S','T']

  w = ""
  chark = ""
  out = ""
  for i in data:
    chark = table[i - 1][0]
    if w != "":
      table.append(w + chark)
    out = out + table[i - 1]
    w = table[i - 1]
  print(out)

if __name__ == "__main__":
    main()