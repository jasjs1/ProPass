--[[
    This is the basic password sharing. If you would like to get extra fields to share. That is a subscription.
]]

local function combineFuncs()
    
    -- continue with the rest of your code here
    
    repeat
        io.write("Email: ")
        local email = io.read()
      
        -- Check if the email matches the pattern
        if email:match(".+@.+%.com$") or email:match(".+@.+%.org$") 
        or email:match(".+@.+%.edu$")
        or email:match(".+@.+%.net$")
        or email:match(".+@.+%.io$")
        or email:match(".+@.+%.me$")
        or email:match(".+@.+%.ca$")
        or email:match(".+@.+%.tech$")
        or email:match(".+@.+%.ai$")
        or email:match(".+@.+%.studio$")
        or email:match(".+@.+%.gov$")
        then
          -- Valid email address
          break
        else
          -- Invalid email address
                print("Invalid email address. Please enter a valid email address.")
        end
      until false
    io.write("Password: ")
    local sharedPassword = io.read()

    io.write("Recipients email: ")
    local recipientsEmail = io.read()

    local file = io.open("sharedPassword.txt", "w")
    file:write("Email/username: " .. email .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")
    file:close()

end

local function getUserInput()

    local email = ""
    while not email:match(".+@.+%..+") do
      io.write("Email: ")
      email = io.read()
      if not email:match(".+@.+%..+") then
        print("Invalid email address. Please enter a valid email address.")
      end
    end

    io.write("Password: ")
    local sharedPassword = io.read()

    io.write("Recipients email: ")
    local recipientsEmail = io.read()


    io.write("What site is the password used on: ")
    local passwordWebHost = io.read()

    return email, sharedPassword, recipientsEmail, passwordWebHost
end

local email, sharedPassword, recipientsEmail, passwordWebHost = getUserInput()
local function writeToFile(email, sharedPassword, recipientsEmail, passwordWebHost)

    local file = io.open("sharedPassword.txt", "w")
    file:write("Email/username: " .. email .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")
    file:write("Password is used on: " .. passwordWebHost .. "\n")
    file:close()

    print("Shared password created!")

end
writeToFile(email, sharedPassword, recipientsEmail, passwordWebHost)

while true do 

    print("")
    print("Type 'new' to create a new shared password")
    print("")

    
    local input = io.read()

    if input == "new" then
        combineFuncs()

    elseif input == "" then
        print("Invalid input")
        -- break
    end
end
