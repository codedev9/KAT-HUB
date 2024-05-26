local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua'))()

if game.GameId == 254394801 then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Support",
        Text = "Game Supported",
        Duration = 3
    })
    return
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Support",
        Text = "Game Not Supported",
        Duration = 3
    })
    return
end

local window = lib.createWindow("Game Hub", "MainHub", true) -- Create the main window

-- Player Tab
local playerTab = window.createTab("Player Hacks")

local playerSection = playerTab.createSection("Player", false)

playerSection.createSlider("Walkspeed", {defualt = 16, max = 100, min = 16}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

playerSection.createSlider("Jumppower", {defualt = 50, max = 200, min = 50}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

playerSection.createToggle("Noclip", false, function(state)
    if state then
        Stepped = game:GetService("RunService").Stepped:Connect(function()
                for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
        end)
    elseif not state then
        Stepped:Disconnect()
    end
end)

playerSection.createToggle("InfJump", false, function(state)
    local InfiniteJumpEnabled = true
    if state then
        InfiniteJumpEnabled = true
         game:GetService("UserInputService").JumpRequest:connect(function() if InfiniteJumpEnabled then game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping") end end)
    elseif not state then
        InfiniteJumpEnabled = false
    end
end)

playerSection.createToggle("Xray", false, function(state)
    if state then
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0.5
            end
        end
    elseif not state then
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
                -- spawn locations are invisible for KAT
                if part:IsA("SpawnLocation") then
                    part.Transparency = 1
                end
            end
        end
    end
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
