
local file = io.open("totalMoney.txt", "r")

if file then

  local moneyContents = file:read("*all")

  print("")
  print("Total money: $" .. moneyContents)
  print("")

  file:close()
else
  print("Error: unable to open file")
end
