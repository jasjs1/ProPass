local function activeNotifications()
    local MFAFile = io.open("MFA.txt", "r")
    local twoFactorFile = io.open("2FactorCode.txt", "r")
    local masterPasswordFile = io.open("MasterPassword.txt", "r")

    print("ACTIVE NOTIFICATIONS:")
    print("")

    if MFAFile == nil then
        print("Consider creating a MFA (multi-factor-authentication) code for extra security")
    end

    if twoFactorFile == nil then
        print("Consider making a 2FA (two-factor-authentication) to add extra security to your account.")
    end

    if masterPasswordFile == nil then
        print("Consider making a master password to add added security to your account when you need to regain access.")
    end

    if MFAFile ~= nil then MFAFile:close() end

    if twoFactorFile ~= nil then twoFactorFile:close() end

    if masterPasswordFile ~= nil then masterPasswordFile:close() end

    -- move the 'else' statement inside the last 'if' statement
    if MFAFile ~= nil or twoFactorFile ~= nil or masterPasswordFile ~= nil then
        print("There are active security related notifications.")
    end
end

local subscriptionFile = io.open("subscriptionInfo.txt")

if subscriptionFile == nil then
    print("")
    print("You need a ProPass Premium subscription to use SecurityCenter. Please create a subscription to use this.")
    print("")
    return
end

print("Check out the commands.md to get the SecurityCenter commands.")


activeNotifications()

local function createMFA()

    io.write("MFA: ")
    local MFACode = io.read()

    local MFAFILE = io.open("MFA.txt", "w")

    MFAFILE:write("MFA: " .. masterPassword .. "\n")
    MFAFILE:write("Date Created: " .. os.date("%M_%d_y_%H_%m"))

    MFAFILE:close()

    print("Master password file was created.")

end

local function create2FA()

    file = io.open("2FactorCode.txt", "w")

    io.output():write("Your 2FA code: ")
    twoFactorCode = io.input():read()

    file:write(twoFactorCode)
    file:close()

    print("2FA was created!")

end

local function masterPassword()

    io.write("Master Password: ")
    local masterPassword = io.read()

    local masterPasswordFile = io.open("MasterPassword.txt", "w")
    
    masterPasswordFile:write("Master Password: " .. masterPassword .. "\n")
    masterPasswordFile:write("Date Created: " .. os.date("%m_%d_%y_%H_%m"))
    
    masterPasswordFile:close()

    print("Master password file created! File name: MasterPassword.txt")
end

local function securityImprovements()
    local improvements = {
        "Use strong passwords: Encourage users to use strong passwords that are difficult to guess, such as a combination of upper and lower case letters, numbers, and symbols. You could also implement password complexity rules to enforce strong passwords.",
        "Implement two-factor authentication: Two-factor authentication adds an additional layer of security by requiring users to provide a second factor, such as a verification code sent to their phone or email.",
        "Implement password hashing and salting: Passwords should be hashed and salted to prevent attackers from easily accessing them in the event of a data breach. You can use Lua libraries like lua-crypto to hash and salt passwords.",
        "Use HTTPS: Use HTTPS to encrypt the communication between the user's browser and your server. This will prevent attackers from intercepting and reading the user's data.",
        "Implement rate limiting: Implement rate limiting to prevent attackers from brute-forcing passwords or launching other types of attacks. This will limit the number of requests a user can make within a certain timeframe.",
        "Regularly update software: Keep your software up to date with the latest security patches to ensure that vulnerabilities are fixed promptly.",
        "Educate users: Educate your users about online security best practices, such as not sharing passwords, avoiding suspicious links, and regularly changing passwords.",
        "Avoid using the same password for multiple online sources. That makes it easier for hackers to get access to your other accounts.",
        "Use password managers: Encourage users to use password managers to securely store and generate strong passwords.",
        "Implement multi-factor authentication: Multi-factor authentication adds additional layers of security by requiring users to provide multiple factors, such as something they know (password), something they have (authentication token), and something they are (biometric verification).",
        "Implement account lockout policies: Implement account lockout policies to prevent brute force attacks. After a certain number of failed login attempts, the account should be locked out for a period of time.",
        "Implement intrusion detection and prevention systems: Intrusion detection and prevention systems can detect and prevent attacks in real-time.",
        "Use secure coding practices: Use secure coding practices to prevent common security vulnerabilities such as SQL injection and cross-site scripting.",
    }

    print(table.concat(improvements, ", "))
end




while true do
    local input = io.read()

    if input == "master password" then
        masterPassword()
    elseif input == "2fa" then
        create2FA()
    elseif input == "mfa" then
        createMFA()
    elseif input == "improve" then
        securityImprovements()
    elseif input == "exit" then
        break -- exit the while loop
    end
end
