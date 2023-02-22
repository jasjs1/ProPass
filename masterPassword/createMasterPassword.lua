io.write("Master Password: ")
local masterPassword = io.read()

local function writeDataToFile()
    local masterPasswordFile = io.open("MasterPassword.txt", "w")
    
    masterPasswordFile:write("Master Password: " .. masterPassword .. "\n")
    masterPasswordFile:write("Date Created: " .. os.date("%m_%d_%y"))
    
    masterPasswordFile:close()
end

writeDataToFile()
