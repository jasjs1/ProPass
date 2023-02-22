local email = ""
local useOfThisAccount = ""
local age = 0
local twoFactorCode = ""

local function userPrompt()
    io.write("Email: ")
    email = io.read()

    io.write("Use of this account: ")
    useOfThisAccount = io.read()

    io.write("Age: ")
    age = tonumber(io.read())

    if age and age <= 12 then
        print("You are not able to use ProPass. You must be 13 or older.")
        return
    end
end

userPrompt()

print("Do you want to enable 2 Factor Authentication?")
local twoFactorOn = nil

local input = io.read()

local function enable2FA()
    file = io.open("2FactorCode.txt", "w")

    io.write("Your 2FA code: ")
    twoFactorCode = io.read()

    file:write(twoFactorCode)
    file:close()
end

if input == "yes" then enable2FA() end

print("")
print("Would you like to create a security prompt? Type 'yes' to create one.")
print("A security prompt is if you need to regain access, delete account, regain access to account.")

local function securityQuestion()
    io.write("Security question: ")
    local securityQuestion = io.read()

    local securityQuestionFile = io.open("SecurityPromptFile.txt", "w")
    securityQuestionFile:write(securityQuestion)
    securityQuestionFile:close()

    return securityQuestion
end

input = io.read()

if input == "yes" then securityQuestion() end

local function fetchProvidedData()
    print("")
    print("Validate that the information below is correct: ")
    print("")

    local securityQ = securityQuestion()

    print("Email: " .. email)
    print("Use of this account: " .. useOfThisAccount)
    print("Age: " .. age)
    print("Two factor code on: " .. twoFactorCode)
    print("Security Prompt: " .. securityQ)

    local multipleAccountFile = io.open("MultiAccountFile.txt", "w")

    multipleAccountFile:write("Email: " .. email .. "\n")
    multipleAccountFile:write("Usage of this account: " .. useOfThisAccount .. "\n")
    multipleAccountFile:write("Age: " .. age .. "\n")
    multipleAccountFile:write("Two factor code: " .. twoFactorCode .. "\n")
    multipleAccountFile:write("Security Prompt: " .. securityQ .. "\n")

    multipleAccountFile:close()

end
fetchProvidedData()
