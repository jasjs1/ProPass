local function fetchTotalMoney()
    local file = io.open("totalMoney.txt", "r")

    if file then
    
      local moneyContents = file:read("*all")
    
      file:close()
      return tonumber(moneyContents)
    else
      print("Error: unable to open file")
      return nil
    end
end

-- print("")
-- print("Total money remaning: " .. totalMoney)
-- print("")

local function sendMoney()
    local totalMoney = fetchTotalMoney()
    
    if not totalMoney then
      print("Unable to fetch total money")
      return
    end
    
    io.write("User: ")
    local user = io.read()

    io.write("Total amount: $")
    local totalAmountSubtracted = io.read()
    local subtractedTotalMoney = totalMoney - totalAmountSubtracted
    print(subtractedTotalMoney)
end

local premiumFile = io.open("subscriptionInfo.txt")

if premiumFile ~= nil then
    sendMoney()
else
    print("")
    print("A subscirption is required to use all aspects of ProPass Digitial Wallet")
    print("")
    return
end
