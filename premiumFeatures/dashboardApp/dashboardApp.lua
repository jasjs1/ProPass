
-- Check if subscriptionInfo.txt exists
if io.open("subscriptionInfo.txt", "r") == nil then
  print("You need to have a Preimum account, so you are not able to use ProPass Dashboard")
else
  os.execute("sleep 1.1")
  print("checking for subscription file...")
  os.execute("sleep 0.0005")
  print("Subscription found!")
  -- continue with the rest of your code here
end



local function generateANewPassword(length)
    local password = ""
    local charset =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-={}|[]:;'<>,.?/~"
    math.randomseed(os.time())

    for i = 1, length do
        local randomIndex = math.random(1, #charset)
        password = password .. string.sub(charset, randomIndex, randomIndex)
    end

    return password
end

-- Define function to get new password
function getNewPass()
  print("Generating new password...")
  os.execute("sleep 0.5")
  print("Your new password is: " .. generatePassword())
end

-- Define function to display password strength graph
function passwordStrengthGraph()
  print("Generating password strength graph...")
  os.execute("sleep 0.7")
  print("Here is your password strength graph:")
  os.execute("sleep 0.5")
  print(generatePasswordStrengthGraph())
end

-- Define function to grade password with letter grade
function gradePasswordWithLetterGrade()
  print("Please input password to grade:")
  local password = io.read()
  local grade = gradePassword(password)
  print("Password grade: " .. grade)
  local letterGrade = letterGradeFromNumericGrade(grade)
  print("Password letter grade: " .. letterGrade)
end

-- Check if subscriptionInfo.txt exists
if io.open("subscriptionInfo.txt", "r") == nil then
  print("You need to have an active subscription.")
else
  os.execute("sleep 1.1")
  print("checking for subscription file...")
  os.execute("sleep 0.0005")
  print("Subscription found!")
  -- continue with the rest of your code here

  -- Define variable to hold user input
  local input

  -- Display menu options to user and wait for input
  while input ~= "!quit" do
    print("")
    
    print("!new - Generate a new password")
    print("!psg - Display password strength graph")
    print("!PSG - Grade password with letter grade")
    input = io.read()

    if input == "!new" then
      getNewPass()
    elseif input == "!psg" then
      passwordStrengthGraph()
    elseif input == "!PSG" then
      gradePasswordWithLetterGrade()
    else
      print("Error: Incorrect input, please input one of the commands below:")
    end
  end
end
