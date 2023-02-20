local function createSecurityPromptAfterAccountIsCreated()

    io.write("Security Key: ")
    local securityKey = io.read()

    local securityQuestionFile = io.open("SecurityKeyFile.txt", "w")

    securityQuestionFile:write(securityKey)
    securityQuestionFile:close()

    print("Security Key was created.")

end
createSecurityPromptAfterAccountIsCreated()
