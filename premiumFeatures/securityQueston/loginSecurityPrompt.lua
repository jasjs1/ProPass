function loginWithSecurityPrompt()

    local securityQuestionFile = io.open("SecurityPromptFile.txt", "r")
    
    
    if securityQuestionFile then

        local securityPrompt = securityQuestionFile:read("*line")
        securityQuestionFile:close()


        io.write("Security Prompt" .. ": ")
        local userAnswer = io.read()


        if userAnswer == "correct answer" then
            print("Access granted!")
        else
            print("Access denied!")
        end
    else
        print("ERROR: Security prompt file not found or could not be opened.")
    end
end
loginWithSecurityPrompt()
