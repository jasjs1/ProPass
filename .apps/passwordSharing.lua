local function getUserInput()


    print("")
    print("Login email: ")
    local loginEmail = io.read()


    print("Password: ")
    local password = io.read()


    print("Place that this password is used")
    local siteThatPasswordIsUsed = io.read()


    print("Recipient of the password (email, name, phone number)")
    local recipientOfPassword = io.read()

    print("Term of use for recipiant (ProPass can not manage that)")
    local termOfPasswordUse = io.read()


    return loginEmail, password, siteThatPasswordIsUsed, recipientOfPassword, termOfPasswordUse


end

local loginEmail, password, siteThatPasswordIsUsed, recipientOfPassword = getUserInput()

local function writeToFile()

    local file = io.open("sharedPassword.txt", "w")
    local fileName=  file

    file:write("Login Email: " .. loginEmail .. "\n")
    file:write("Password: " .. password .. "\n")
    file:write("Site that password is used on: " .. siteThatPasswordIsUsed .. "\n")
    file:write("Recipiant of password: " .. recipientOfPassword .. "\n")

    file:close()

end

print("File has been created! Check the file explorer!")
print("If you want to do another please run the file again!")
