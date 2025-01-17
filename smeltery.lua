local monitor = peripheral.find("monitor") --- @type ccTweaked.peripherals.Monitor
local controller = peripheral.find("minecraft:tconstruct_smeltery_controller")
local integrator = peripheral.find("redstone_integrator")
local casters = { peripheral.find("minecraft:tconstruct_casting_table") }

function draw()
    monitor.clear()
    monitor.setCursorPos(1, 1)

    local fuels = controller.getFuels()

    monitor.write(("Fuel: %d/%dmb of %s"):format(
        fuels[1].amount,
        fuels[1].capacity,
        fuels[1].displayName
    ))
end

local timer
function loop()
    local data = { os.pullEvent() }
    local event = data[1]

    if event == "timer" and data[2] == timer then
        draw()
    end

    timer = os.startTimer(1)
end

timer = os.startTimer(1)

while true do loop() end