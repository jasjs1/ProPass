
-- Subscription required for this feature



local function createUser()
    print("")

    io.write("Username or email: ")
    local userOrEmail = io.read()

    io.write("Password: ")
    local password = io.read()

    io.write("Role: ")
    local role = io.read()

    io.write("Age: ")
    local age = io.read()

    local twoFactorCode
    local function enable2FA()
        local file = io.open("2FactorCode.txt", "w")

        io.write("Your 2FA code: ")
        twoFactorCode = io.read()

        file:write(twoFactorCode)
        file:close()
    end
    enable2FA()

    local recoveryCodeValue
    local function setRecoveryCode()

        print("Recovery Code (required)")
        io.write("Your Recovery Code: ")

        recoveryCodeValue = io.read()
        local recoveryCodeFile = io.open("RecoveryMode.txt", "w")

        recoveryCodeFile:write(recoveryCodeValue)
        recoveryCodeFile:close()
    end
    setRecoveryCode()

    local function validateInformationAndWriteFile()

        print("")
        print("Validate that the information below is correct:")
        print("")

        print("Username or email: " .. userOrEmail)
        print("Password: " .. password)
        print("Role: " .. role)
        print("Age: " .. age)
        print("Two factor code: " .. twoFactorCode)
        print("Recovery Code: " .. recoveryCodeValue)

        print("")

    end
    validateInformationAndWriteFile()

    local function createUserFile()

        print("Type 'yes' if the information is correct.")

        local input = io.read()

        if input == "yes" then


            local familyAccountfile = io.open("familyUsersAccountFile.txt", "a")

            if familyAccountfile then


                familyAccountfile:write("Username or email: " .. userOrEmail .. "\n")
                familyAccountfile:write("Password: " .. password .. "\n")
                familyAccountfile:write("Role: " .. role .. "\n")
                familyAccountfile:write("Age: " .. age .. "\n")
                familyAccountfile:write("Two factor code: " .. twoFactorCode .. "\n")
                familyAccountfile:write("Recovery code: " .. recoveryCodeValue .. "\n")
                familyAccountfile:write("\n")
                familyAccountfile:write("New user:" .. "\n")
                familyAccountfile:write("")
                familyAccountfile:close()
            else
                print("Failed to open familyUsersAccountFile.txt")
            end
        end
    end
    createUserFile()
end

local familyAccountfile = io.open("subscriptionInfo.txt", "r")

if familyAccountfile == nil then
    print("ERROR: No subscription file, you must have an active ProPass Premium subscription to use family account.")
else
    print("Subscription file is active.")
    print("")
    print("")

    while true do
        createUser()
    end
end
