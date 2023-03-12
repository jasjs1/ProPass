io.write("Master Password: ")
local masterPassword = tonumber(io.read())

if not masterPassword or masterPassword < 8 or length > 100 then
    print("Invalid Master Password length. Please add a length of from 8 to 100 characters")
    return
end

local function writeDataToFile()
    local masterPasswordFile = io.open("MasterPassword.txt", "w")
    
    masterPasswordFile:write("Master Password: " .. masterPassword .. "\n")
    masterPasswordFile:write("Date created: " .. os.date('%Y-%m-%d %H:%M:%S'))
    masterPasswordFile:write("Date modified: " .. os.date('%Y-%m-%d %H:%M:%S'))
    
    masterPasswordFile:close()

    print("Master password file created! File name: MasterPassword.txt")
end

writeDataToFile()
