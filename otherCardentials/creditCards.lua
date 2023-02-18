io.write("Credit card number: ")
local creditCardNumber = io.read()

io.write("Number on back of card ")
local ccBackNumber = io.read()

io.write("EXP date: ")
local expDate = io.read()

local function writeDataToFile()

    local file = io.open("CreditCardInformation.txt", "w")

    file:write(creditCardNumber, ", ")
    file:write(ccBackNumber, ", ")
    file:write(expDate, ", ")

    file:close()

    print("File has been created. Check the explorer!")

end
writeDataToFile()
