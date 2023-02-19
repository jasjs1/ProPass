local keyLength = 16

local key = ""
for i = 1, keyLength do
  local randNum = math.random(0, 255)
  key = key .. string.char(randNum)
end
print(key)
