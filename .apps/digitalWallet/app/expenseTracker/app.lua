local function promptUser()
    print("")

    io.write("Monthly income " .. "$")
    local monthlyIncome = tonumber(io.read())

    print("")
    print("Total spendings:")
    print("")
    io.write("Groceries: " .. "$")
    local groceries = tonumber(io.read())

    io.write("Utilities: "  .. "$")
    local utilities = tonumber(io.read())

    io.write("Rent/mortgage: " .. "$")
    local rentOrMortgage = tonumber(io.read())

    io.write("Savings: " .. "$")
    local addedToSavings = tonumber(io.read())

    io.write("Other spendings " .. "$")
    local otherSpendings = io.read()

    return monthlyIncome, groceries, utilities, rentOrMortgage, addedToSavings, otherSpendings
end

local monthlyIncome, groceries, utilities, rentOrMortgage, addedToSavings, otherSpendings = promptUser()

local leftToSpend = monthlyIncome - groceries - utilities - rentOrMortgage - addedToSavings, otherSpendings

if leftToSpend >= 1 then
    print("Left to spend: $" .. leftToSpend)
elseif leftToSpend < 0 then
    print("You went over your monthly income, by $" .. -1*leftToSpend)
    print("You could use some savings you have $" .. addedToSavings .. " from savings this month.")
end
