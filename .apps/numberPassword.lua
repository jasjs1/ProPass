local function generatePassword(length)
    local charset = "1234567890"
    local password = ""
    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    return password
end

print("")
print("Enter your desired password length (8-40 characters):")
local length = tonumber(io.read())
while length < 8 or length > 40 do
    print("Invalid length. Please input a length between 8 and 40:")
    length = tonumber(io.read())
end

local password = generatePassword(length)
print("")

print("Password for:")
local passwordFor = io.read()

print("Login email for this website:")
local providedLogin = io.read()

print("Is this password shared:")
local isPasswordShared = io.read()

print("Your generated password is: " .. password)
 
local function writeDataToFile()
    local file = io.open("NumberPassword.txt", "w")

    file:write("Password: " .. password .. "\n")
    file:write("Password for: " .. passwordFor .. "\n")
    file:write("Is password shared: " .. isPasswordShared .. "\n")

    file:close()
end

writeDataToFile()
