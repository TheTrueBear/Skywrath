
-- Lexer class
local Lexer = {}

-- Requirements
local IllegalCharError = require('error/IllegalCharError')
local Token            = require('lexer/token')
local c                = require('c')
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
    local numStr = ""
    local dots   = 0

    while self.cc and string.find("1234567890.", self.cc) do
        if self.cc == '.' then
            if dots >= 1 then
                return IllegalCharError.new('Too many periods!')
            end
            dots = dots + 1
        end
        numStr = numStr .. self.cc
        self:Advance()
    end

    return Token.new(c.NUM, tonumber(numStr))
end

-- Lexer tokenize function
function Lexer:Tokenize()
    local tokens = {}

    while self.cc do
        
        -- Empty characters
        if string.find(' \t', self.cc) then
            
        
        -- Digits
        elseif string.find(c.DIGITS, self.cc) then
            local token = self:MakeNumber()
            if getmetatable(token) == IllegalCharError then
                return {}, token
            end
            table.insert(tokens, token)

        -- Plus
        elseif self.cc == '+' then
            table.insert(tokens, Token.new(c.PLUS))
            self:Advance()
        -- Minus
        elseif self.cc == '-' then
            table.insert(tokens, Token.new(c.MINUS))
            self:Advance()
        -- Multiply
        elseif self.cc == '*' then
            table.insert(tokens, Token.new(c.MUL))
            self:Advance()
        -- Divide
        elseif self.cc == "/" then
            table.insert(tokens, Token.new(c.DIV))
            self:Advance()

        -- Handle all characters that don't go through
        else
            return {}, IllegalCharError.new(self.cc)
        end
    end

    return tokens, nil
end

-- Return the module
return Lexer