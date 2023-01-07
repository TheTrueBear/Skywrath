
-- Table functions
--print a table nicely
function table.print(table)
    print("{")
    for k, v in pairs(table) do
        if type(v) == "table" then
            table.print(v)
        else
            print(string.format("    %s : %s,", k, v))
        end
    end
    print("}")
end

--print a table of metatables nicely
function table.printrepr(table)
    io.write("{\n")
    for k, v in pairs(table) do
        print(string.format("    %s,", v:Repr()))
    end
    print("}")
end

-- String functions
--better string.find
function string.findchar(string, pattern)
    for i=0, string.len(string) do
        if string.sub(i, i) == pattern then
            return true
        end
    end
    return false
end