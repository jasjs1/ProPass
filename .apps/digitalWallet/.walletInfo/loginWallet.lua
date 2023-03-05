local function login()

    io.write("Email: ")
    local email = io.read()

    io.write("Password: ")
    local password = io.read()

    io.write("2FA code: ")
    local wallet2FACode = io.read()
    
    print("Login secessfull!")


end

local premiumFile = io.open("subscriptionInfo.txt")

if premiumFile ~= nil then
    login()
else
    print("")
    print("A subscirption is required to use all aspects of ProPass Digitial Wallet")
    print("")
    return
end
