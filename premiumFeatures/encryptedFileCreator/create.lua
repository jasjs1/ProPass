function createFile()
    print("")
    print("File Creator:")
    print("")

    io.write("File Name: ")
    local fileName = io.read()

    io.write("File type: ")
    local fileType = io.read()

    io.write("Content of the file: ")
    local fileContents = io.read()

    local file = io.open(fileName .. "." .. fileType, "w")

    file:write(fileContents)
    file:close()

    print("File created! Look for: " .. fileName .. "." .. fileType .. " in the explorer!")
end

createFile()
