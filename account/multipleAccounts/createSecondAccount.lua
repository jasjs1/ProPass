local function login()
    io.write("Enter your email: ")
    local email = io.read()

    io.write("Enter your password: ")
    local password = io.read()

    local accountsFile = io.open("MultiAccountFile.txt", "r")
    if not accountsFile then
        print("Error: Could not open accounts file.")
        return
    end

    local authenticated = false

    for line in accountsFile:lines() do
        local storedEmail, storedPassword = line:match("(%S+)%s+(%S+)")

        if email == storedEmail and password == storedPassword then
            authenticated = true
            break
        end
    end

    accountsFile:close()

    if not authenticated then
        print("Error: Invalid email or password.")
        return
    end

    local twoFactorFile = io.open("2FactorCode.txt", "r")
    if not twoFactorFile then
        print("Error: Could not open 2FA file.")
        return
    end

    io.write("Enter your 2FA code: ")
    local enteredCode = io.read()

    local storedCode = twoFactorFile:read("*line")
    twoFactorFile:close()

    if enteredCode ~= storedCode then
        print("Error: Invalid 2FA code.")
        return
    end

    print("Success: Logged in with 2FA.")
end

login()
