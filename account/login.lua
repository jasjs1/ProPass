print("Your email:")
local email = io.read()

print("Your password:")
local signupPassword = io.read()


local accountDataFile = "userProvidedAccountData.txt"

if io.open(accountDataFile, "r") then

    local file = io.open(accountDataFile, "r")
    local data = file:read("*all")

    file:close()    

    local emailLine = string.match(data, "Email:([^\r\n]+)")
    local passwordLine = string.match(data, "Password:([^\r\n]+)")

    if emailLine == email and passwordLine == password then
        
        print("Login successful.")

    else
        print("Incorrect email or password.")
    end

else

    print("No account data found for this email.")

end
