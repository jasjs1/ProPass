local function childSignup()

    io.write("Name: ")
    local nameChild = io.read()

    io.write("Password: ")
    local passwordCHILD = io.read()

    io.write("Age: ")
    local age = io.read()

    -- Verify that the child is old enough to sign up
    if tonumber(age) < 9 then
      print("Sorry, you must be at least 10 years old to sign up for ProPass.")
      return
    end
end
childSignup()

local function confrimSignup()

    print("Would you like to create an account? ")
    print("Type 'yes' to create account.")

    local input = io.read()

    if input == "yes" then
        print("Account created welcome to the team " .. nameChild .. " !")

        local file = io.open("childAcccount.txt", "w")

        file:write(nameChild .. "\n")
        file:write(passwordCHILD .. "\n")
        file:write(age .. "\n")

        file:close()
    end
end
confrimSignup()