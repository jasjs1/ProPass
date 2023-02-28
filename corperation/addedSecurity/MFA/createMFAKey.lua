file = io.open("CORP_MFA.txt", "w")

io.output():write("Enter your favorite city:")
mfaInputCode = io.input()file:read()

file:write(mfaInputCode)
file:close()
