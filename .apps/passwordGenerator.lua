local function generatePassword(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*();"
    local password = ""
    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    return password
end

print("")
print("Enter desired password length (8-40 characters):")
local length = tonumber(io.read())
while length < 8 or length > 40 do
    print("Invalid length. Enter a length between 8 and 40:")
    length = tonumber(io.read())
end


print("Password for: ")
local passwordFor = io.read()

local password = generatePassword(length)
print("")
print("Your generated password is: " .. password)
print("Type 'save' to save your password!")

local input = io.read()

if input == "save" then
    local filename = "Saved Password.txt"
    local file = io.open(filename, "w")

    print("Password file generated! Check the explorer!")
    file:write(password, ", ")
    file:write(passwordFor)
    file:close()
end

while true do
    local input = io.read()

    if input == "generate new" then
        password = generatePassword(length)
        print("Your generated password is: " .. password)
        print("Type 'save' to save your password!")

        local input = io.read()

        if input == "save" then
            local filename = "Saved Password_" .. os.date("%M-%d_%y_%H_%M")
            local file = io.open(filename, "w")

            print("Password file generated! Check the explorer!")
            file:write(password)
            file:close()
        end
    end
end
