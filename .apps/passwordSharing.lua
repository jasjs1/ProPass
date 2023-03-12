--[[
    This is the basic password sharing. If you would like to get extra fields to share, that is a subscription.
]]

local function combineFuncs()
    local email
    repeat
        io.write("Email: ")
        email = io.read()

        -- Check if the email matches the pattern
        if email:match(".+@.+%.com$") or email:match(".+@.+%.org$") or
            email:match(".+@.+%.edu$") or email:match(".+@.+%.net$") or
            email:match(".+@.+%.io$") or email:match(".+@.+%.me$") or
            email:match(".+@.+%.ca$") or email:match(".+@.+%.tech$") or
            email:match(".+@.+%.ai$") or email:match(".+@.+%.studio$") or
            email:match(".+@.+%.gov$") then
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

    local file, err = io.open("sharedPassword.txt", "w")
    if not file then
        print("Error opening file:", err)
        return
    end

    file:write("Email/username: " .. email .. "\n")
    file:write("Password: " .. sharedPassword .. "\n")
    file:write("Recipients email: " .. recipientsEmail .. "\n")

    file:close()

    print("Password shared successfully!")
end

-- Function to check if the entered password matches the MasterPassword
function checkPassword(password)
    local file = io.open("MasterPassword.txt", "r") -- open the file for reading
    local contents = file:read("*all") -- read the contents of the file
    file:close() -- close the file
  
    return (password == contents) -- return true if the passwords match, false otherwise
  end
  
  -- Get user input for password
  io.write("Enter the master password:")
  local input = io.read()
  
  if checkPassword(input) then
    combineFunc()
  else
    print("Passwords do not match. Exiting...")
  end
  
