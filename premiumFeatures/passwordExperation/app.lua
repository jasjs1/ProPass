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

    local charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*();:"
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

    local charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*();:"
    local password = ""
    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    -- print("New password: " .. password)
    return password
end

print(" ") -- spacer
print("New password: " .. password)
print("Type 'new' if you would like to get a new password.")


while true do
    local input = io.read()
    if input == "new" then
        password = generateNew()
        print("New password " .. password)
        print("Type 'new' if you would like to get a new password.")
    end
end
