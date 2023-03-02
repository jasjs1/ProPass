io.write("Corperation Recovery Code: ")
local corperationRecoveryCode = io.read()

local file = io.open("RecoveryCode_CORP.txt", "w")

file:write(corperationRecoveryCode)
file:close()

print("Corperation Recovery Code file was created. Check the explorer for: RecoveryCode_CORP.txt")
