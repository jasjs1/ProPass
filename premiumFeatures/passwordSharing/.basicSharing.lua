--[[
    This is the basic password sharing. If you would like to get extra fields to share. That is a subscription.
]]

local function combineFuncs()
    
    print("Email/username:")
    local emailOrUsername = io.read()

    print("Password:")
    local sharedPassword = io.read()

    print("Recipients email:")
    local recipientsEmail = io.read()

    local file = io.open("sharedPassword.txt", "w")
    file:write("Email/username: " .. emailOrUsername .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")
    file:close()

end

local function getUserInput()

    print("Email/username:")
    local emailOrUsername = io.read()

    print("Password:")
    local sharedPassword = io.read()

    print("Recipients email:")
    local recipientsEmail = io.read()

    return emailOrUsername, sharedPassword, recipientsEmail

end

local emailOrUsername, sharedPassword, recipientsEmail = getUserInput()
local function writeToFile(emailOrUsername, sharedPassword, recipientsEmail)

    local file = io.open("sharedPassword.txt", "w")
    file:write("Email/username: " .. emailOrUsername .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")
    file:close()

    print("Shared password created!")

end
writeToFile(emailOrUsername, sharedPassword, recipientsEmail)

while true do 

    print("")
    print("Type 'new' to create a new shared password")
    
    local input = io.read()

    if input == "new" then
        combineFuncs()

    elseif input == "" then
        print("Invalid input")
        -- break
    end
end
