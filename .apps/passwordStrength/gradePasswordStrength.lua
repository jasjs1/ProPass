--[[
    This file is graded on a grading scale of (A, B, C, D, F)
    If you DONT want to have a letter grade scale go to the basicPasswordStrength.lua file, this file is scale on weak - extremly strong scale.
]]

function passwordStrength(password)
    local strength = 0

    local length = string.len(password)

    if length >= 8 then
        strength = strength + 1
    end
    
    if length >= 12 then 
        strength = strength + 2
    end

    local hasLower = false
    local hasUpper = false
    local hasDigit = false

    for i = 1, length do

        local char = string.sub(password, i, i)

        if string.match(char, '[a-z]') then
            hasLower = true

        end

        if string.match(char, '[A-Z]') then
            hasUpper = true
        end

        if string.match(char, '[0-9]') then
            hasDigit = true
        end
    end

    if hasLower and hasUpper and hasDigit then
        strength = strength + 3
    end

    return strength
end

local function promptUser()
    print("Enter your password below: ")
    local userInputtedPassword = io.read()

    local strength = passwordStrength(userInputtedPassword)

    return userInputtedPassword, strength
end


local function gradePassword(strength)

    if strength == 0 then
        print("Password grade: F")

        print("Ways to improve password strength grade: use: capitol letters, numbers, special symbols, lowercase letters, ect.")

    elseif strength == 3 then
        print("Password grade: C")
    elseif strength == 4 then
        print("Pasword grade: B")
    else 
        print("Password grade: A")
    end
end

function createFile()
    local input = io.read()
    print("Would you like to create a .txt file of this?")

    if input == "yes" then
        local userInputtedPassword, strength = promptUser()

        local fileName = "PasswordStrength_" .. os.date("%Y_%m_%d_%H_%M") .. ".txt"
        local file = io.open(fileName, "w")

        file:write(userInputtedPassword .. "\n")
        file:write(strength .. "\n")

        file:close()
    end
end

while true do 
    local userInputtedPassword, strength = promptUser()
    gradePassword(strength)

    createFile()
end
