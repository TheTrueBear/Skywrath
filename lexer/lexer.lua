
-- Lexer class
local Lexer = {}

-- Requirements
local Token = require('lexer/token')
local c     = require('c')
require('l')

-- Initializer
function Lexer.new(text)

    --set self
    local self = setmetatable({}, Lexer)

    --set properties
    self.text = text
    self.cc   = nil
    self.pos  = 0

    --advance
    self:Advance()

    --return
    return self
end

-- Lexer indexer
function Lexer.__index(t, k)
    return Lexer[k]
end

-- Lexer advance function
function Lexer:Advance()
    if self.pos >= string.len(self.text) then
        self.cc = nil
        return
    end
    self.pos = self.pos + 1
    self.cc = string.sub(self.text, self.pos, self.pos)
end

-- Lexer set function
function Lexer:Reset(text)
    self.text = text
    self.pos = 0
    self.cc = ''
    self:Advance()
end

-- Lexer make number function
function Lexer:MakeNumber()
    local numStr = self.cc
    local dots   = 0

    while string.find(c.DIGITS .. '.', self.cc) do
        if self.cc == '.' then
            dots = dots + 1
        end
        numStr = numStr .. self.cc
    end

    return Token.new(c.NUM, number(numStr))
end

-- Lexer tokenize function
function Lexer:Tokenize()
    local tokens = {}

    while self.cc do
        
        if string.find(' \t', self.cc) then
            self:Advance()
        
        elseif string.find(c.DIGITS, self.cc) then
            table.insert(tokens, self:MakeNumber())
            self:Advance()

        else
            return {}, "Invalid character."
        end
    end

    return tokens, nil
end

-- Return the module
return Lexer