local function reciveMoney()
    io.write("User: ")
    local user = io.read()

    io.write("Money Recived: $")
    local moneyRecvied = io.read()

    local function addMoneyToAccount(totalMoney)
        local totalMoney = totalMoney + moneyRecvied 

        local file = io.open("totalMoney.txt", "w")
        file:write(totalMoney)
        file:close()
    end

    -- initialize totalMoney to a default value
    local totalMoney = 0
    addMoneyToAccount(totalMoney)

    print("Total money after money recived: " .. "$" .. totalMoney)
end

local premiumFile = io.open("subscriptionInfo.txt")

if premiumFile ~= nil then
    reciveMoney()
else
    print("")
    print("A subscirption is required to use all aspects of ProPass Digitial Wallet")
    print("")
    return
end
