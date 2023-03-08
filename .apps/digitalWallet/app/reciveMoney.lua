local function receiveMoney()
    io.write("User: ")
    local user = io.read()

    io.write("Money Received: $")
    local moneyReceived = io.read()

    local function addMoneyToAccount(totalMoney)
        local newTotalMoney = totalMoney + moneyReceived 

        local file = io.open("totalMoney.txt", "w")
        file:write(newTotalMoney)
        file:close()

        return newTotalMoney
    end

    -- initialize totalMoney to a default value
    local totalMoney = 0
    local newTotalMoney = addMoneyToAccount(totalMoney)

    print("Total money: $" .. newTotalMoney)
end

local premiumFile = io.open("subscriptionInfo.txt")

if premiumFile ~= nil then
    receiveMoney()
else
    print("")
    print("A subscription is required to use all aspects of ProPass Digital Wallet")
    print("")
    return
end
