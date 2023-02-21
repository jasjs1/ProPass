
local emailOrUsername
local password
local applicationHost
local passwordExperation
local websiteHostSecurity

local function promptUser()

    print("")

    io.write("Email/Password: ")
    emailOrUsername = io.read()

    io.write("Password: ")
    password = io.read()

    io.write("Application Host: ")
    applicationHost = io.read()

    io.write("Password Experation: ")
    passwordExperation = io.read()

    io.write("Website security: ")
    websiteHostSecurity = io.read()
end

promptUser()

local function writeData()
    local file = io.open("passwordSharingAVD.txt", "w")

    file:write("Email/username: " .. emailOrUsername .. "\n")
    file:write("Password: " .. password .. "\n")
    file:write("Application host: " .. applicationHost .. "\n")
    file:write("Password Experiation: " .. passwordExperation .. "\n")
    file:write("Website security: " .. websiteHostSecurity .. "\n")
    
    file:close()

    print("Password sharing file created. Look in the explorer. File name: passwordSharingAVD.txt")
end

writeData()
