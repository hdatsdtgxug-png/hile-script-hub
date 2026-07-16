-- ESO HUB OMEGA - GÜÇLENDİRİLMİŞ FULL PAKET
local player = game.Players.LocalPlayer
local RS = game:GetService("RunService")
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "ESO_HUB"
ScreenGui.ResetOnSpawn = false

-- AÇ/KAPA BUTONU (Sabit)
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 100, 0, 40)
ToggleBtn.Position = UDim2.new(0, 10, 0, 10)
ToggleBtn.Text = "MENU ⚡"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", ToggleBtn)

local MainFrame = Instance.new("ScrollingFrame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 500)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame)
Instance.new("UIListLayout", MainFrame).Padding = UDim.new(0, 5)

ToggleBtn.MouseButton1Click:Connect(function() MainFrame.Visible = not MainFrame.Visible end)

-- ÖZELLİK EKLEME FONKSİYONU
local function createBtn(text, callback)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.MouseButton1Click:Connect(callback)
    Instance.new("UICorner", btn)
end

-- TÜM ÖZELLİKLER (Hepsi RenderStepped Döngüsünde)
createBtn("🚀 HIZ (150)", function() RS.RenderStepped:Connect(function() player.Character.Humanoid.WalkSpeed = 150 end) end)
createBtn("⏫ ZIPLAMA (200)", function() RS.RenderStepped:Connect(function() player.Character.Humanoid.JumpPower = 200 end) end)
createBtn("✈️ UÇUŞ (FLY)", function() 
    local bv = Instance.new("BodyVelocity", player.Character.HumanoidRootPart) 
    bv.MaxForce = Vector3.new(0, 100000, 0) 
    RS.RenderStepped:Connect(function() bv.Velocity = Vector3.new(0, 50, 0) end) 
end)
createBtn("🧱 NOCLIP", function() RS.RenderStepped:Connect(function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end) end)
createBtn("👁️ ESP", function() RS.RenderStepped:Connect(function() for _,p in pairs(game.Players:GetPlayers()) do if p ~= player and p.Character and not p.Character:FindFirstChild("ESP") then Instance.new("Highlight", p.Character).Name = "ESP" end end end) end)
createBtn("🎯 AIMBOT", function() RS.RenderStepped:Connect(function() local c = nil local d = math.huge for _,p in pairs(game.Players:GetPlayers()) do if p ~= player and p.Character and p.Character:FindFirstChild("Head") then local dist = (player.Character.HumanoidRootPart.Position - p.Character.Head.Position).Magnitude if dist < d then c = p.Character.Head d = dist end end end if c then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, c.Position) end end) end)
createBtn("❤️ GOD MODE", function() RS.RenderStepped:Connect(function() player.Character.Humanoid.Health = 9999 end) end)
createBtn("🔫 SINIRSIZ MERMİ", function() RS.RenderStepped:Connect(function() for _,t in pairs(player.Backpack:GetChildren()) do if t:FindFirstChild("Ammo") then t.Ammo.Value = 999 end end end) end)
createBtn("👻 GÖRÜNMEZLİK", function() RS.RenderStepped:Connect(function() for _,p in pairs(player.Character:GetDescendants()) do if p:IsA("BasePart") then p.Transparency = 1 end end end) end)
createBtn("💰 AUTO FARM", function() RS.RenderStepped:Connect(function() for _,o in pairs(workspace:GetChildren()) do if o:IsA("Tool") and o:FindFirstChild("Handle") then o.Handle.CFrame = player.Character.HumanoidRootPart.CFrame end end end) end)
