
local passwordForVaulting
local isPasswordShared
local doesPasswordExpire
local otherNotes

local function storePassword()

    print("") -- Spacer

    io.write("Password for vaulting: ")
    passwordForVaulting = io.read()

    print("")
    print("Extra Information:")
    print("")

    io.write("Is password shared: ")
    isPasswordShared = io.read()

    io.write("Does password expire: ")
    doesPasswordExpire = io.read()

    io.write("Other notes: ")
    otherNotes = io.read()
end

storePassword()

local function validateInformationAndWriteToFile()
    print("")
    print("")

    print("Validate that the info below is correct.")

    print("")

    print("Password: " .. passwordForVaulting)
    print("Is password shared: " .. isPasswordShared)
    print("Does password expire: " .. doesPasswordExpire)
    print("Other notes: " .. otherNotes)

    print("")
    print("Type 'yes' if the info above is correct")

    local input = io.read()

    if input == "yes" then

    -- Write data to file
    local file = io.open("passwordVault-prem.txt", "a")

    file:write("\n")
    file:write("Password: " .. passwordForVaulting .. "\n")
    file:write("Is password shared: " .. isPasswordShared .. "\n")
    file:write("Does password expire: " .. doesPasswordExpire .. "\n")
    file:write("Other notes: " .. otherNotes .. "\n")
    file:write("\n")

    file:close()

    print("File created! Check the explorer for: passwordVault-prem.txt")

    end
end

validateInformationAndWriteToFile()
