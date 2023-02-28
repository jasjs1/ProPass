file = io.open("CORP_2FactorCode.txt", "r")

storedCode = file:read("*all")
file:close()

print("Enter your saved 2FA code:")
local inputed2FACode = io.read()

if inputed2FACode == storedCode then
    print("2FA code has been confirmed!")
else
    print("Incorrect 2FA code, please try again.")
end
