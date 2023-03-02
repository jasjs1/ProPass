io.write("Corperation Recovery Code: ")
local corperationRecoveryCode = io.read()

local file = io.open("CORP_recoveryCode.txt", "w")

file:write(corperationRecoveryCode)
file:close()

print("Corperation Recovery Code file was created. Check the explorer for: CORP_recoveryCode.txt")
