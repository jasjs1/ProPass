

local function generatePassword(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*();"
    local password = ""
    for i = 1, length do
        local index = math.random(1,string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    return password
end

local password = generatePassword(15)
print("Your password is: "..password)
 print("Don't forget to save the password!")
 print("If you would like would like to see the saved passwords. Please do that when requested.")

local function clearConsole()
    io.write("Type Y to clear the console: ")
    local key = io.read()
    if key == "Y" then
        os.execute("clear")
        os.execute("cls")
        print("Terminated")
    else
        print("Unrecognized command, please type 'Y' to terminate. Or 'saved pass'")
    end
end
clearConsole()

local function savedPasswordsConsoleRequest()
    io.write("Type 'saved passwords' to reveal your saved passwords: ")
    local keyInput = io.read()
    if keyInput == "saved passwords" then
        print("Are you sure that you want to reveal your saved passwords?")

    local keyInput = io.read()
    if keyInput == "yes" then
        print(savedPass1)
    end
    end
end
savedPasswordsConsoleRequest()

local function endConsoleSession()

    io.write("If you would like to end the console session please type 'end'")

    if keyInput == "end" then
        os.execute("clear")
        os.execute("cls")

        print("Cleaned!")
    end
end
endConsoleSession()
