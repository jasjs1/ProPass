function passwordStrength(password)
    local strength = 0

    local length = string.len(password)

    if length >= 8 then
        strength = strength + 1
    end
    
    if length >= 12 then 
        strength = strength + 1
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
        strength = strength + 1
    end

    return strength
end

local function promptUser()
    print("")
    print("Enter your password below: ")
    local password = io.read()

    local strength = passwordStrength(password)

    return strength
end


local function gradePassword()


    if strength == 0 then
    
        print("Very Weak")

    elseif strength == 1 then

        print("Not too secure (weak)")

    elseif strength == 2 then

        print("Moderately secure")

    else 
        print("Strong!")

    end
end

local strength = promptUser()
gradePassword(strength)

while true do 

    promptUser()

    gradePassword()

end
