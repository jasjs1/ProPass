
io.write("Type of vault storage:")
local typeOfStorage = io.read()

io.write("Contents to vault: ")
local cardentialsToVault = io.read()

io.write("Website/URL that is being vaulted: ")
local websiteOrURLHost = io.read()

local function writeData()

    local file = io.open("customVault.txt", "a")

    file:write("Vault storage: " .. typeOfStorage .. "\n")
    file:write("contents of storage: " .. cardentialsToVault .. "\n")
    file:write("website/url host that vault is stored: " .. websiteOrURLHost .. "\n")

    file:close()
    
end

print("Would you like to create a .txt file of the inputted data that you proved?")
print("Provied data:")
print(typeOfStorage)
print(cardentialsToVault)
print(websiteOrURLHost)

local input = io.read()

if input == "yes" then
    writeData()

    print("File was created. Check the explorer for: customVault.txt")
end
