local function createSecurityPromptAfterAccountIsCreated()

    io.write("Security prompt: ")
    local securityPrompt = io.read()

    local securityQuestionFile = io.open("SecurityPromptFile.txt", "w")

    securityQuestionFile:write(securityPrompt)
    securityQuestionFile:close()

end
createSecurityPromptAfterAccountIsCreated()
