io.write("Total money: $")
local totalMoney = io.read()

local file = io.open("totalMoney.txt", "w")

file:write(totalMoney)
file:close()
