-- ESO HUB OMEGA - TAM KONTROL (HEPSİ ÇALIŞIR)
local player = game.Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("ScrollingFrame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 600)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -300)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)
Instance.new("UIListLayout", MainFrame).Padding = UDim.new(0, 5)

-- AÇ/KAPA (H)
UIS.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.H then MainFrame.Visible = not MainFrame.Visible end
end)

local function addBtn(text, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.MouseButton1Click:Connect(callback)
    Instance.new("UICorner", btn)
end

-- ÖZELLİKLERİ EKLE
addBtn("🚀 HIZI 150 YAP", function() RS.RenderStepped:Connect(function() player.Character.Humanoid.WalkSpeed = 150 end) end)
addBtn("⏫ ZIPLAMAYI 200 YAP", function() RS.RenderStepped:Connect(function() player.Character.Humanoid.JumpPower = 200 end) end)
addBtn("✈️ UÇUŞU BAŞLAT", function() 
    local bv = Instance.new("BodyVelocity", player.Character.HumanoidRootPart) 
    bv.Name = "FlyBV" bv.MaxForce = Vector3.new(0, 100000, 0) bv.Velocity = Vector3.new(0, 50, 0) 
end)
addBtn("🧱 NOCLIP AÇ", function() RS.RenderStepped:Connect(function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end) end)
addBtn("👁️ ESP AÇ", function() RS.RenderStepped:Connect(function() for _,p in pairs(game.Players:GetPlayers()) do if p ~= player and p.Character and not p.Character:FindFirstChild("ESP") then Instance.new("Highlight", p.Character).Name = "ESP" end end end) end)
addBtn("🎯 AIMBOT AÇ", function() RS.RenderStepped:Connect(function() local c = nil local d = math.huge for _,p in pairs(game.Players:GetPlayers()) do if p ~= player and p.Character and p.Character:FindFirstChild("Head") then local dist = (player.Character.HumanoidRootPart.Position - p.Character.Head.Position).Magnitude if dist < d then c = p.Character.Head d = dist end end end if c then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, c.Position) end end) end)
addBtn("❤️ GOD MODE AÇ", function() RS.RenderStepped:Connect(function() player.Character.Humanoid.Health = 9999 end) end)
addBtn("🔫 SINIRSIZ MERMİ", function() RS.RenderStepped:Connect(function() for _,t in pairs(player.Backpack:GetChildren()) do if t:FindFirstChild("Ammo") then t.Ammo.Value = 999 end end end) end)
addBtn("👻 GÖRÜNMEZLİK", function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.Transparency = 1 end end end)
addBtn("💰 AUTO FARM", function() RS.RenderStepped:Connect(function() for _,o in pairs(workspace:GetChildren()) do if o:IsA("Tool") and o:FindFirstChild("Handle") then o.Handle.CFrame = player.Character.HumanoidRootPart.CFrame end end end) end)
