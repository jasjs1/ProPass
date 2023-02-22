
local uppercaseRegex = '[A-Z]'
local lowercaseRegex = '[a-z]'
local digitRegex = '[0-9]'
local specialCharRegex = '[!@#%^&*()-+=]'


local function checkPasswordStrength(password)
    local score = 0


    if string.match(password, uppercaseRegex) then
        score = score + 1
    end


    if string.match(password, lowercaseRegex) then
        score = score + 1
    end


    if string.match(password, digitRegex) then
        score = score + 1
    end


    if string.match(password, specialCharRegex) then
        score = score + 1
    end

    return score
end


local function checkFilesExist()
    local savedPasswordFound = os.rename("Saved Password.txt", "Saved Password.txt")
    local numberPasswordFound = os.rename("NumberPassword.txt", "NumberPassword.txt")
    local simplePassFound = os.rename("SimplePass.txt", "SimplePass.txt")

    return savedPasswordFound and numberPasswordFound and simplePassFound
end

-- Define function to perform password health check
local function passwordHealthCheck()
    if checkFilesExist() then

        print("Password health check complete")
    else
        print("One or more required files not found")
    end
end

return {
    checkPasswordStrength = checkPasswordStrength,
    passwordHealthCheck = passwordHealthCheck
}
