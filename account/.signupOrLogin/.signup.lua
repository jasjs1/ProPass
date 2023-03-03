local userEmail
local emailProvider
local age
local signupPassword
local twoFactorCode
local securityQuestion

local function promptUser()
    print("Email:")
    userEmail = io.read()

    print("Email Provider")
    emailProvider = io.read()

    print("Age")
    age = tonumber(io.read())

    if age and age <= 12 then
        print("You are not able to use ProPass. You must be be 13 or older.")
        return
    end

    print("Password:")
    signupPassword = io.read()

    print("Do you want to have 2 Factor Authentication on?")
    twoFactorOn = nil
end

promptUser()

local input = io.read()

local function enable2FA()
    io.write("Your 2FA code: ")
    twoFactorCode = io.read()

    file = io.open("2FactorCode.txt", "w")
    file:write(twoFactorCode)
    file:close()
end

if input == "yes" then
    enable2FA()
end

local function recoveryCode()
    print("Recovery Code (required)")
    print("")
    io.write("Your Recover Code: ")
    local recoveryCode = io.read()

    local recoveryCodeFile = io.open("RecoveryMode.txt", "w")
    recoveryCodeFile:write(recoveryCode)
    recoveryCodeFile:close()
end
recoveryCode()

local function fetchProvidedData()
    print("Validate that the information below is correct:")
    print("")
    print("Email: " .. userEmail)
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
            print("ProPass was not created. This was caused by you inputting no to the validate information")
        end
    end
end

print("")
print("Do you agree to the ProPass TOS and privacy policy?")
print("Type 'yes' if you do agree.")

local input = io.read()

if input == "yes" then
    fetchProvidedData()
end
