local function deleteAllPasswordGenerateFiles()
    local file = "userProvidedAccountData.txt"
    local success, errorMessage, errorCode = os.remove(file)
    if not success then
        print(file .. ": " .. errorMessage)
    end
end

local function remove2FAGeneratedFiles()
    local file = "2FactorCode.txt"
    local success, errorMessage, errorCode = os.remove(file)
    if not success then
        print(file .. ": " .. errorMessage)
    end
end

print("")
print("Are you sure you want to delete your ProPass account? All of your passwords will be deleted, they will be un recoverable.")
print("Type 'yes' to delete account:")

local input = io.read()

if input == "yes" then
    deleteAllPasswordGenerateFiles()
    remove2FAGeneratedFiles()

    print("Sorry to see you go :(")
    print("")

    print("How can we improve: ")
end
