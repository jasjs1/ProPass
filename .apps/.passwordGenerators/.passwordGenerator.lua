local function generateANewPassword(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+!@#$%^&*();"
    local password = ""
    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    return password
end



local function getNewPass()
    print("") -- Just a separator separating the above contents from the Visual Studio Code extension generated text
    io.write("Enter desired password length (between 8 and 80): ")
    local length = tonumber(io.read())

    if not length or length < 8 or length > 80 then
        print("Invalid password length. Please enter a number between 8 and 80 characters.")
        return 
    end

    io.write("Where will the password be used: ")
    local passwordWebHost = io.read()

    local password = generateANewPassword(length)

    print("If you would like to generate a new password. Type 'new'.")
    print("Generated password: " .. password)

    local input = io.read()

    while input == "new" do
        password = generateANewPassword(length)
        print("Where will the password be used: ")
        local passwordWebHost = io.read()
        print("New password: " .. password)
        writeDataToFile(password, passwordWebHost)
        input = io.read()
    end

    local function writeDataToFile(password, passwordWebHost)
        local file = io.open("savedPassword.txt", "a")
        file:write("Generated saved password: " .. password .. "\n")
        file:write("Place that password is used: " .. passwordWebHost .. "\n")
        file:write("Audit date: " .. os.date("$M_%d_%yyyy_%H_%m"))
        file:write("\n")
        file:close()
    end
    writeDataToFile(password, passwordWebHost)
end
getNewPass()
