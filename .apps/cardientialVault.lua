local providedCredentials, passwordUse, hostSecurity

local function fetchProvidedData()
    print("Enter the credentials that you want to save:")
    providedCredentials = io.read()

    print("Website/app name that this password is used on:")
    passwordUse = io.read()

    print("Host security:")
    hostSecurity = io.read()
end

fetchProvidedData()

local function validateDetailsCreateFile()
    print("Validate that the information that you typed in is correct: ")
    print("")
    print(providedCredentials)
    print(passwordUse)
    print(hostSecurity)

    print("")
    print("Type 'yes' if you want to create a vault file with the information above?")

    local input = io.read()
    if input == "yes" then
        local file = io.open("savedCardentials.txt", "w")
        file:write(providedCredentials .. "\n")
        file:write(passwordUse .. "\n")
        file:write(hostSecurity .. "\n")
        file:close()
    end
end

validateDetailsCreateFile()
