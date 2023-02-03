
print("Name: ")
local name = io.read()

print("Email:")
local email = io.read()

print("Age")
local userAge = io.read()

print("Password:")
local signupPassword = io.read()




local function fetchProvidedData()

    print("type 'yes' to create a ProPass account.")

    local input = io.read()

    if input == "yes" then

        local file = io.open("userProvidedAccountData.txt")

        file:write(name)
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

