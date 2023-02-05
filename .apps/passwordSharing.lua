local function getUserInput()


    print("Username/email:")
    local username = io.read()

    print("Password: ")
    local password = io.read()

    print("Password for:")
    local passwordFor = io.read()
    
    return username, password, passwordFor

end

local username, password, passwordFor = getUserInput()

local function writeToFile()
    local file = io.open("SharePassword.txt", "w")

    file:write(username .. "\n")
    file:write(password .. "\n")
    file:write(passwordFor .. "\n")

    file:close()

end
writeToFile()
