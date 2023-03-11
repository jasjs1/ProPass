--[[

    ** DISCLAMER ** 

    This file is graded on a grading scale of (A, B, C, D, F)
    If you DONT want to have a letter grade scale go to the basicPasswordStrength.lua file, this file is scale on weak - extremly strong scale.
]] function passwordStrength(password)
    local strength = 0

    local length = string.len(password)

    if length >= 8 then strength = strength + 1 end

    if length >= 12 then strength = strength + 2 end

    local hasLower = false
    local hasUpper = false
    local hasDigit = false

    for i = 1, length do

        local char = string.sub(password, i, i)

        if string.match(char, '[a-z]') then hasLower = true end

        if string.match(char, '[A-Z]') then hasUpper = true end

        if string.match(char, '[0-9]') then hasDigit = true end
    end

    if hasLower and hasUpper and hasDigit then strength = strength + 3 end

    return strength
end

local function promptUser()

    print("")
    print("Enter your password below: ")
    local userInputtedPassword = io.read()

    local strength = passwordStrength(userInputtedPassword)

    return userInputtedPassword, strength

end

local function gradePassword(strength)

    if strength == 0 then
        print("Weak")

        width = 20
        value = 0.5 / 3
        max_value = 1

        num_chars = math.floor(value / max_value * width)

        graph = "[" .. string.rep("/", num_chars) ..
                    string.rep(" ", width - num_chars) .. "]"

        graph_with_value = string.format("%s %.2f", graph, value, "%")

        print(graph_with_value)

        print("Hey there, it looks like your pasword is pretty weak. Would you like to create a new one. Type 'new' to get a new password.")

        local input = io.read()

        if input == "new" then

            local function newPass()
                local function generateANewPassword(length)
                    local charset =
                        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+!@#$%^&*();"
                    local password = ""
                    for i = 1, length do
                        local index = math.random(1, string.len(charset))
                        password = password .. string.sub(charset, index, index)
                    end
                    return password
                end

                local function copyToClipboard(str)
                    -- Determine the platform
                    local isWindows = package.config:sub(1, 1) == '\\'

                    -- Create a temporary file
                    local tmpfile = os.tmpname()

                    -- Write the string to the file
                    local file = io.open(tmpfile, "w")
                    file:write(str)
                    file:close()

                    -- Execute the copy command
                    if isWindows then
                        os.execute("cmd.exe /c echo.|set /p=\"" .. tmpfile ..
                                       "\" | clip")
                    else
                        os.execute("cat " .. tmpfile .. " | pbcopy")
                    end

                    -- Delete the temporary file
                    os.remove(tmpfile)
                end

                io.write("Enter desired password length (between 8 and 80): ")
                local length = tonumber(io.read())

                if not length or length < 8 or length > 80 then
                    print(
                        "Invalid password length. Please enter a number between 8 and 80 characters.")
                    return
                end

                io.write("Where will the password be used: ")
                local passwordWebHost = io.read()

                io.write("Tags: ")
                local tags = io.read()

                local password = generateANewPassword(length)

                print(
                    "If you would like to generate a new password. Type 'new'.")
                print("") -- spacer
                print("Generated password: " .. password)

                copyToClipboard(password)
                print("Password copied to clipboard!")

                local input = io.read()

                while input == "new" do
                    password = generateANewPassword(length)
                    print("Where will the password be used: ")
                    passwordWebHost = io.read()
                    print("New password: " .. password)

                    local file = io.open("savedPassword.txt", "a")
                    file:write("..." .. "\n")
                    file:write("Generated saved password: " .. password .. "\n")
                    file:write("Place that password is used: " ..
                                   passwordWebHost .. "\n")
                    file:write("Tags: " .. tags .. "\n")
                    file:write("Audit date: " .. os.date("$M_%d_%yyyy_%H_%m"))
                    file:write("..." .. "\n")
                    file:close()

                    input = io.read()
                end
            end
        end

    elseif strength == 3 then
        print("Modeartly Weak")

        width = 20
        value = 2 / 3
        max_value = 1

        num_chars = math.floor(value / max_value * width)

        graph = "[" .. string.rep("/", num_chars) ..
                    string.rep(" ", width - num_chars) .. "]"

        graph_with_value = string.format("%s %.2f", graph, value, "%")

        print(graph_with_value)

        print("Hey there, it looks like your pasword is pretty weak. Would you like to create a new one. Type 'new' to get a new password.")

        local input = io.read()

        if input == "new" then

            local function newPass()
                local function generateANewPassword(length)
                    local charset =
                        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-+!@#$%^&*();"
                    local password = ""
                    for i = 1, length do
                        local index = math.random(1, string.len(charset))
                        password = password .. string.sub(charset, index, index)
                    end
                    return password
                end

                local function copyToClipboard(str)
                    -- Determine the platform
                    local isWindows = package.config:sub(1, 1) == '\\'

                    -- Create a temporary file
                    local tmpfile = os.tmpname()

                    -- Write the string to the file
                    local file = io.open(tmpfile, "w")
                    file:write(str)
                    file:close()

                    -- Execute the copy command
                    if isWindows then
                        os.execute("cmd.exe /c echo.|set /p=\"" .. tmpfile ..
                                       "\" | clip")
                    else
                        os.execute("cat " .. tmpfile .. " | pbcopy")
                    end

                    -- Delete the temporary file
                    os.remove(tmpfile)
                end

                io.write("Enter desired password length (between 8 and 80): ")
                local length = tonumber(io.read())

                if not length or length < 8 or length > 80 then
                    print(
                        "Invalid password length. Please enter a number between 8 and 80 characters.")
                    return
                end

                io.write("Where will the password be used: ")
                local passwordWebHost = io.read()

                io.write("Tags: ")
                local tags = io.read()

                local password = generateANewPassword(length)

                print(
                    "If you would like to generate a new password. Type 'new'.")
                print("") -- spacer
                print("Generated password: " .. password)

                copyToClipboard(password)
                print("Password copied to clipboard!")

                local input = io.read()

                while input == "new" do
                    password = generateANewPassword(length)
                    print("Where will the password be used: ")
                    passwordWebHost = io.read()
                    print("New password: " .. password)

                    local file = io.open("savedPassword.txt", "a")
                    file:write("..." .. "\n")
                    file:write("Generated saved password: " .. password .. "\n")
                    file:write("Place that password is used: " ..
                                   passwordWebHost .. "\n")
                    file:write("Tags: " .. tags .. "\n")
                    file:write("Audit date: " .. os.date("$M_%d_%yyyy_%H_%m"))
                    file:write("..." .. "\n")
                    file:close()

                    input = io.read()
                end
            end
        end

    elseif strength == 4 then
        print("Strong")

        width = 20
        value = 2.5 / 3
        max_value = 1

        num_chars = math.floor(value / max_value * width)

        graph = "[" .. string.rep("/", num_chars) ..
                    string.rep(" ", width - num_chars) .. "]"

        graph_with_value = string.format("%s %.2f", graph, value, "%")

        print(graph_with_value)

    else
        print("Extremly Strong!")

        width = 20
        value = 3 / 3
        max_value = 1

        num_chars = math.floor(value / max_value * width)

        graph = "[" .. string.rep("/", num_chars) ..
                    string.rep(" ", width - num_chars) .. "]"

        graph_with_value = string.format("%s %.2f", graph, value, "%")

        print(graph_with_value)
    end
end

function createFile()
    local input = io.read()
    print("Would you like to create a .txt file of this?")

    if input == "yes" then
        local userInputtedPassword, strength = promptUser()

        local fileName = "PasswordStrength_" .. os.date("%Y_%m_%d_%H_%M") ..
                             ".txt"
        local file = io.open(fileName, "w")

        file:write(userInputtedPassword .. "\n")
        file:write(strength .. "\n")

        file:close()
    end
end

while true do
    local userInputtedPassword, strength = promptUser()
    gradePassword(strength)

    createFile()
end
