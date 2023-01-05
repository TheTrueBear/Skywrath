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
function table.printrepr(table)
    io.write("{\n")
    for k, v in pairs(table) do
        print(string.format("    %s,", v:Repr()))
    end
    print("}")
end