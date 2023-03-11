local subscriptionService
local recipiantsEmail
local subscriptionType 

local subscriptionEmail
local subscriptionPassword 


local function storeAndWrite()
    print("")

    io.write("Subscription serivce website: ")
    subscriptionService = io.read()

    io.write("Recipiants email: ")
    recipiantsEmail = io.read()
    
    io.write("Subscription type (monthly, yearly, ect): ")
    subscriptionType = io.read()

    print("")
    print("Account settings:")
    print("")

    io.write("Subscription email: ")
    subscriptionEmail = io.read()

    io.write("Password: ")
    subscriptionPassword = io.read()

    -- Validate that the info is correct:

    print("") -- spacer
    print("") -- spacer
    print("Validate that the info below is correct.")

    print("Subscripton service website: " .. subscriptionService)
    print("Recipiants email: " .. recipiantsEmail)
    print("Subscripton Type: " .. subscriptionType)

    print("--Account Settings--")
    
    print("Subscription email: " .. subscriptionEmail)
    print("Password: " .. subscriptionPassword)
    print("Type yes if the info is correct")

    local input = io.read()

    if input == "yes" then

        local file = io.open("subscriptionService_vault-shared.txt", "a")

        file:write("\n")
        file:write("Subscription service website: " .. subscriptionService .. "\n")
        file:write("Recipiants email: " .. recipiantsEmail .. "\n")
        file:write("Subscription type: " .. subscriptionType .. "\n")
        file:write("Subscription email: " .. subscriptionEmail .. "\n")
        file:write("Password: " .. subscriptionPassword .. "\n")
        file:write("Date created: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")
        file:write("Date modified: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")
        file:write("\n")

        file:close()
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
    storeAndWrite()
end
