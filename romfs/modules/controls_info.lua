local controlsInfo = {}
controlsInfo.input = {
    circlePad = {
        x = 0,
        y = 0
    }
}

function controlsInfo.readInputs()
    local pad = Controls.read()
    controlsInfo.input.circlePad.x = (select(1, Controls.readCirclePad()))
    controlsInfo.input.circlePad.y = (select(2, Controls.readCirclePad()))
end
return controlsInfo