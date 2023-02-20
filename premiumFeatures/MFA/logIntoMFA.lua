file = io.open("MFA.txt", "r")

storedCode = file:read("*all")
file:close()

print("Enter your MFA code: ")
local inputedMFACode = io.read()

if mfaInputCode == storedMFA then
    print("MFA code is correct!")
else
    print("Incorrect MFA code, please try again.")
end
