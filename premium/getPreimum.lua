local function validateInputtedFields(name, email, signupPassword, paymentType)
    print("\nValidate that the information below is correct:")
    print("\nName: " .. name)
    print("Email: " .. email)
    print("Password: " ..signupPassword)
    print("Payment type: " ..paymentType)
end

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

    repeat
        print("Email:")
        local subscriptionEmail = io.read()

        if subscriptionEmail:match(".+@.+%.com$") or subscriptionEmail:match(".+@.+%.org$") 
        or subscriptionEmail:match(".+@.+%.edu$")
        or subscriptionEmail:match(".+@.+%.net$")
        or subscriptionEmail:match(".+@.+%.io$")
        or subscriptionEmail:match(".+@.+%.me$")
        or subscriptionEmail:match(".+@.+%.ca$")
        or subscriptionEmail:match(".+@.+%.tech$")
        or subscriptionEmail:match(".+@.+%.ai$")
        or subscriptionEmail:match(".+@.+%.studio$")
        or subscriptionEmail:match(".+@.+%.gov$")
        then
            break
        else
            print("Invalid email address. Please use a proper TLD, if you don't know what a TLD is, please check tld.md")
        end
    until false

    print("Password:")
    local subscriptionPassword = io.read()

    print("Payment type:")
    local paymentType = io.read()

    return name, subscriptionEmail, subscriptionPassword, paymentType
end

local name, subscriptionEmail, subscriptionPassword, paymentType = signUpForSubscription()
validateInputtedFields(name, subscriptionEmail, subscriptionPassword, paymentType)
print("\nType 'yes' with the information above to create a subscription.")

if io.read() == "yes" then
    createSubscription(name, subscriptionEmail, subscriptionPassword, paymentType)
else
    print("Subscription not created.")
end
