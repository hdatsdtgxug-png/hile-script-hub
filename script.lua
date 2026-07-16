-- ESO HUB V1000 - Mobile Optimized
local library = {
    color = Color3.fromRGB(0, 255, 0), -- Yeşil Hacker Teması
    version = "V1000"
}

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true

-- Başlık
local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "ESO HUB " .. library.version
Title.TextColor3 = library.color
Title.Size = UDim2.new(1, 0, 0, 30)

-- 3 Adet Giriş Kutucuğu (Hız, Zıplama, Uçuş)
local SpeedBox = Instance.new("TextBox", MainFrame)
SpeedBox.PlaceholderText = "Hız (Örn: 50)"
SpeedBox.Position = UDim2.new(0.1, 0, 0.2, 0)
SpeedBox.Size = UDim2.new(0.8, 0, 0, 30)

local JumpBox = Instance.new("TextBox", MainFrame)
JumpBox.PlaceholderText = "Zıplama (Örn: 100)"
JumpBox.Position = UDim2.new(0.1, 0, 0.4, 0)
JumpBox.Size = UDim2.new(0.8, 0, 0, 30)

local FlyBox = Instance.new("TextBox", MainFrame)
FlyBox.PlaceholderText = "Uçuş Hızı"
FlyBox.Position = UDim2.new(0.1, 0, 0.6, 0)
FlyBox.Size = UDim2.new(0.8, 0, 0, 30)

-- Özellikleri Aktif Etme Butonu
local ExecuteBtn = Instance.new("TextButton", MainFrame)
ExecuteBtn.Text = "AKTİF ET"
ExecuteBtn.Position = UDim2.new(0.1, 0, 0.8, 0)
ExecuteBtn.Size = UDim2.new(0.8, 0, 0, 40)
ExecuteBtn.BackgroundColor3 = library.color

-- Kod Mantığı
ExecuteBtn.MouseButton1Click:Connect(function()
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.WalkSpeed = tonumber(SpeedBox.Text) or 16
    hum.JumpPower = tonumber(JumpBox.Text) or 50
    -- Noclip Mantığı
    game:GetService("RunService").Stepped:Connect(function()
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
end)
