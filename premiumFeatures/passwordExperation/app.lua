io.write("Previous password: ")
local previousPassword = io.read()

local password

local function getNewPassword()
    io.write("Enter password length (between 8 and 60 characters): ")
    local length = tonumber(io.read())

    -- Validate password length input
    while not length or length < 8 or length > 60 do
        io.write("Invalid length. Please enter a number between 8 and 60: ")
        length = tonumber(io.read())
    end

    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*();:"
    local password = ""
    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    print("New password: " .. password)
    return password
end
password = getNewPassword()

local function generateNew()
    io.write("Enter password length (between 8 and 60 characters): ")
    local length = tonumber(io.read())

    -- Validate password length input
    while not length or length < 8 or length > 60 do
        io.write("Invalid length. Please enter a number between 8 and 60: ")
        length = tonumber(io.read())
    end

    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*();:"
    local password = ""
    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    -- print("New password: " .. password)
    return password
end

print(" ") -- spacer
print("Generated password: " .. password)

print("Type 'new' if you do not like the password that has been generated above.")
print("You can only do this one more time. Use wisely...")

local input = io.read()

if input == "new" then
    password = generateNew()

    print("2nd generated password: " .. password)

end
