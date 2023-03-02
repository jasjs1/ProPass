--[[
    This is the advanced password sharing. If you would less fields to have. Please go to the .basicSharing.lua to do so.
]]

local function getUserInputAndWriteDataToFileCombine()

    io.write("Account email/username: ")
    local emailOrUsername = io.read()

    io.write("Password: ")
    local sharedPassword = io.read()

    io.write("Recipients email: ")
    local recipientsEmail = io.read()

    io.write("Application host: ")
    local applicationHost = io.read()

    io.write("Password experation date (if one): ")
    local passwordExperation = io.read()

    local file = io.open("sharedPasswordADVANCED.txt", "a")


    file:write("Email/username: " .. emailOrUsername .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")
    file:write("Application host: " .. applicationHost .. "\n")
    file:write("Password experation: " .. passwordExperation .. "\n")
    file:write("Date created: " .. os.date("%M_%d_%y_%H_%m") .. "\n")
    file:write("" .. "\n")
    file:close()

    print("Shared password created!")

end
getUserInputAndWriteDataToFileCombine()

while true do 

    print("")
    print("Type 'new' to create a new shared password")
    
    local input = io.read()

    if input == "new" then
        getUserInputAndWriteDataToFileCombine()

    elseif input == "" then
        print("Invalid input")
        -- break
    end
end
