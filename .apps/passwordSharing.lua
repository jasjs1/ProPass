--[[
    This is the basic password sharing. If you would like to get extra fields to share. That is a subscription.
]]

local function combineFuncs()
    
    io.write("Account email/username: ")
    local emailOrUsername = io.read()

    io.write("Password: ")
    local sharedPassword = io.read()

    io.write("Recipients email: ")
    local recipientsEmail = io.read()

    local file = io.open("sharedPassword.txt", "w")
    file:write("Email/username: " .. emailOrUsername .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")
    file:close()

end

local function getUserInput()

    io.write("Email/username: ")
    local emailOrUsername = io.read()

    io.write("Password: ")
    local sharedPassword = io.read()

    io.write("Recipients email: ")
    local recipientsEmail = io.read()

    io.write("What site is the password used on: ")
    local passwordWebHost = io.read()

    return emailOrUsername, sharedPassword, recipientsEmail, passwordWebHost
end

local emailOrUsername, sharedPassword, recipientsEmail, passwordWebHost = getUserInput()
local function writeToFile(emailOrUsername, sharedPassword, recipientsEmail, passwordWebHost)

    local file = io.open("sharedPassword.txt", "w")
    file:write("Email/username: " .. emailOrUsername .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")
    file:write("Password is used on: " .. passwordWebHost .. "\n")
    file:close()

    print("Shared password created!")

end
writeToFile(emailOrUsername, sharedPassword, recipientsEmail, passwordWebHost)

while true do 

    print("")
    print("Type 'new' to create a new shared password")
    print("")

    
    local input = io.read()

    if input == "new" then
        combineFuncs()

    elseif input == "" then
        print("Invalid input")
        -- break
    end
end
