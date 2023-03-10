local factorAuthenticationFile = io.open("2FactorCode.txt")

if factorAuthenticationFile == nil then
    print("")
    print("You need to have a 2FA (two-factor-authentication) code to be able to use ProPass Authehenticator.")
    print("Type !help for more details")
    
    local input = io.read()

    if input == "!help" then
        print("To create a 2FA key path: 2FA/create2FA.lua")
        print("What is 2FA? 2FA is a security method that requires two types of identification to access an account or device. ")
        return
    end
end

local accountFile = io.open("userAccountData.txt")

if accountFile == nil then
    print("")
    print("You need to have an account to use ProPass Authenticator")
    print("Type !help for detials")

    local input = io.read()

    if input == "!help" then
        print("To create an account file path: account/.singupOrLogin/.signup.lua")
        return
    end
end

local premFile = io.open("subscriptionInfo.txt")

if premFile == nil then
    print("")
    print("You need to have a ProPass Preimum subscription to use ProPass Authenticator.")
    print("Type '!help' for details")

    local input = io.read()

    if input == "!help" then
        print("Path: premium/getPreimum.lua")
        return
    end
end



local function newAuthentication()

    io.write("Application for authentication: ")
    local appForAuthentication = io.read()

    io.write("Authenticaiton code: ")
    local authencationCode = io.read()

    io.write("Backup code: ")
    local backupCode = io.read()

    -- write data to file

    local writeAuthFile = io.open("app_authenticator.txt", "a")

    writeAuthFile:write("Application: " .. appForAuthentication .. "\n")
    writeAuthFile:write("Auth code: " .. authencationCode .. "\n")
    writeAuthFile:write("Backup code: " .. backupCode .. "\n")

    writeAuthFile:close()

end

local function authenticateUser()
    io.write("Enter application name: ")
    local appName = io.read()

    io.write("Enter authentication code: ")
    local authCode = io.read()

    io.write("Backup password (opitonal): ")
    local backupPassword = io.read()

    -- write data

    local file = io.open("app_authenticator.txt", "w")

    file:write("App host name: " .. appName .. "\n")
    file:write("Auth code: " .. authCode .. "\n")
    file:write("Backup password: " .. backupPassword .. "\n")

    file:close()

    -- log file

    local logFile = io.open("app_log-authenticator.txt", "w")

    logfile:write("Date logged: " .. os.date("%M_%d_%y_%H_%m"))
    logfile:close()
end

local function fetchCommands()

    print("Commands: ")
    print("Format: command // what it does")
    print("")

    print("!new - creates new authentication")
    print("!auth - logs into authentication")
    print("!cmds - exposes commands")
    print("!exit - quits authenticaiton")

end

while true do

    print("")
    print("ProPass Authenticator App")
    print("Type a command below. Access commands by typing !cmds for viewing the commands.md file.")

    local input = io.read()

    if input == "!new" then
        newAuthentication()
    elseif input == "!auth" then
        authenticateUser()
    elseif input == "!cmds" then
        fetchCommands()
    elseif input == "exit" then
        break
    else 
        print("ERROR: Please use a correct input. Check the commands.md for the commands")
    end
end
