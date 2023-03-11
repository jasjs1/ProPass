io.write("Master Password: ")
local masterPassword = io.read()

local function writeDataToFile()
    local masterPasswordFile = io.open("MasterPassword.txt", "w")
    
    masterPasswordFile:write("Master Password: " .. masterPassword .. "\n")
    masterPasswordfile:write("Date created: " .. os.date('%Y-%m-%d %H:%M:%S'))
    masterPasswordfile:write("Date modified: " .. os.date('%Y-%m-%d %H:%M:%S'))
    
    masterPasswordFile:close()

    print("Master password file created! File name: MasterPassword.txt")

end
writeDataToFile()
