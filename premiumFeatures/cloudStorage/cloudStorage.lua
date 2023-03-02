-- function to save a file to disk
function save_file(filename, filetype, filecontent)
    local file = io.open(filename.."."..filetype, "w")
    file:write(filecontent)
    file:close()
    print("File saved as "..filename.."."..filetype)
end

-- function to upload a file to the cloud
function upload_file(filename, filetype, filecontent)
    -- send file content to the cloud
    print("Uploading file "..filename.."."..filetype.." to the cloud...")
    print("File content: "..filecontent)
    print("Upload complete.") 
end

-- get user input for filename, filetype, and file content
io.write("Enter a filename: ")
local filename = io.read()

io.write("Enter a filetype: .")
local filetype = io.read()

io.write("Enter file content: ")
local filecontent = io.read()

-- save file locally
save_file(filename, filetype, filecontent)

-- upload file to cloud
upload_file(filename, filetype, filecontent)
