file:write("Your Pin 2FA code: ")
local twoFactorCode = io.read()

local input = io.read()

if input == "1234567890" then
    local file = io.open("Pin2FactorCode.txt", "w")
    file:write(twoFactorCode)
    file:close()
    print("Successfully wrote two-factor authentication code to file.")
else
    print("Please use '1234567890' for the pin 2FA.")
end
