
io.write("Enter your Master Password: ")
local masterPassword = io.read()


local function isMasterPasswordCorrect(password)

    local savedMasterPasswordFile = io.open("MasterPassword.txt", "r")
    local savedMasterPassword = savedMasterPasswordFile:read()

    savedMasterPasswordFile:close()
    return password == string.match(savedMasterPassword, "Master Password: (%w+)")

end


if isMasterPasswordCorrect(masterPassword) then

    print("Login successful")

    local logFile = io.open("MasterPasswordLog.txt", "a")
    logFile:write(os.date("%c") .. ": Master Password logged in\n")
    logFile:close()

else
    print("Incorrect Master Password")
end

local function writeDataToFile()

    local masterPasswordFile = io.open("MasterPassword.txt", "w")
    
    masterPasswordFile:write("Master Password: " .. masterPassword .. "\n")
    masterPasswordFile:write("Date Created: " .. os.date("%m_%d_%y"))
    masterPasswordFile:close()

end

writeDataToFile()
