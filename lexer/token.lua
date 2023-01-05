
-- Create the token class
local Token = {
    type=nil,
    value=nil
}

-- Token requirements
local c = require('c')

-- New function
function Token.new(type, value)
    --default value
    value = value or nil

    --make self
    local self = setmetatable({}, Token)

    --set variables
    self.type = type
    self.value = value

    --return
    return self
end

-- Indexer function
function Token.__index(t, k)
    return Token[k]
end

-- Represent function
function Token:Repr()
    if self.value then
        return string.format('(%s : %s)', self.type, self.value)
    else
        return string.format('(%s)', self.type)
    end
end

-- Return the module
return Token