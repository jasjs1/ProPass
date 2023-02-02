local function deletePasswordLogFiles()

    local input = io.read()

    if input == "dap" then
        os.execute("rm -f password_*.txt")
        print("All pasword log file delted!")

    else
        print("Error: deleting password log files")
    end
end
deletePasswordLogFiles()
