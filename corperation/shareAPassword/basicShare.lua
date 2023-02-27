
print("")

io.write("Today's date: ")
local todaysDate = io.read()

io.write("Password to share: ")
local passwordToShare = io.read()

io.write("Web host for password: ")
local webHostForPassword = io.read()

io.write("Recipiants: ")
local recipiants = io.read()

local function validateSharedPasswordInformation()

    print("Validate that the information that you have provided below is correct.")

    print("Today's date: " .. todaysDate)
    print("Password to share: " .. passwordToShare)
    print("Web host: " .. webHostForPassword)
    print("Recipiants: " .. recipiants)

end
validateSharedPasswordInformation()

local function writeDataToFile()

    local file = io.open("CORP_sharedPassword.txt", "a")

    file:write("Date: " .. todaysDate .. "\n")
    file:write("Password to share: " .. passwordToShare .. "\n")
    file:write("Website host: " .. webHostForPassword .. "\n")
    file:write("Recipiants: " .. recipiants  .. "\n")
    file:write(" " .. "\n")

    file:close()

    print("Corperation shared password has been created! Look for: CORP_sharedPassword.txt in the file explorer.")

end
writeDataToFile()
