local function generateANewPassword(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+!@#$%^&*();"
    local password = ""
    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    return password
end

local function writeDataToFile(password, passwordWebHost)
    local file = io.open("generatedPassword.txt", "a")
    file:write("Generated saved password: " .. password .. "\n")
    file:write("Place that password is used: " .. passwordWebHost .. "\n")
    file:write("\n")
    file:close()
end

local function generatePassword()
    print("") -- Just a separator separating the above contents from the Visual Studio Code extension generated text
    io.write("Enter desired password length (between 8 and 60): ")
    local length = tonumber(io.read())

    if not length or length < 8 or length > 60 then
        print("Invalid password length. Please enter a number between 8 and 60 characters.")
        return 
    end

    io.write("Where will the password be used: ")
    local passwordWebHost = io.read()

    local password = generateANewPassword(length)

    print("If you would like to generate a new password. Type 'new'.")
    print("Generated password: " .. password)

    local input = io.read()

    if input == "new" then
        password = generateANewPassword(length)
        print("New password: " .. password)
    end

    writeDataToFile(password, passwordWebHost)
end

generatePassword()
