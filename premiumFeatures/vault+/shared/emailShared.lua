local accountUsername
local webURL
local password
local recipientEmail

local function storeAndWrite()
    io.write("Account username: ")
    accountUsername = io.read()

    io.write("Web URL: ")
    webURL = io.read()

    io.write("Password for account: ")
    password = io.read()

    io.write("Recipient email: ")
    recipientEmail = io.read()

    print("") -- spacer
    print("") -- spacer

    print("Validate that the information below is correct: ")
    print("")

    print("Account username: " .. accountUsername)
    print("Web URL: " .. webURL)
    print("Password for account: " .. password)
    print("Recipient email: " .. recipientEmail)

    print("")
    print("Type 'yes' if the information above is correct.")

    local input = io.read()

    if input == "yes" then
        local file = io.open("email_vault-shared.txt", "a")

        file:write("Account username: " .. accountUsername .. "\n")
        file:write("Web URL: " .. webURL .. "\n")
        file:write("Password for account: " .. password .. "\n")
        file:write("Recipient email: " .. recipientEmail .. "\n")
        file:write("Date created: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")
        file:write("Date modified: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")

        file:close()
        return true
    end
    return false
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
    local success = storeAndWrite()
    if success then
        print("Shared vault created. Check the explorer for: email_vault-shared.txt")
    else
        print("Information not stored.")
    end
end
