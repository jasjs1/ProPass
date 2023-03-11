local passwordForVaulting
local doesPasswordExpire
local otherNotes

local function storeAndValidatePassword()
    print("") -- Spacer

    io.write("Password for vaulting: ")
    local passwordForVaulting = io.read()

    print("")
    print("Extra Information:")
    print("")

    io.write("Does password expire: ")
    local doesPasswordExpire = io.read()

    io.write("Other notes: ")
    local otherNotes = io.read()

    print("")
    print("")

    print("Validate that the info below is correct.")

    print("")

    print("Password: " .. passwordForVaulting)
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
        file:write("Does password expire: " .. doesPasswordExpire .. "\n")
        file:write("Other notes: " .. otherNotes .. "\n")
        file:write("Date created: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")
        file:write("Date modified: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")
        file:write("\n")

        file:close()

        print("File created! Check the explorer for: passwordVault-prem.txt")
    end
end

local subscriptionFile = io.open("subscriptionInfo.txt")

if subscriptionFile == nil then
    print("You need a ProPass Premium subscription to use Vault+. Please create a subscription to use this.")
    print("Type '!help' to get more information.")

    local input = io.read()

    if input == "!help" then
        print("")
        print("Folder path for Premium: premium/getPremium.lua")
        print("")
        return
    end
else
    subscriptionFile:close()
    storeAndValidatePassword()
end

