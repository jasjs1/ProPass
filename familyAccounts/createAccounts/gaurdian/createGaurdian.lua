local subscriptionFile = io.open("subscriptionInfo.txt")

local function createGuardianAccount()
    print("")
    print("PROPASS GUARDIAN FAMILY ACCOUNT SIGNUP")

    io.write("Age: ")
    local age = tonumber(io.read())

    if age and age <= 19 then
        print(
            "You are not able to use ProPass Guardian Account. You must be be 20 or older.")
        return
    end

    local gaurdianEmail
    repeat
        io.write("Guardian email: ")
        gaurdianEmail = io.read()

        if gaurdianEmail:match(".+@.+%.com$") or
            gaurdianEmail:match(".+@.+%.org$") or
            gaurdianEmail:match(".+@.+%.edu$") or
            gaurdianEmail:match(".+@.+%.net$") or
            gaurdianEmail:match(".+@.+%.io$") or
            gaurdianEmail:match(".+@.+%.me$") or
            gaurdianEmail:match(".+@.+%.ca$") or
            gaurdianEmail:match(".+@.+%.co") or
            gaurdianEmail:match(".+@.+%.tech$") or
            gaurdianEmail:match(".+@.+%.ai$") or
            gaurdianEmail:match(".+@.+%.studio$") or
            gaurdianEmail:match(".+@.+%.gov$") then
            break
        else
            print(
                "Invalid email address. Please use a proper TLD, if you don't know what a TLD is, please check tld.md")
        end
    until false

    local gauridanPassword
    repeat
        io.write("Password (8-100 characters): ")
        gauridanPassword = io.read()

        if #gauridanPassword < 8 or #gauridanPassword > 100 then
            print("Password must be between 8 to 100 characters.")
        else
            break
        end
    until false

    print("Other notes:")
    local otherNotes = io.read()
end

local function writeDataToGaurdianFile(age, gaurdianEmail, gauridanPassword, otherNotes)
    local gaurdianFile = io.open("gaurdianFileFAMILYACCOUNT.txt", "w")
    gaurdianFile:write("Age: " .. age .. "\n")
    gaurdianFile:write("Email: " .. gaurdianEmail .. "\n")
    gaurdianFile:write("Password: " .. gauridanPassword .. "\n")
    gaurdianFile:write("Other notes: " .. otherNotes .. "\n")
    gaurdianFile:close()
end

print("Guardian account created, go to the previous fie and look for .singup.lua to create a ProPass account for your child.")

if subscriptionFile ~= nil then createGuardianAccount() end
