io.output():write("Your 2FA code: ")
twoFactorCode = io.input():read()

local function writeToFile()

    local file = io.open("2FactorCode.txt", "w")

    file:write("Your 2FA code: " .. twoFactorCode)
    file:close()

end
writeToFile()
