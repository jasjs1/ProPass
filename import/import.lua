function writePasswordToFile()
    
    repeat

        io.write("Password: ")
        local password = io.read()

        io.write("Password for: ")
        local passwordFor = io.read()

        local file = io.open("importedPasswords.txt", "a")
        file:write("Password: " .. password .. "\n")
        file:write("Password for: " .. passwordFor .. "\n")
        file:write("\n")
        file:close()

        io.write("Enter 'stop' to quit or any other key to continue: ")
        local input = io.read()
    until input == "stop"
end
writePasswordToFile()
