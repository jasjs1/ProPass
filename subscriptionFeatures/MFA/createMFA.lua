file = io.open("MFA.txt", "w")

io.write("Your MFA code: ")
mfaInputCode = io.input():read()

file:write(mfaInputCode)
file:close()

local storedMFA = mfaInputCode
