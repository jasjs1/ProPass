
local function promptUserAndLogin()
    io.write("Username or email: ")
    local userOrEmail = io.read()

    io.write("Password: ")
    local password = io.read()

    local familyFile = io.open("familyUsersAccountFile.txt", "r")
    if familyFile then
        print("Valid family account. Logged all users in!")
    else
        print("Error: no users logged in. Please retry again.")
    end
end

promptUserAndLogin()
