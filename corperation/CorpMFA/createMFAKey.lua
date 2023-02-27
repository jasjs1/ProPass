local file = io.open("CORP_MFA.txt", "w")


file:write("MFA Code: ")


io.write("Enter MFA input code: ")
local mfaInputCode = io.read()

file:write(mfaInputCode)
file:close()
