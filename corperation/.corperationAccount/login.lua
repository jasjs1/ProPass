local corpFile = io.open("corperationFile.txt", "r")

if corpFile then
    print("")
    print("Corperation already found. Login successful.")
    print("")
else
    print("")
    print("Corperation file not found.")
    print("Please create one.")
    print("")
end
