math.randomseed(os.time())

local function generatePassword(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*();"
    local password = ""

    for i = 1, length do
        local index = math.random(1,string.len(charset))
        password = password .. string.sub(charset, index, index)
    end
    return password
end

local function givePassword()
    local password = generatePassword(8)
    print("Your password: "..password)
end

givePassword()

