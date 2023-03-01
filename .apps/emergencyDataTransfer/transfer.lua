-- Specify the directory where the files are located
local directory = "/Macintosh HD/Users/jaycesagvold/Downloads/ProPass-main"

-- Set the filenames for the account and password files
local accountFilename = "UserAccountData.txt"
local passwordFilename = "savedPassword.txt"

-- Construct the full file paths using the directory and filename variables
local accountFilePath = directory .. "/" .. accountFilename
local passwordFilePath = directory .. "/" .. passwordFilename

-- Open the files for reading
local accountFile = io.open(accountFilePath, "r")
local passwordFile = io.open(passwordFilePath, "r")

-- Check if the files were opened successfully
if not accountFile then
    print("Error: could not open account file for reading.")
end
if not passwordFile then
    print("Error: could not open password file for reading.")
end

-- Read the contents of the files
local accountFilename = accountFile:read("*all")
local passwordFilename = passwordFile:read("*all")

-- Close the files
accountFile:close()
passwordFile:close()

-- Create a new file for appending
local outputFile = io.open(directory .. "/EMERGENCYDATATRANSFER.txt", "a")

-- Check if the file was created successfully
if not outputFile then
    print("Error: could not create output file.")
end

-- Write the contents of the account and password files to the output file
outputFile:write("User Account Data:\n" .. accountData .. "\n\n")
outputFile:write("Saved Passwords:\n" .. passwordData)

-- Close the output file
outputFile:close()
