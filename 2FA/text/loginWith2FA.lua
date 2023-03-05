file = io.open("2FactorCode.txt", "r")

storedCode = file:read("*all")
file:close()

print("Enter your saved 2FA code:")
local inputed2FACode = io.read()

if inputed2FACode == storedCode then
    print("2FA code is correct!")

else
    print("Incorrect 2FA code, please try again.")
end

