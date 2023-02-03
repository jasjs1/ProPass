print("Name: ")
local userName = io.read()

print("Email:")
local email = io.read()

print("Age")
local userAge = io.read()

print("Password:")
local signupPassword = io.read()

print("Do you want to have 2 Factor Authentication on?")

local input = io.read()

local function enable2FA()
    file = io.open("2FactorCode.txt", "w")

io.output():write("Your 2FA code: ")
twoFactorCode = io.input():read()

file:write(twoFactorCode)
file:close()

end

if input == "yes" then
    
    enable2FA()

end


local function fetchProvidedData()

    print("type 'yes' to create a ProPass account.")

    local input = io.read()

    if input == "yes" then

        local file = io.open("userProvidedAccountData.txt", "w")

        file:write(userName)
        file:write(email)
        file:write(userAge)
        file:write(signupPassword)

        file:close()

        print("ProPass account created.")

    else 
        print("ProPass account was not created.")


    end
end
fetchProvidedData()
