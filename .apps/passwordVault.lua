io.write("Enter Password: ")

local userInput = io.read()

local function createFile()
    local file = io.open("password_" .. os.date("%Y-%m-%d_%H-%M-%S") .. ".txt", "w")
    print("Password file generated!")
    file:write(userInput)
    file:close()


end
createFile()


local function deleteAllPasswordSaveFiles()

    print("Would you like to delete all of the password files? YOU CANNOT GET THE FILES BACK.")
    print("")
    print("Type '!del' if you would like to delete all of them.")

    local input = io.read()

    if input == "!del" then
        local files = io.popen("ls *.txt") -- Use the io.popen() function to list all .txt files in the current directory
        local fileList = files:read("*all") -- Read the entire output of the command and store it in a variable
        files:close() -- Close the file handle
        
        for file in string.gmatch(fileList, "%S+") do -- Iterate through the list of files
            os.remove(file) -- Use the os.remove() function to delete each file
        end

        print("All password files have been deleted.")

    else
        print("Ok, generated files will not be deleted.")


    end
end
deleteAllPasswordSaveFiles()