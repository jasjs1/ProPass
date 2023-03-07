local userEmail
local age
local signupPassword
local twoFactorCode
local securityQuestion

local function promptUser()
    repeat
        print("Email:")
        local userEmail = io.read()

        if userEmail:match(".+@.+%.com$") or userEmail:match(".+@.+%.org$") 
        or userEmail:match(".+@.+%.edu$")
        or userEmail:match(".+@.+%.net$")
        or userEmail:match(".+@.+%.io$")
        or userEmail:match(".+@.+%.me$")
        or userEmail:match(".+@.+%.ca$")
        or userEmail:match(".+@.+%.co")
        or userEmail:match(".+@.+%.tech$")
        or userEmail:match(".+@.+%.ai$")
        or userEmail:match(".+@.+%.studio$")
        or userEmail:match(".+@.+%.gov$")
        then
            break
        else
            print("Invalid email address. Please use a proper TLD, if you don't know what a TLD is, please check tld.md")
        end
    until false

    print("Age")
    age = tonumber(io.read())

    if age and age <= 12 then
        print("You are not able to use ProPass. You must be be 13 or older.")
        return
    end

    repeat
        print("Password (8-100 characters):")
        local subscriptionPassword = io.read()

        if #subscriptionPassword < 8 or #subscriptionPassword > 100 then
            print("Password must be between 8 to 100 characters.")
        else
            break
        end
    until false

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
