-- ESO HUB OMEGA - TAM KADRO FINAL BYPASS (GÜNCEL)
local player = game.Players.LocalPlayer
local RS = game:GetService("RunService")
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false

local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 120, 0, 50)
ToggleBtn.Position = UDim2.new(0, 10, 0, 50)
ToggleBtn.Text = "MENU ⚡"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", ToggleBtn)

local MainFrame = Instance.new("ScrollingFrame", ScreenGui)
MainFrame.Size = UDim2.new(0.8, 0, 0.7, 0)
MainFrame.Position = UDim2.new(0.1, 0, 0.15, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)
Instance.new("UIListLayout", MainFrame).Padding = UDim.new(0, 5)

ToggleBtn.Activated:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

local connections = {}

local function createToggle(text, enableFunc, disableFunc)
    local active = false
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.95, 0, 0, 50)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = text .. " (KAPALI)"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Activated:Connect(function()
        active = not active
        if active then
            btn.Text = text .. " (AÇIK)"
            btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            connections[text] = enableFunc()
        else
            btn.Text = text .. " (KAPALI)"
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            if connections[text] then connections[text]:Disconnect() connections[text] = nil end
            disableFunc()
        end
    end)
    Instance.new("UICorner", btn)
end

-- ÖZELLİKLER
createToggle("🚀 HIZ (FORCE)", function() return RS.Heartbeat:Connect(function() if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = 150 end end) end, function() player.Character.Humanoid.WalkSpeed = 16 end)

-- GÜÇLENDİRİLMİŞ ZIPLAMA
createToggle("⏫ ZIPLAMA (FORCE)", function() 
    return RS.Heartbeat:Connect(function() 
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            player.Character.Humanoid.UseJumpPower = true 
            player.Character.Humanoid.JumpPower = 200 
        end 
    end) 
end, function() 
    if player.Character and player.Character:FindFirstChild("Humanoid") then 
        player.Character.Humanoid.JumpPower = 50 
    end 
end)

-- GÜNCEL GOD MODE
createToggle("❤️ GOD MODE (REGEN)", function() 
    return RS.Heartbeat:Connect(function() 
        if player.Character and player.Character:FindFirstChild("Humanoid") then 
            player.Character.Humanoid.Health = 100 
        end 
    end) 
end, function() end)

createToggle("🔫 SINIRSIZ MERMİ", function() return RS.Heartbeat:Connect(function() for _,t in pairs(player.Backpack:GetChildren()) do if t:FindFirstChild("Ammo") then t.Ammo.Value = 999 end end end) end, function() end)
createToggle("🧱 NOCLIP", function() return RS.Heartbeat:Connect(function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end) end, function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = true end end end)
createToggle("🎯 AIMBOT", function() return RS.Heartbeat:Connect(function() local c = nil local d = math.huge for _,p in pairs(game.Players:GetPlayers()) do if p ~= player and p.Character and p.Character:FindFirstChild("Head") then local dist = (player.Character.HumanoidRootPart.Position - p.Character.Head.Position).Magnitude if dist < d then c = p.Character.Head d = dist end end end if c then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, c.Position) end end) end, function() end)
createToggle("👁️ ESP", function() return RS.Heartbeat:Connect(function() for _,p in pairs(game.Players:GetPlayers()) do if p ~= player and p.Character and not p.Character:FindFirstChild("ESP") then Instance.new("Highlight", p.Character).Name = "ESP" end end end) end, function() for _,p in pairs(game.Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("ESP") then p.Character.ESP:Destroy() end end end)
createToggle("💰 AUTO FARM", function() return RS.Heartbeat:Connect(function() for _,o in pairs(workspace:GetChildren()) do if o:IsA("Tool") and o:FindFirstChild("Handle") then o.Handle.CFrame = player.Character.HumanoidRootPart.CFrame end end end) end, function() end)
createToggle("👻 GÖRÜNMEZLİK", function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.Transparency = 1 end end end, function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.Transparency = 0 end end end)
