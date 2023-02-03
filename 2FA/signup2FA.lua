file = io.open("2FactorCode.txt", "w")

io.output():write("Your 2FA code: ")
twoFactorCode = io.input():read()

file:write(twoFactorCode)
file:close()

