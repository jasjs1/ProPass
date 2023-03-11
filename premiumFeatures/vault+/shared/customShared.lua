local function customShared()

    io.write("Field: ")
    local field1 = io.read("*line")

    io.write("Field: " .. field1 .. "Contents: ")
    local contents1 = io.read("*line")

    io.write("Field: ")
    local field2 = io.read("*line")

    io.write("Field: " .. field2 .. "Contents: ")
    local contents2 = io.read("*line")

    io.write("Field: ")
    local field3 = io.read("*line")

    io.write("Field: " .. field3 .. "Contents: ")
    local contents3 = io.read("*line")

    io.write("Field: ")
    local field4 = io.read("*line")

    io.write("Field: " .. field4 .. "Contents: ")
    local contents4 = io.read("*line")

    io.write("Field: ")
    local field5 = io.read("*line")

    io.write("Field: " .. field5 .. "Contents: ")
    local contents5 = io.read("*line")

    io.write("Field: ")
    local field6 = io.read("*line")

    io.write("Field: " .. field6 .. "Contents: ")
    local contents6 = io.read("*line")

    io.write("Field: ")
    local field7 = io.read("*line")

    io.write("Field: " .. field7 .. "Contents: ")
    local contents7 = io.read("*line")

    -- create file

    io.write("File name: ")
    local filename = io.read("*line")

    io.write("File type: ")
    local filetype = io.read("*line")

    local file = io.open(filename .. "." .. filetype, "w")

    file:write(field1 .. " " .. contents1 .. "\n")
    file:write(field2  .. " " .. contents2 .. "\n")
    file:write(field3  .. " " .. contents3 .. "\n")
    file:write(field4  .. " " .. contents4 .. "\n")
    file:write(field5  .. " " .. contents5 .. "\n")
    file:write(field6  .. " " .. contents6 .. "\n")
    file:write(field7  .. " " .. contents7 .. "\n")

    file:close()

    print("Check the explorer for: " .. filename .. "." .. filetype)

end 

local subscriptionFile = io.open("subscriptionInfo.txt")

if subscriptionFile == nil then
    print("You need a ProPass Premium subscription to use Vault+. Please create a subscription to use this.")
    print("Type '!help' to get more information.")

    local input = io.read("*line")

    if input == "!help" then
        print("")
        print("Folder path for Premium: premium/getPremium.lua")
        print("")
        return
    end
else
    subscriptionFile:close()
    customShared()
end
