
-- Requirements
local lexer = require('lexer/lexer').new("")
require('l')

-- Terminal loop
while true do
    -- read the line
    local line = io.read()
    if line == "" then break end

    -- set up the lexer
    lexer:Reset(line)

    -- get the result from the lexer
    local tokens, err = lexer:Tokenize()

    -- if there is an error
    if err ~= nil then
        print("An error has occurred: " .. err:Repr())
    else
        table.printrepr(tokens)
    end
end 