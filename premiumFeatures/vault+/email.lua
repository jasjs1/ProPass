local accountUsername
local onlinePlatform -- This is where the email is used on the internet

local emailForStore
local passwordForStore

local function storeEmailData()

    io.write("Account username: ")
    accountUsername = io.read()

    io.write("Online platform (where is the email being used online): ")
    onlinePlatform = io.read()  

    io.write("Email: ")
    emailForStore = io.read()

    io.write("Password for account: ")
    passwordForStore = io.read()

end
storeEmailData()

local function validateInformationAndWriteDataToFile()
    print("") -- spacer
    print("") -- spacer

    print("Validate that the info below is correct.")
    print("") -- spacer

    print("Account username: " .. accountUsername)
    print("Online platform: " .. onlinePlatform)
    print("Email: " .. email)
    print("Passowrd: " .. passwordForStore)

    print("")
    print("Type yes if the info above is correct.")

    local input = io.read()

    if input == "yes" then

        local file = io.open("emailVault-prem.txt", "a")

        file:write("\n")
        file:write("Acount username: " .. accountUsername .. "\n")
        file:write("Online platform: " .. onlinePlatform .. "\n")
        file:write("Email: " .. email .. "\n")
        file:write("Passowrd: " .. passwordForStore .. "\n")
        file:write("Date created: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")
        file:write("Date modified: " .. os.date('%M-%d-%y %H:%M:%S') .. "\n")
        file:write("\n")

        file:close()
        print("File created! Check the explorer for emailVault-prem.txt")

    end
end
validateInformationAndWriteDataToFile()
