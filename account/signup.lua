print("")
print("Name: ")
local name = io.read()

print("Email:")
local email = io.read()

print("Age")
local age = io.read()

print("Password:")
local signupPassword = io.read()

print("Do you want to have 2 Factor Authentication on?")
local TwoFactorOn = nil

local input = io.read()

local function enable2FA()

    file = io.open("2FactorCode.txt", "w")

    io.output():write("Your 2FA code: ")
    twoFactorCode = io.input():read()

    file:write(twoFactorCode)
    file:close()

end

if input == "yes" then enable2FA() end

local function fetchProvidedData()

    print("Vaidate that the information below is correct:")
    print("")
    print("Name: " .. name)
    print("Email: " .. email)
    print("Age: " .. age)
    print("Password: " .. signupPassword)
    -- print("2FA on: " .. TwofactorAuthentication)

    print("Type 'yes' if the information below is correct.")

    local input = io.read()

    if input == "yes" then

        local file = io.open("userAccountData.txt", "w")

        file:write("Name: " .. name .. "\n")
        file:write("Email: " .. email .. "\n")
        file:write("Age: " .. age .. "\n")
        file:write("Password: " .. signupPassword .. "\n")

        file:close()

        print("ProPass account created! Welcome to a new was to get passwords!")

    else
        print("ProPass account was not created.")

        if input == "no" then
            print(
                "ProPass was not created. This was caused by you inputting no to the validate information.")

            -- getUserInput()
        end
    end
end
fetchProvidedData()
