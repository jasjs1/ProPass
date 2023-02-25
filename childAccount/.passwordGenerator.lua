local function generatePassword(length)
  local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*();"
  local password = ""
  for i = 1, length do
    local index = math.random(1, string.len(charset))
    password = password .. string.sub(charset, index, index)
  end
  return password
end

local function gradePassword(password)
  local score = 0

  if #password >= 8 then
    score = score + 1
  end
  if #password >= 12 then
    score = score + 1
  end
  if #password >= 16 then
    score = score + 1
  end

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

  if score == 5 then
    score = score + 1
  end

  if score == 0 then


    width = 20 
    value = 0.5/3
    max_value = 1
    
    num_chars = math.floor(value / max_value * width)
    
    graph = "[" .. string.rep("/", num_chars) .. string.rep(" ", width - num_chars) .. "]"
    
    graph_with_value = string.format("%s %.2f", graph, value, "%")
    
    print("") -- Just a seperator sperating graph_with_value from the user inputted length of password
    print(graph_with_value)
    

  elseif score == 1 then
    print("Weak")


    width = 20 
    value = 1/3
    max_value = 1
    
    num_chars = math.floor(value / max_value * width)
    
    graph = "[" .. string.rep("/", num_chars) .. string.rep(" ", width - num_chars) .. "]"
    
    graph_with_value = string.format("%s %.2f", graph, value, "%")
    
    print("") -- Just a seperator sperating graph_with_value from the user inputted length of password
    print(graph_with_value)
    
  elseif score == 2 then
    print("Moderate")


    width = 20 
    value = 2/3
    max_value = 1
    
    num_chars = math.floor(value / max_value * width)
    
    graph = "[" .. string.rep("/", num_chars) .. string.rep(" ", width - num_chars) .. "]"
    
    graph_with_value = string.format("%s %.2f", graph, value, "%")
    
    print("") -- Just a seperator sperating graph_with_value from the user inputted length of password
    print(graph_with_value)
    
  elseif score == 3 then
    print("Strong")

    
    width = 20 
    value = 2.5/3
    max_value = 1
    
    num_chars = math.floor(value / max_value * width)
    
    graph = "[" .. string.rep("/", num_chars) .. string.rep(" ", width - num_chars) .. "]"
    
    graph_with_value = string.format("%s %.2f", graph, value, "%")
    
    print("") -- Just a seperator sperating graph_with_value from the user inputted length of password
    print(graph_with_value)
    
  elseif score >= 4 then
    print("Extremely strong!")


    width = 20 
    value = 3/3
    max_value = 1
    
    num_chars = math.floor(value / max_value * width)
    
    graph = "[" .. string.rep("/", num_chars) .. string.rep(" ", width - num_chars) .. "]"
    
    graph_with_value = string.format("%s %.2f", graph, value, "%")
    
    print("") -- Just a seperator sperating graph_with_value from the user inputted length of password
    print(graph_with_value)
    
  end

  -- local width = 20
  -- local value = score / 3
  -- local max_value = 1
  -- local num_chars = math.floor(value / max_value * width)
  -- local graph = "[" .. string.rep("/", num_chars) .. string.rep(" ", width - num_chars) .. "]"
  -- local graph_with_value = string.format("%s %.2f%s", graph, value * 100, "%")
  -- print(graph_with_value)

  -- return score
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
  print("Enter desired password length (8-60 characters):")
  local length = tonumber(io.read())
  while length < 8 or length > 60 do
    print("")
    print("Invalid length. Enter a length between 8 and 60:")
    length = tonumber(io.read())
  end

  return length
end
  
  local function generateAndSavePassword()
    local length, passwordFor, providedLogin, isPaswordShared = promptUserForPassword()
    local password = generatePassword(length)
    local score = gradePassword(password)
    return password, score
  end
  
local password, score = generateAndSavePassword()
print("Your generated password is: " .. password)
-- return passwordStrengh
  -- print("Password grade is: " .. score)
