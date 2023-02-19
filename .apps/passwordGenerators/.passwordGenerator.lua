-- password.lua

local function generatePassword(length)
    local charset =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*();"
    local password = ""
    for i = 1, length do
      local index = math.random(1, string.len(charset))
      password = password .. string.sub(charset, index, index)
    end
    return password
  end
  
  local function gradePassword(password)
    local score = 0
    
    -- Length criteria
    if #password >= 8 then
      score = score + 1
    end
    if #password >= 12 then
      score = score + 1
    end
    if #password >= 16 then
      score = score + 1
    end
    
    -- Character class criteria
    local hasLower = string.match(password, "[a-z]")
    local hasUpper = string.match(password, "[A-Z]")
    local hasDigit = string.match(password, "[0-9]")
    local hasSymbol = string.match(password, "[!@#$%^&*();]")
    
    if hasLower then
      score = score + 1
    end
    if hasUpper then
      score = score + 1
    end
    if hasDigit then
      score = score + 1
    end
    if hasSymbol then
      score = score + 1
    end
    
    -- Bonus points for meeting all criteria
    if score == 5 then
      score = score + 1
    end
    
    -- Convert score to grade
    if score == 0 then
      return "F"
    elseif score == 1 then
      return "D"
    elseif score == 2 then
      return "C"
    elseif score == 3 then
      return "B"
    elseif score >= 4 then
      return "A"
    end
  end
  
  local function savePassword(password, passwordFor, providedLogin, isPaswordShared)
    local filename = "Saved Password.txt"
    local file = io.open(filename, "w")
  
    file:write("Password: " .. password .. "\n")
    file:write("Password for: " .. passwordFor .. "\n")
    file:write("Login email: " .. providedLogin .. "\n")
    file:write("Is password shared: " .. isPaswordShared .. "\n")
    file:write("Date created: " .. os.date("%M_%d_%y_%h_%m"))
  
    file:close()
  end
  
  local function promptUserForPassword()
    print("")
    print("ProPass")
    print("Enter desired password length (8-40 characters):")
    local length = tonumber(io.read())
    while length < 8 or length > 40 do
      print("")
      print("Invalid length. Enter a length between 8 and 40:")
      length = tonumber(io.read())
    end
  
    print("Password for: ")
    local passwordFor = io.read()
  
    print("Login email for this website: ")
    local providedLogin = io.read()
  
    print("Is this password shared: ")
    local isPaswordShared = io.read()
  
    return length, passwordFor, providedLogin, isPaswordShared
  end
  
  local function generateAndSavePassword()
    local length, passwordFor, providedLogin, isPaswordShared = promptUserForPassword()
    local password = generatePassword(length)
    local score = gradePassword(password)
    return password, score
  end
  
  local password, score = generateAndSavePassword()
  print("Your generated password is: " .. password)
  print("Password grade is: " .. score)
  
