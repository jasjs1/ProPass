print("Email: ")
local email = io.read()

print("Application: ")
local application = io.read()

print("Password: ")
local providedPassword = io.read()

local function validateInformation()

    print("")
    print("Is this information correct: ")
    print("Type 'yes' if the info is correct.")
    print("")
    print(email)
    print(application)
    print(providedPassword)

    local input = io.read()

    if input == "yes" then 

        file = io.open("emailStore.txt", "w")

        file:write(email)
        file:write(application)
        file:write(providedPassword)

        file:close()

        print("File has been created! Check the explorer. File name: emailStore.txt")

    end
end
validateInformation()


