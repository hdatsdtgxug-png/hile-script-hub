-- ESO HUB INFINITY - TÜM ÖZELLİKLERİ İÇERİR
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 350, 0, 200)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)

local MasterBtn = Instance.new("TextButton", MainFrame)
MasterBtn.Size = UDim2.new(0.9, 0, 0, 150)
MasterBtn.Position = UDim2.new(0.05, 0, 0.15, 0)
MasterBtn.Text = "🔥 INFINITY MODU AKTİF ET (FULL ÖZELLİK) 🔥"
MasterBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MasterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MasterBtn.Font = Enum.Font.GothamBold
MasterBtn.Parent = MainFrame
Instance.new("UICorner", MasterBtn)

MasterBtn.MouseButton1Click:Connect(function()
    MasterBtn.Text = "⚡ INFINITY MODU ÇALIŞIYOR ⚡"
    MasterBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    
    RS.RenderStepped:Connect(function()
        -- 1. HIZ & ZIPLAMA 🚀⏫
        humanoid.WalkSpeed = 150
        humanoid.JumpPower = 200
        
        -- 2. UÇUŞ (FLY) ✈️
        if not root:FindFirstChild("FlyBV") then
            local bv = Instance.new("BodyVelocity", root)
            bv.Name = "FlyBV"
            bv.MaxForce = Vector3.new(0, 100000, 0)
            bv.Velocity = Vector3.new(0, 0, 0)
        end
        
        -- 3. NOCLIP (DUVARLARDAN GEÇME) 🧱
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
        
        -- 4. GÖRÜNMEZLİK & ANTI-AIM 👻🛡️
        for _, p in pairs(character:GetDescendants()) do if p:IsA("BasePart") then p.Transparency = 1 end end
        humanoid.AutoRotate = false 
        
        -- 5. ESP 👁️
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and p.Character and not p.Character:FindFirstChild("ESP") then
                local hl = Instance.new("Highlight", p.Character) hl.Name = "ESP"
            end
        end
        
        -- 6. SINIRSIZ MERMİ & GOD MODE ❤️🔫
        for _, t in pairs(player.Backpack:GetChildren()) do if t:FindFirstChild("Ammo") then t.Ammo.Value = 999 end end
        humanoid.Health = humanoid.MaxHealth
        
        -- 7. OTOMATİK TOPLAMA 💰
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("Tool") and obj:FindFirstChild("Handle") then obj.Handle.CFrame = root.CFrame end
        end
        
        -- 8. INF JUMP (HAVADA SINIRSIZ ZIPLAMA) ⏫⏫
        humanoid.Jumping:Connect(function() humanoid.JumpPower = 200 end)
        
        -- 9. AIMBOT (OTOMATİK TAKİP) 🎯
        local closest = nil local dist = math.huge
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
                local d = (root.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if d < dist then closest = p.Character.Head dist = d end
            end
        end
        if closest then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, closest.Position) end
    end)
end)
