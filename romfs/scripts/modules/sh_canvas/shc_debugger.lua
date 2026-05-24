local SHCDebugger = {}

local InputSystem = require("lpp_input_system")

local currentComponent

local isDebugging = false

function SHCDebugger.startDebug(component)
    currentComponent = component
    isDebugging = true
end

function SHCDebugger.getDebugContent()
    if not isDebugging then return "" end
    local content = "DEBUGGING COMPONENT\nPosition: (" ..
    currentComponent.transform.position.x .. ", " .. currentComponent.transform.position.y .. ", " .. currentComponent.transform.position.z ..")\n"
    .. "Scale: (" .. currentComponent.transform:getScale().x .. ", " .. currentComponent.transform:getScale().y .. ", " .. currentComponent.transform:getScale().z .. ")"
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
    if InputSystem.getKeyDown(KEY_B) then
        currentComponent:setSize(currentComponent:getSize() - 1)
    end
    if InputSystem.getKeyDown(KEY_A) then
        currentComponent:setSize(currentComponent:getSize() + 1)
    end
end

return SHCDebugger