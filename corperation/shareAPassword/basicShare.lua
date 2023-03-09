
print("")

io.write("Password to share: ")
local passwordToShare = io.read()

io.write("Web host for password: ")
local webHostForPassword = io.read()

io.write("Recipiants: ")
local recipiants = io.read()

local function validateSharedPasswordInformation()

    print("Validate that the information that you have provided below is correct.")

    print("Password to share: " .. passwordToShare)
    print("Web host: " .. webHostForPassword)
    print("Recipiants: " .. recipiants)

end
validateSharedPasswordInformation()

local function writeDataToFile()

    local file = io.open("CORP_sharedPassword.txt", "a")

    -- file:write("Date: " .. todaysDate .. "\n")
    file:write("Date created: " .. os.date("%M_%d_%y_%H_%m"))
    file:write("Password to share: " .. passwordToShare .. "\n")
    file:write("Website host: " .. webHostForPassword .. "\n")
    file:write("Recipiants: " .. recipiants  .. "\n")
    file:write(" " .. "\n")

    file:close()

    print("Corperation shared password has been created! Look for: CORP_sharedPassword.txt in the file explorer.")

end
writeDataToFile()
