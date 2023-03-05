local function fetchTotalMoney()

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
end

local premiumFile = io.open("subscriptionInfo.txt")

if premiumFile ~= nil then
    fetchTotalMoney()
else
    print("")
    print("A subscirption is required to use all aspects of ProPass Digitial Wallet")
    print("")
    return
end
