local function generateSimplePassword(length)

    local charset = "abcdefghijklmnopqrstuvwxyz1234567890"

    local password = ""

    for i = 1, length do
        local index = math.random(1, string.len(charset))
        password = password .. string.sub(charset, index, index)

    end
    
    return password

end

local function generatePasswordStuff()

    print("Password for:")
    local passwordFor = io.read()

    local password = generateSimplePassword(8)
    print("Your generated password is: " .. password)

    local file = io.open("SimplePassword.txt", "w")

    file:write(passwordFor .. ", ")
    file:write(password)

    file:close()

end
generatePasswordStuff()
