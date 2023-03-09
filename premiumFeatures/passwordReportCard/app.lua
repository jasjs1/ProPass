io.write("Password to grade: ")
local passwordToGrade = io.read()

io.write("Username/email: ")
local usernameOrEmail = io.read()

io.write("Is password shared: ")
local isPasswordShared = io.read()

-- define a function to grade the password
local function gradePassword(password)
  local lengthScore = #password * 4 -- score based on length
  local complexityScore = 0
  local uniqueChars = {}
  for i = 1, #password do
    local char = password:sub(i, i)
    if char:match("%d") then -- score for digits
      complexityScore = complexityScore + 4
    elseif char:match("%a") then -- score for lowercase and uppercase letters
      if char:match("%u") then
        complexityScore = complexityScore + 3
      else
        complexityScore = complexityScore + 2
      end
    else -- score for symbols
      complexityScore = complexityScore + 5
    end
    if not uniqueChars[char] then -- score for unique characters
      uniqueChars[char] = true
      complexityScore = complexityScore + 1
    end
  end
  local uniqueScore = #uniqueChars * 5
  local score = lengthScore + complexityScore + uniqueScore
  return score
end

local passwordScore = gradePassword(passwordToGrade)
if isPasswordShared then -- decrease score for shared passwords
  passwordScore = passwordScore * 0.8
end

-- map the score to a letter grade
local letterGrade
if passwordScore >= 90 then
  letterGrade = "A"
elseif passwordScore >= 80 then
  letterGrade = "B"
elseif passwordScore >= 70 then
  letterGrade = "C"
elseif passwordScore >= 60 then
  letterGrade = "D"
else
  letterGrade = "F"
end

print("")
print("")
print("")
local function fetchReportCard()

    print("TRIMESTER 1 REPORT CARD")
    print("Class: Password Security")

    print("Password to grade: " .. passwordToGrade)
    print("")
    print("GRADE:")
    print("")

    io.write("Password score: ", passwordScore, "\n")
    io.write("Password grade: ", letterGrade, "\n")

end
fetchReportCard()
