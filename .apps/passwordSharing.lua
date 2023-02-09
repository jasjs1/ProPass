local function getUserInput()

    print("Login email: ")
    local loginEmail = io.read()

    print("Password: ")
    local password = io.read()

    print("Website/app host: ")
    local appHost = io.read()

    print("Recipiant's email: ")
    local recipiantEmail = io.read()
    
    return loginEmail, password, appHost, recipiantEmail
end

local loginEmail, password, appHost, recipiantEmail = getUserInput()

local function writeToFile()
    local file = io.open("sharedPassword.txt", "w")
    local fileName = file

    file:write("Login email: " .. loginEmail .. "\n")
    file:write("Password: " .. password .. "\n")
    file:write("Recipiant of password: " .. recipiantEmail .. "\n")
    file:write("App host: " .. appHost .. "\n")

    file:close()
end

writeToFile()

print("File has been created! Check the explorer.")
print("The file is called: sharedPassword.txt")
