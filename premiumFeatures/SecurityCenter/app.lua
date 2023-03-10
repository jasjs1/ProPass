local function activeNotifications()
    local MFAFile = io.open("MFA.txt", "r")
    local twoFactorFile = io.open("2FactorCode.txt", "r")
    local masterPasswordFile = io.open("MasterPassword.txt", "r")

    print("ACTIVE NOTIFICATIONS:")
    print("")

    if MFAFile == nil then
        print(
            "Consider creating a MFA (multi-factor-authentication) code for extra security")
        print("")
    end

    if twoFactorFile == nil then
        print(
            "Consider making a 2FA (two-factor-authentication) to add extra security to your account.")
        print("")
    end

    if masterPasswordFile == nil then
        print(
            "Consider making a master password to add added security to your account when you need to regain access.")
        print("")
    end

    if MFAFile ~= nil then MFAFile:close() end

    if twoFactorFile ~= nil then twoFactorFile:close() end

    if masterPasswordFile ~= nil then masterPasswordFile:close() end

    -- move the 'else' statement inside the last 'if' statement
    if MFAFile ~= nil or twoFactorFile ~= nil or masterPasswordFile ~= nil then
        print("There are active security related notifications.")
    end
end

local subscriptionFile = io.open("subscriptionInfo.txtsubscriptionInfo.txt")

if subscriptionFile == nil then
    print("")
    print("You need a ProPass Premium subscription to use SecurityCenter. Please create a subscription to use this.")
    print("")
    return
end


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

while true do
    local input = io.read()

    if input == "master password" then
    elseif input == "2fa" then
        create2FA()
    elseif input == "mfa" then
        createMFA()
    elseif input == "exit" then
        break -- exit the while loop
    end
end
