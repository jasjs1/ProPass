io.write("Total money: $")
local totalMoney = io.read()

local file = io.open("totalMoney.txt", "w")

file:write(totalMoney .. "\n")
file:write("Audit date" .. os.date("%M_%d_%y_%H_%M_%S") .. "\n")
file:close()

print("Total remaning money: " .. "$" .. totalMoney)
