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

    print("Creating a 2FA key is required to use Digital Wallet.")
    io.write("2FA key: ")
    local walletTwoFAKey = io.read()
    local walletFactorFile = io.open("wallet2FACode.txt", "w")
    walletFactorFile:write(walletTwoFAKey .. "\n")
    walletFactorFile:close()

    io.write("Address: ")
    local address = io.read()

    io.write("Country of residence: ")
    local countryOfResidence = io.read():lower()

    if countryOfResidence == "united states" then
        print("Wallet created!")

        local file = io.open("DigitalWalletFile.txt", "w")
        file:write("Name: " .. name .. "\n")
        file:write("Age: " .. age .. "\n")
        file:write("Email: " .. email .. "\n")
        file:write("Password: " .. password .. "\n")
        file:write("Adress: " .. address .. "\n")
        file:write("COR: " .. countryOfResidence .. "\n")
        file:close()
    else
        print("You must be in the United States to use ProPass Digital Wallet.")
    end
end

createWallet()
