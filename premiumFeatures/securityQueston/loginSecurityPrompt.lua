function loginWithSecurityKey()

    local securityQuestionFile = io.open("SecurityKeyFile.txt", "r")
    

    if securityQuestionFile then

        local securityPrompt = securityQuestionFile:read("*line")
        securityQuestionFile:close()


        io.write("Security Key" .. ": ")
        local userAnswer = io.read()


        if userAnswer == "correct answer" then
            print("Security Key is correct! Logged in.")
        end
    else
        print("ERROR: Security Key file not found or could not be opened.")
    end
end
loginWithSecurityKey()

print("Security Key is correct! Logged in.")
