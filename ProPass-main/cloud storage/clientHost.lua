local function newNote()
    io.write()
end

while true do 

    local input = io.read()

    if input == "note" then
        newNote()

    end
end