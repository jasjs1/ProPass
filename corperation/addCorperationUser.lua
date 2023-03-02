local function createNewEmployee()

    io.write("Employee name: ")
local employeeName = io.read()

    
    repeat
        io.write("Employee email address: ")
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
      print("Employee created!")
      print("If you would like to create another employee please run this file again.")

      local file = io.open("employeeFile.txt", "a")

      file:write("Employee name: " .. employeeName .. "\n")
      file:write("Employee email: " .. employeeEmailAdress .. "\n")
      file:write("Employee password: " .. employeePassword .. "\n")
      file:write("Employee role: " .. employeeRole .. "\n")
      
    
      file:close()

end
createNewEmployee()
