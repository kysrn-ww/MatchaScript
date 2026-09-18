-- ===================================================
-- MATCHA AUTO-PRAY SCRIPT (KEY B)
-- Docs: https://huoadf.github.io/matcha-docs/
-- ===================================================

-- 1. Enable Matcha injected input to the game
setrobloxinput(true)

-- 2. Native on-screen visual confirmation
notify("Auto-Pray Started", "Press T to pause/activate", 4)
print("[Matcha Auto-Pray] -> Script loaded successfully.")

local VK_B = 0x42  -- Windows Virtual-Key code for 'B' key
local VK_T = 0x54  -- Windows Virtual-Key code for 'T' key (Toggle)

local enabled = true
local lastTState = false

-- 3. Main loop simulating continuous pressing of B key
task.spawn(function()
    while true do
        task.wait(0.5) -- Pray interval in seconds (you can change 0.5 to whatever you want)
        if enabled then
            keypress(VK_B)
            task.wait(0.1)
            keyrelease(VK_B)
        end
    end
end)

-- 4. Loop to detect pressing the T key (Activate / Pause)
task.spawn(function()
    while true do
        task.wait(0.05)
        local isPressed = iskeypressed(VK_T)
        if isPressed and not lastTState then
            enabled = not enabled
            if enabled then
                print("[Matcha Auto-Pray] -> STATE: ENABLED [ON]")
                notify("Auto-Pray", "ENABLED [ON]", 2)
            else
                print("[Matcha Auto-Pray] -> STATE: PAUSED [OFF]")
                notify("Auto-Pray", "PAUSED [OFF]", 2)
            end
        end
        lastTState = isPressed
    end
end)
