file = io.open("EmailStore.txt", "a")

io.write("Email: ")
inputStore = io.read()

file:write("Email: " .. inputStore .. "\n")
file:write("Date audited: " .. os.date("%M_%d_%y_%H_%m") .. "\n")
file:close()
 
