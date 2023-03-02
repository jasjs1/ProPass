io.write("Corporation name: ")
local corporationName = io.read()

repeat
  io.write("Corporation HQ email: ")
  local corporationHQEmail = io.read()

  -- Check if the email matches the pattern
  if corporationHQEmail:match(".+@.+%.com$") or corporationHQEmail:match(".+@.+%.org$") 
  or corporationHQEmail:match(".+@.+%.edu$")
  or corporationHQEmail:match(".+@.+%.net$")
  or corporationHQEmail:match(".+@.+%.io$")
  or corporationHQEmail:match(".+@.+%.me$")
  or corporationHQEmail:match(".+@.+%.ca$")
  or corporationHQEmail:match(".+@.+%.tech$")
  or corporationHQEmail:match(".+@.+%.ai$")
  or corporationHQEmail:match(".+@.+%.studio$")
  or corporationHQEmail:match(".+@.+%.gov$")
  then
    -- Valid email address
    break
  else
    -- Invalid email address
    print("Invalid email address. Please enter a valid email address that ends with .com or .org.")
  end
until false

io.write("Corperation password: ")
local corperationPassword = io.read()

io.write("Employee size: ")
local employeeSize = io.read()

io.write("Company website: ")
local companyWebsite = io.read()

io.write("Company type: ")
local companyType = io.read()

io.write("Admin Pin: ")
local adminPin = io.read()

-- Billing information --

io.write("Payment type: ")
local paymentType = io.read()

io.write("Card Number: ")
local cardNumber = io.read()

-- End of billing information -- 

io.write("Other Notes: ")
local otherNotes = io.read()

local function createEmployee()
  print("")
  io.write("Employee name: ")
  local employeeName = io.read()

  repeat
    io.write("Employee email adress: ")
    local employeeEmailAdress = io.read()
  
    -- Check if the email matches the pattern
    if employeeEmailAdress:match(".+@.+%.com$") or employeeEmailAdress:match(".+@.+%.org$") 
    or employeeEmailAdress:match(".+@.+%.edu$")
    or employeeEmailAdress:match(".+@.+%.net$")
    or employeeEmailAdress:match(".+@.+%.io$")
    or employeeEmailAdress:match(".+@.+%.me$")
    or employeeEmailAdress:match(".+@.+%.ca$")
    or employeeEmailAdress:match(".+@.+%.tech$")
    or employeeEmailAdress:match(".+@.+%.ai$")
    or employeeEmailAdress:match(".+@.+%.studio$")
    or employeeEmailAdress:match(".+@.+%.gov$")
    then
      -- Valid email address
      break
    else
      -- Invalid email address
      print("Invalid email address. Please enter a valid email address that ends with .com or .org.")
    end
  until false

  io.write("Employee password: ")
  local employeePassword = io.read()

  io.write("Employee role: ")
  local employeeRole = io.read()

  print("")
  print("New employee created!")
  print("To stop creating employees: type 'stop'")

  local input = io.read()

  if input == "stop" then
    return employeeName, employeeEmail, employeePassword, employeeRole
  else
    return createEmployee()
  end
end

local function writeEmployeeToFile()
  local employeeName, employeeEmail, employeePassword, employeeRole = createEmployee()

  local file = io.open("employeeFile.txt", "a")

  file:write("Employee name: " .. employeeName .. "\n")
  file:write("Employee email: " .. employeeEmail .. "\n")
  file:write("Employee password: " .. employeePassword .. "\n")
  file:write("Employee role: " .. employeeRole .. "\n")

  file:close()

  print("Employee information written to file.")
end
writeEmployeeToFile()
