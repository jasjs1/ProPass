file = io.open("passwordStore.txt", "a")

io.output():write("Password: ")
inputStore = io.input()file:read()

file:write(inputStore)
file:close()
