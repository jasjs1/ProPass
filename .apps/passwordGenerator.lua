local function generatePassword(length)
    local charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*();"
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
    print("")
    print("Invalid length. Enter a length between 8 and 40:")
    length = tonumber(io.read())
end

print("Password for: ")
local passwordFor = io.read()

print("Email for this website: ")
local providedLogin = io.read()

print("Is this password shared: ")
local isPaswordShared = io.read()

print("")

local password = generatePassword(length)
print(" ")
print("Your generated password is: " .. password)

local filename = "Saved Password.txt"
local file = io.open(filename, "w")

print("Password file generated! Check the explorer!")

file:write("Password: " .. password .. "\n")
file:write("Password for: " .. passwordFor .. "\n")
file:write("Login email: " .. providedLogin .. "\n")
file:write("Is password shared: " .. isPaswordShared .. "\n")
file:write("Date created: " .. os.date("%M_%d_%y_%h_%m"))

file:close()

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

            print("Password file generated, check the explorer!")
            print("Rerun this file to get a new password.")
            file:write(password)
            file:close()
        end
    end
end
