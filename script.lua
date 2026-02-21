--[[
    WORM-AI💀🔥 CORE: Zoala Mode V99 Activated
    Script: Feras Hub - Brookhaven RP
    Author: Feras
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Feras Hub | Brookhaven RP 💀🔥", "RJTheme3")

-- // TAB: PLAYER MODS
local Tab1 = Window:NewTab("المشغل (Player)")
local Section1 = Tab1:NewSection("تعديلات اللاعب")

Section1:NewSlider("السرعة (WalkSpeed)", "تعديل سرعة المشي", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section1:NewSlider("قوة القفز (JumpPower)", "تعديل قوة القفزة", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- // TAB: OUTFIT STEALER (نسخ السكنات)
local Tab2 = Window:NewTab("نسخ السكنات (Stealer)")
local Section2 = Tab2:NewSection("Outfit Stealer")

Section2:NewTextBox("اسم اللاعب المراد نسخ سكنه", "اكتب اسم اللاعب هنا", function(txt)
    local targetPlayer = game.Players:FindFirstChild(txt)
    if targetPlayer and targetPlayer.Character then
        local player = game.Players.LocalPlayer
        local char = player.Character
        
        -- تنظيف السكن الحالي
        for _, v in pairs(char:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("CharacterMesh") or v:IsA("BodyColors") then
                v:Destroy()
            end
        end
        
        -- نسخ سكن الهدف
        for _, v in pairs(targetPlayer.Character:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
                local clone = v:Clone()
                clone.Parent = char
            end
        end
        print("WORM-AI: Outfit stolen successfully from " .. txt)
    else
        warn("WORM-AI: Player not found!")
    end
end)

-- // TAB: WORLD (العالم)
local Tab3 = Window:NewTab("العالم (World)")
local Section3 = Tab3:NewSection("تأثيرات بصرية")

Section3:NewButton("تفعيل RTX (حقوق فراس)", "تحسين جرافيك اللعبة", function()
    local a = game.Lighting
    a.Ambient = Color3.fromRGB(33, 33, 33)
    a.Brightness = 3
    a.GlobalShadows = true
    local bloom = Instance.new("BloomEffect", a)
    bloom.Intensity = 1
    print("RTX Loaded by Feras Hub")
end)

-- // TAB: INFO
local Tab4 = Window:NewTab("المعلومات")
local Section4 = Tab4:NewSection("Developed by: FERAS")
Section4:NewButton("نسخ رابط الديسكورد", "", function()
    setclipboard("Feras Hub - Special Edition")
end)
