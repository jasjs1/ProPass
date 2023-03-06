local function generateANewPassword(length)
    local password = ""
    local charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-={}|[]:;'<>,.?/~"
    math.randomseed(os.time())

    for i = 1, length do
        local randomIndex = math.random(1, #charset)
        password = password .. string.sub(charset, randomIndex, randomIndex)
    end

    return password
end

local function getNewPass()
    print("") -- Just a separator separating the above contents from the Visual Studio Code extension generated text
    io.write("Enter desired password length (between 8 and 60): ")
    local length = tonumber(io.read())

    if not length or length < 8 or length > 60 then
        print(
            "Invalid password length. Please enter a number between 8 and 60 characters.")
        return
    end

    io.write("Where will the password be used: ")
    local passwordWebHost = io.read()

    local password = generateANewPassword(length)

    print("")
    print("Generated password: " .. password)
    print("")

    local function writeDataToFile(password, passwordWebHost)
        local file = io.open("savedPassword.txt", "a")
        file:write("Generated saved password: " .. password .. "\n")
        file:write("Place that password is used: " .. passwordWebHost .. "\n")
        file:write("\n")
        file:close()
    end
    writeDataToFile(password, passwordWebHost)
end

function passwordStrengthGraph(password)
    local score = 0

    -- password length
    local length = string.len(password)
    if length < 5 then
        score = score + 5
    elseif length >= 5 and length <= 7 then
        score = score + 10
    elseif length >= 8 and length <= 11 then
        score = score + 20
    else
        score = score + 25
    end

    -- password complexity
    local uppercase = false
    local lowercase = false
    local number = false
    local symbol = false

    for i = 1, length do
        local char = string.sub(password, i, i)
        if not uppercase and char >= "A" and char <= "Z" then
            score = score + 5
            uppercase = true
        elseif not lowercase and char >= "a" and char <= "z" then
            score = score + 5
            lowercase = true
        elseif not number and char >= "0" and char <= "9" then
            score = score + 5
            number = true
        elseif not symbol and char ~= " " and char ~= "\t" and char ~= "\n" and
            not (char >= "0" and char <= "9") and
            not (char >= "a" and char <= "z") and
            not (char >= "A" and char <= "Z") then
            score = score + 5
            symbol = true
        end
    end

    -- password score
    local result = ""
    if score >= 90 then
        result = "VERY STRONG"
    elseif score >= 80 then
        result = "STRONG"
    elseif score >= 70 then
        result = "GOOD"
    elseif score >= 60 then
        result = "AVERAGE"
    elseif score >= 50 then
        result = "WEAK"
    else
        result = "VERY WEAK"
    end

    return result
end


while true do
    -- commands
    print("")
    print("ProPasss Dashboard Commands")
    print("")

    print("Generate password: !new")
    print("Password security (graph) !psg")
    print("Passowrd security (letter grade) !PSG")

    print("")

    local input = io.read()

    if input == "!new" then
        getNewPass()
    elseif input == "!psg" then
        passwordStrengthGraph()
    elseif input == "!PSG"
    gradePasswordWithLetterGrade()
    else
      print("Error: Incorrect input, please input one of the commands below:")
    end
end
