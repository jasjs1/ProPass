local function promptUser()

    print("Email:")
    local email = io.read()

    print("Email Provider")
    local emailProvider = io.read()

    print("Age")
    local age = tonumber(io.read())

    if age and age <= 12 then
        print("You are not able to use ProPass. You must be be 13 or older.")
        return
    end


    print("Password:")
    local signupPassword = io.read()

    print("Do you want to have 2 Factor Authentication on?")
    local twoFactorOn = nil

end
promptUser()

local input = io.read()

local function enable2FA()

    file = io.open("2FactorCode.txt", "w")

    io.write("Your 2FA code: ")
    local twoFactorCode = io.read()

    file:write(twoFactorCode)
    file:close()

end

if input == "yes" then enable2FA() end

local function securityQuestion()

    io.write("Security question: ")
    local securityQuestion = io.read()

    local securityQuestionFile = io.open("SecurityPromptFile.txt", "w")

    securityQuestionFile:write(securityQuestion)
    securityQuestionFile:close()

end

input = io.read()

if input == "yes" then securityQuestion() end

local function recoveryCode()

    print("Recovery Code (required)")
    io.write("Your Recover Code: ")
    local recoveryCode = io.read()

    local recoveryCodeFile = io.open("RecoveryMode.txt", "w")

    file:write(recoveryCode)

    file:close()
end

local function fetchProvidedData()

    print("Validate that the information below is correct:")
    print("")
    print("Email: " .. email)
    print("Email Provider: " .. emailProvider)
    print("Age: " .. age)
    print("Password: " .. signupPassword)
    print("2FA: " .. twoFactorCode)
    print("Security Queston: " .. securityQuestion)
    print("Recovery Code: " .. recoveryCode)


    print("Type 'yes' if the information below is correct.")

    local input = io.read()

    if input == "yes" then

        local file = io.open("userAccountData.txt", "w")

        file:write("Email: " .. email .. "\n")
        file:write("Email Provider: " .. emailProvider .. "\n")
        file:write("Age: " .. age .. "\n")
        file:write("Password: " .. signupPassword .. "\n")
        file:write("2FA code: " .. twoFactorCode .. "\n")
        file:write("Security Queston: " .. securityQuestion .. "\n")
        file:write("Recovery code: " .. recoveryCode .. "\n")

        file:close()

        print("")
        print("ProPass account created! Welcome to a new way to get passwords!")

    else
        print("")
        print("ProPass account was not created.")

        if input == "no" then
            print("")
            print(
                "ProPass was not created. This was caused by you inputting no to the validate information")
        end
    end
end
fetchProvidedData()
