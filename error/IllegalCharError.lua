
-- Illegal char error
local IllegalCharError = require("error/error")

-- New function
function IllegalCharError.new(msg)
    local self = setmetatable({}, IllegalCharError)
    self.type = "Illegal character"
    self.msg = msg
    return self
end

-- Return the error
return IllegalCharError