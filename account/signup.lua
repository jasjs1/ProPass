print("Email:")
local email = io.read()

print("Email Provider")
local emailProvider = io.read()

print("Age")
local age = io.read()

print("Password:")
local signupPassword = io.read()

print("Do you want to have 2 Factor Authentication on?")
local TwoFactorOn = nil
-- the variable TwoFactorOn should be set to nil initially

local input = io.read()

local function enable2FA()

    file = io.open("2FactorCode.txt", "w")

    io.write("Your 2FA code: ")
    local twoFactorCode = io.read()
    -- read the two-factor code using io.read()

    file:write(twoFactorCode)
    file:close()

end

if input == "yes" then enable2FA() end

print("")
print("Would you like to create a security prompt? Type 'yes' to create one.")
print("A security prompt is if you need to regain access, delete account, regaub access to account.")

local function securityQuestion()

    io.write("Security question: ")
    local securityQuestion = io.read()

    local securityQuestionFile = io.open("SecurityPromptFile.txt", "w")

    securityQuestionFile:write(securityQuestion)
    securityQuestionFile:close()

end

input = io.read()

if input == "yes" then
    securityQuestion()
end

local function fetchProvidedData()

    print("Validate that the information below is correct:")
    print("")
    print("Email: " .. email)
    print("Email Provider: " .. emailProvider)
    print("Age: " .. age)
    print("Password: " .. signupPassword)
    -- The 'securityQuestion' and 'TwoFactorOn' variables are not accessible here.

    print("Type 'yes' if the information below is correct.")

    local input = io.read()

    if input == "yes" then

        local file = io.open("userAccountData.txt", "w")

        file:write("Email: " .. email .. "\n")
        file:write("Email Provider: " .. emailProvider .. "\n")
        file:write("Age: " .. age .. "\n")
        file:write("Password: " .. signupPassword .. "\n")
        -- Security question and 2FA are not included here.

        file:close()

        print("")
        print("ProPass account created! Welcome to a new way to get passwords!")

    else
        print("")
        print("ProPass account was not created.")

        if input == "no" then
            print("")
            print("ProPass was not created. This was caused by you inputting no to the validate information.")
        end
    end
end

fetchProvidedData()
