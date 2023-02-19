file = io.open("masterPassword.txt", "w")

io.write("Master password: ")
masterPassword = io.input():read()

file:write(masterPassword)
file:close()
local storedMasterPasssword = masterPassword
