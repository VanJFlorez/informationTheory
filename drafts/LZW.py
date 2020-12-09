def main():
  decode([4, 1, 5, 5, 6, 3, 14, 11, 14, 16, 7, 4, 7, 3, 2, 7, 3, 22, 22])
def decode(data):
  table = ['E','L','_','P','R','O','A','D','G','U']

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