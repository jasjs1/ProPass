local function createWallet()
    print("")

    io.write("Full name: ")
    local name = io.read()

    io.write("Age: ")
    local age = tonumber(io.read())

    if age and age <= 17 then
        print("You are not able to use ProPass Digital Wallet. You must be 18 or older.")
        return
    end

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
    local password = io.read()

    io.write("Address: ")
    local address = io.read()

    io.write("Country of residence: ")
    local countryOfResidence = io.read():lower()

    if countryOfResidence == "united states" then
        print("Wallet created!")
    else
        print("You must be in the United States to use ProPass Digital Wallet.")
    end
end

createWallet()
