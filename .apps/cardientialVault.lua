local function fetchProvidedData()

    print("Login email:")
    local loginEmail = io.read()

    print("Password: ")
    local password = io.read()

    print("Website/app name: ")
    local websiteHost = io.read()

    return loginEmail, password, websiteHost

end

local loginEmail, password, websiteHost = fetchProvidedData()

local function writeFile()

    print("")
    print("Type 'yes' if you want to create a vault file with the information above?")

    local input = io.read()
    if input == "yes" then
        local file = io.open("cardientialVault.txt", "w")

        file:write("Login email:" .. loginEmail .. "\n")
        file:write("Password: " .. password .. "\n")
        file:write("Website/app name: " .. websiteHost .. "\n")

        file:close()
    end
end
writeFile()
