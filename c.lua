
-- Create the constants table
local c = {}

-- Fill it in
--tokens
--values
c.NUM   = 'number'
c.BOOL  = 'boolean'
c.STR   = 'string'
c.LIST  = 'list'    

--operators
c.PLUS  = 'plus'
c.MINUS = 'minus'
c.MUL   = 'multiply'
c.DIV   = 'divide'
c.EQ    = 'equals'

--more operators
c.LPAREN  = 'left parenthesis'
c.RPAREN  = 'right parenthesis'
c.LSQUARE = 'left bracket'
c.RSQUARE = 'right bracket'
c.LBRACE  = 'left brace'
c.RBRACE  = 'right brace'

--comparisons
c.EE  = 'equal to'
c.NE  = 'not equal to'
c.GT  = 'greater than'
c.LE  = 'less than'
c.GTE = 'greater than equal to'
c.LTE = 'less than equal to'

--others
c.KEY = 'keyqord'
c.ID  = 'identifier'

-- keywords
c.KEYWORDS = {
}

-- digits
c.DIGITS = '1234567890'
c.ALPH   = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRstuvwxyz'
c.IDALPH = c.ALPH .. c.DIGITS .. '_'

-- Return the module
return c