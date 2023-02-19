local function createEncryptionKey()
    local keyLength = 16
    local key = ""
    
    for i = 1, keyLength do 
        local randNum = math.random(0, 255)
        key = key .. string.char(randNum)
    end
    
    return key
end

local function createNote()
    local maxInputLength = 250 -- Intitial value14

    io.write("Your note here: ")
    local noteContainer = io.read()

    if #noteContainer > maxInputLength then
        print("Note length is too long.")
    else
        print("Note saved.")

        local filename = "Note-" .. os.date("%Y-%m-%d-%H-%M") .. ".txt"
        local file = io.open(filename, "w")

        local key = createEncryptionKey()
        file:write(noteContainer)
        file:write("Encryption Key: " .. key)
        file:close()
    end
end

createNote()
