file = io.open("passwordStore.txt", "a")

io.write("Password for store: ")
inputStore = io.read()

file:write(inputStore .. "\n")
file:write("Date audited: " .. os.date("%M_%d_%y_%H_%m") .. "\n")
file:close()
