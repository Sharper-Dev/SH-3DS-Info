local SHCDebugger = {}

local InputSystem = require("lpp_input_system")

local currentComponent

local isDebugging = false

function SHCDebugger.startDebug(component)
    currentComponent = component
    isDebugging = true
end

function SHCDebugger.getDebugContent()
    local content = "Position: (" ..
    currentComponent.transform.position.x .. ", " .. currentComponent.transform.position.y .. ")"
    return content
end

function SHCDebugger.update()
    if not isDebugging then return end
    if InputSystem.getKeyDown(KEY_DUP) then
        currentComponent.transform:setPosition(currentComponent.transform.position.x,
            currentComponent.transform.position.y - 1)
    end
    if InputSystem.getKeyDown(KEY_DDOWN) then
        currentComponent.transform:setPosition(currentComponent.transform.position.x,
            currentComponent.transform.position.y + 1)
    end
    if InputSystem.getKeyDown(KEY_DLEFT) then
        currentComponent.transform:setPosition(currentComponent.transform.position.x - 1,
            currentComponent.transform.position.y)
    end
    if InputSystem.getKeyDown(KEY_DRIGHT) then
        currentComponent.transform:setPosition(currentComponent.transform.position.x + 1,
            currentComponent.transform.position.y)
    end
end

return SHCDebugger