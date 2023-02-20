local function createSubscription(name, email, signupPassword, paymentType)

    local file = io.open("subscriptionInfo.txt", "w")

    file:write("Name: " .. name .. "\n")
    file:write("Email: " .. email .. "\n")
    file:write("Password: " .. signupPassword .. "\n")
    file:write("Payment type: " .. paymentType .. "\n")

    file:close()

    print("Subscription created successfully!")

    end
    
local function signUpForSubscription()

    print("Name:")
    local name = io.read()

    print("Email:")
    local subscriptionEmail = io.read()

    print("Password:")
    local subscriptionPassword = io.read()

    print("Payment type:")
    local paymentType = io.read()

    return name, email, signupPassword, paymentType
end
    
    local function validateInputtedFields(name, email, signupPassword, paymentType)

    print("\nValidate that the information below is correct:")

    print("\nName: " .. name)
    print("Email: " .. email)
    print("Password: " ..signupPassword)
    print("Payment type: " ..paymentType)
end
    
    local name, email, signupPassword, paymentType = signUpForSubscription()
    
    validateInputtedFields(name, email, signupPassword, paymentType)
    print("\nType 'yes' with the information above to create a subscription.")
    
    if io.read() == "yes" then

    createSubscription(name, email, signupPassword, paymentType)

    else
    print("Subscription not created.")
end
