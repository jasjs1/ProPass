local function login()

    io.write("Email: ")
    local loginEmail = io.read()

    io.write("Password: ")
    local loginPassword = io.read()

end
login()

local function writeLogFile()

    local file = io.open("loginLog.txt")

    file:write(loginEmail)
    file:write(loginPassword)
end
writeLogFile()