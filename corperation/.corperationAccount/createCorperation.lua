local corpName, corpEmail, corpPassword, corpWebsiteURL, corpNumberOfEmployees, corpAdminPin

local function createCorperation()

    io.write("Corporation Name: ")
    corpName = io.read()

    repeat
        io.write("Corporation Email: ")
        corpEmail = io.read()

        -- Check if the email matches the pattern
        if corpEmail:match(".+@.+%.com$") or corpEmail:match(".+@.+%.org$") 
        or corpEmail:match(".+@.+%.edu$")
        or corpEmail:match(".+@.+%.net$")
        or corpEmail:match(".+@.+%.io$")
        or corpEmail:match(".+@.+%.me$")
        or corpEmail:match(".+@.+%.ca$")
        or corpEmail:match(".+@.+%.tech$")
        or corpEmail:match(".+@.+%.ai$")
        or corpEmail:match(".+@.+%.studio$")
        or corpEmail:match(".+@.+%.gov$")
        or corpEmail:match(".+@.+%.contact$")
        then
            -- Valid email address
            break
        else
            -- Invalid email address
            print("Invalid email address. Please enter a valid email address.")
        end
    until false

    repeat
        io.write("Password: (8-100 characters): ")
        local corpPassword = io.read()

        if #corpPassword < 8 or #corpPassword > 100 then
            print("Password must be between 8 and 100 characters.")
        else
            break
        end
    until false

    io.write("Corporation website URL: ")
    corpWebsiteURL = io.read()

    io.write("Number of Employees (can add more later): ")
    corpNumberOfEmployees = io.read()

    io.write("Admin Pin: ")
    corpAdminPin = io.read()

    print("") -- spacer

    print("Would you like to have 2FA enabled. 2FA is a added security when loggin in. 2FA stands for two factor authentication. For more information check out the 2FA.md file.")
    io.write("Type 'yes' if you would like to create a 2FA.")

    local input = io.read()

    if input == "yes" then
        io.write("2FA code: ")
        local twoFactorCode = io.read()
    
        local twoFactorAuthenticationFile = io.open("corp_2FA.txt", "w")

        twoFactorAuthenticationFile:write(twoFactorCode)
        twoFactorAuthenticationFile:close()
        -- end
    end
end

createCorperation()

local function writeCorperationDataToFile()
    print("")
    print("Validate that the information below is correct:")
    print("")

    print("Corporation name: " .. corpName)
    print("Corporation email: " .. corpEmail)
    print("Corporation password: " .. corpPassword)
    print("Corporation website URL: " .. corpWebsiteURL)
    print("Corporation total number of employees: " .. corpNumberOfEmployees)
    print("Admin Pin: " .. corpAdminPin)

    print("")
    print("Type 'yes' if the information above is correct.")

    local input = io.read()

    if input == "yes" then
        local file = io.open("corpAccount.txt", "w")

        file:write("Corporation name: " .. corpName .. "\n")
        file:write("Corporation email: " .. corpEmail .. "\n")
        file:write("Corporation password: " .. corpPassword .. "\n")
        file:write("Corporation website URL: " .. corpWebsiteURL .. "\n")
        file:write("Corporation total number of employees: " .. corpNumberOfEmployees .. "\n")
        file:write("Admin Pin: " .. corpAdminPin .. "\n")
        file:write("Date Corporation joined ProTask: " .. os.date("%M-%D-%Y %H:%M:S") .. "\n")
        file:write("Date last edited: " .. os.date("%M-%D-%Y %H:%M:S") .. "\n")

        file:close()
    end
end

print("Press enter to write files.")

-- write other data to files

local function writeAdminPin()
    os.execute("sleep 1")
    print("Executing: writing Admin Pin to file...")

    local file = io.open("corp_adminPin.txt", "w")

    file:write(corpAdminPin .. "\n")
    file:write("Date added: " .. os.date("%M-%d-%Y %H:%M:%S") .. "\n")
    file:write("Date modified: " .. os.date("%M-%d-%Y %H:%M:%S") .. "\n")

    file:close()

    os.execute("sleep 0.6")
    print("Created Admin Pin file. Check the explorer for: corp_adminPin.txt")
    
    print("") -- spacer

    print("Welcome, " .. corpName .. "! Were exited to have you as a corperation using ProTask!")
    print("To create an employee go to the addEmplyoee.lua file to do so")
end
writeAdminPin()
