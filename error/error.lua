
-- Create the error class
local Error = {}

-- New function
function Error.new(type_, msg)

    local self = setmetatable({}, Error)

    self.type = type_
    self.msg = msg

    return self
end

-- Indexer
function Error.__index(t, k)
    return Error[k]
end

-- Represent
function Error:Repr()
    return string.format("%s: %s", self.type, self.msg)
end

-- Return
return Error