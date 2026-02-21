-- سكربت بروكهافين RP - المطور فراس (النسخة الكاملة المجمعة)
-- واجهة تحميل متحركة + جميع خصائص السكربت الأصلي + ألوان حمراء

-- ============================================
-- إعدادات الحماية من مشكلة السماعات
-- ============================================
pcall(function()
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    game:GetService("UserInputService").ModalEnabled = false
end)

-- ============================================
-- واجهة التحميل (المطور فراس)
-- ============================================
local player = game:GetService("Players").LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FirasLoader"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- الخلفية الرئيسية
local background = Instance.new("Frame")
background.Name = "Background"
background.Parent = screenGui
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
background.BackgroundTransparency = 0.1

-- تأثير تدرج أحمر
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 0))
})
gradient.Rotation = 45
gradient.Parent = background

-- الإطار الرئيسي (قابل للسحب)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = background
mainFrame.Size = UDim2.new(0, 450, 0, 550)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -275)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BackgroundTransparency = 0.05
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true

-- زوايا دائرية
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 20)
frameCorner.Parent = mainFrame

-- إطار داخلي
local innerGlow = Instance.new("Frame")
innerGlow.Name = "InnerGlow"
innerGlow.Parent = mainFrame
innerGlow.Size = UDim2.new(1, -4, 1, -4)
innerGlow.Position = UDim2.new(0, 2, 0, 2)
innerGlow.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
innerGlow.BackgroundTransparency = 0.8
innerGlow.BorderSizePixel = 0

local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(0, 18)
innerCorner.Parent = innerGlow

-- عنوان السكربت
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, 0, 0, 70)
titleLabel.Position = UDim2.new(0, 0, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 BROOKHAVEN RP 🔥"
titleLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
titleLabel.TextSize = 32
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextStrokeTransparency = 0.5
titleLabel.TextStrokeColor3 = Color3.fromRGB(150, 0, 0)

-- اسم المطور
local devLabel = Instance.new("TextLabel")
devLabel.Name = "Developer"
devLabel.Parent = mainFrame
devLabel.Size = UDim2.new(1, 0, 0, 50)
devLabel.Position = UDim2.new(0, 0, 0, 90)
devLabel.BackgroundTransparency = 1
devLabel.Text = "المطور فراس"
devLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
devLabel.TextSize = 28
devLabel.Font = Enum.Font.Trispace
devLabel.TextStrokeTransparency = 0.3

-- رسالة الشكر
local thanksLabel = Instance.new("TextLabel")
thanksLabel.Name = "Thanks"
thanksLabel.Parent = mainFrame
thanksLabel.Size = UDim2.new(1, 0, 0, 40)
thanksLabel.Position = UDim2.new(0, 0, 0, 140)
thanksLabel.BackgroundTransparency = 1
thanksLabel.Text = "شكراً لاستخدام السكربت ❤️"
thanksLabel.TextColor3 = Color3.fromRGB(255, 200, 200)
thanksLabel.TextSize = 20
thanksLabel.Font = Enum.Font.SourceSans

-- شريط التحميل
local loadingFrame = Instance.new("Frame")
loadingFrame.Name = "LoadingFrame"
loadingFrame.Parent = mainFrame
loadingFrame.Size = UDim2.new(0.8, 0, 0, 30)
loadingFrame.Position = UDim2.new(0.1, 0, 0, 200)
loadingFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
loadingFrame.BorderSizePixel = 0

local loadingCorner = Instance.new("UICorner")
loadingCorner.CornerRadius = UDim.new(1, 0)
loadingCorner.Parent = loadingFrame

-- شريط التقدم
local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Parent = loadingFrame
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
progressBar.BorderSizePixel = 0

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(1, 0)
progressCorner.Parent = progressBar

-- نص نسبة التحميل
local percentLabel = Instance.new("TextLabel")
percentLabel.Name = "Percent"
percentLabel.Parent = loadingFrame
percentLabel.Size = UDim2.new(1, 0, 1, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.TextSize = 16
percentLabel.Font = Enum.Font.SourceSansBold

-- نص "جار التحميل"
local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Parent = mainFrame
loadingText.Size = UDim2.new(1, 0, 0, 30)
loadingText.Position = UDim2.new(0, 0, 0, 240)
loadingText.BackgroundTransparency = 1
loadingText.Text = "جار تحميل سكربت المطور فراس"
loadingText.TextColor3 = Color3.fromRGB(255, 150, 150)
loadingText.TextSize = 18
loadingText.Font = Enum.Font.SourceSans

-- زر الإلعب
local playButton = Instance.new("TextButton")
playButton.Name = "PlayButton"
playButton.Parent = mainFrame
playButton.Size = UDim2.new(0.6, 0, 0, 60)
playButton.Position = UDim2.new(0.2, 0, 0, 300)
playButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
playButton.BorderSizePixel = 0
playButton.Text = "إلعب"
playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playButton.TextSize = 24
playButton.Font = Enum.Font.GothamBold
playButton.Visible = false
playButton.AutoButtonColor = false

local playCorner = Instance.new("UICorner")
playCorner.CornerRadius = UDim.new(0, 30)
playCorner.Parent = playButton

playButton.MouseEnter:Connect(function()
    playButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    playButton.Size = UDim2.new(0.62, 0, 0, 64)
    playButton.Position = UDim2.new(0.19, 0, 0, 298)
end)

playButton.MouseLeave:Connect(function()
    playButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    playButton.Size = UDim2.new(0.6, 0, 0, 60)
    playButton.Position = UDim2.new(0.2, 0, 0, 300)
end)

-- ============================================
-- السكربت الرئيسي الأصلي (بعد التعديل)
-- ============================================
function LoadMainScript()
    -- إخفاء واجهة التحميل
    screenGui.Enabled = false
    
    -- السكربت الأصلي (معدل للألوان الحمراء)
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
    local Window = Library.CreateLib("FirasHack | Brookhaven RP", "RJTheme3")
    
    -- إضافة زر التحكم المتحرك
    CreateControlButton()
    
    -- ============================================
    -- قسم Movement (معدل)
    -- ============================================
    local Tab = Window:NewTab("Movement")
    local Section = Tab:NewSection("Movement")
    
    Section:NewSlider("WalkSpeed", "", 500, 16, function(s)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
        end)
    end)
    
    Section:NewSlider("JumpPower", "", 500, 50, function(s)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
        end)
    end)
    
    Section:NewSlider("SpinBot", "", 50, 0, function(s)
        local speed = s
        local plr = game:GetService("Players").LocalPlayer
        repeat task.wait() until plr.Character
        local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
        plr.Character:WaitForChild("Humanoid").AutoRotate = false
        local velocity = Instance.new("AngularVelocity")
        velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
        velocity.MaxTorque = math.huge
        velocity.AngularVelocity = Vector3.new(0, speed, 0)
        velocity.Parent = humRoot
        velocity.Name = "Spinbot"
    end)
    
    Section:NewButton("Fly", "", function()
        local main = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local up = Instance.new("TextButton")
        local down = Instance.new("TextButton")
        local onof = Instance.new("TextButton")
        local TextLabel = Instance.new("TextLabel")
        local plus = Instance.new("TextButton")
        local speed = Instance.new("TextLabel")
        local mine = Instance.new("TextButton")
        local closebutton = Instance.new("TextButton")
        local mini = Instance.new("TextButton")
        local mini2 = Instance.new("TextButton") 
        
        main.Name = "main"
        main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        main.ResetOnSpawn = false 
        
        Frame.Parent = main
        Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
        Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
        Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
        Frame.Size = UDim2.new(0, 190, 0, 57) 
        
        up.Name = "up"
        up.Parent = Frame
        up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
        up.Size = UDim2.new(0, 44, 0, 28)
        up.Font = Enum.Font.SourceSans
        up.Text = "UP"
        up.TextColor3 = Color3.fromRGB(0, 0, 0)
        up.TextSize = 14.000 
        
        down.Name = "down"
        down.Parent = Frame
        down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
        down.Position = UDim2.new(0, 0, 0.491228074, 0)
        down.Size = UDim2.new(0, 44, 0, 28)
        down.Font = Enum.Font.SourceSans
        down.Text = "DOWN"
        down.TextColor3 = Color3.fromRGB(0, 0, 0)
        down.TextSize = 14.000 
        
        onof.Name = "onof"
        onof.Parent = Frame
        onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
        onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
        onof.Size = UDim2.new(0, 56, 0, 28)
        onof.Font = Enum.Font.SourceSans
        onof.Text = "fly"
        onof.TextColor3 = Color3.fromRGB(0, 0, 0)
        onof.TextSize = 14.000 
        
        TextLabel.Parent = Frame
        TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
        TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 100, 0, 28)
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = "FirasHack"
        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.TextScaled = true
        TextLabel.TextWrapped = true 
        
        plus.Name = "plus"
        plus.Parent = Frame
        plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
        plus.Position = UDim2.new(0.231578946, 0, 0, 0)
        plus.Size = UDim2.new(0, 45, 0, 28)
        plus.Font = Enum.Font.SourceSans
        plus.Text = "+"
        plus.TextColor3 = Color3.fromRGB(0, 0, 0)
        plus.TextScaled = true
        plus.TextSize = 14.000
        plus.TextWrapped = true 
        
        speed.Name = "speed"
        speed.Parent = Frame
        speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
        speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
        speed.Size = UDim2.new(0, 44, 0, 28)
        speed.Font = Enum.Font.SourceSans
        speed.Text = "1"
        speed.TextColor3 = Color3.fromRGB(0, 0, 0)
        speed.TextScaled = true
        speed.TextSize = 14.000
        speed.TextWrapped = true 
        
        mine.Name = "mine"
        mine.Parent = Frame
        mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
        mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
        mine.Size = UDim2.new(0, 45, 0, 29)
        mine.Font = Enum.Font.SourceSans
        mine.Text = "-"
        mine.TextColor3 = Color3.fromRGB(0, 0, 0)
        mine.TextScaled = true
        mine.TextSize = 14.000
        mine.TextWrapped = true 
        
        closebutton.Name = "Close"
        closebutton.Parent = main.Frame
        closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
        closebutton.Font = "SourceSans"
        closebutton.Size = UDim2.new(0, 45, 0, 28)
        closebutton.Text = "X"
        closebutton.TextSize = 30
        closebutton.Position = UDim2.new(0, 0, -1, 27) 
        
        mini.Name = "minimize"
        mini.Parent = main.Frame
        mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
        mini.Font = "SourceSans"
        mini.Size = UDim2.new(0, 45, 0, 28)
        mini.Text = "-"
        mini.TextSize = 40
        mini.Position = UDim2.new(0, 44, -1, 27) 
        
        mini2.Name = "minimize2"
        mini2.Parent = main.Frame
        mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
        mini2.Font = "SourceSans"
        mini2.Size = UDim2.new(0, 45, 0, 28)
        mini2.Text = "+"
        mini2.TextSize = 40
        mini2.Position = UDim2.new(0, 44, -1, 57)
        mini2.Visible = false 
        
        speeds = 1 
        
        local speaker = game:GetService("Players").LocalPlayer 
        
        local chr = game.Players.LocalPlayer.Character
        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid") 
        
        nowe = false 
        
        game:GetService("StarterGui"):SetCore("SendNotification", { 
            Title = "Fly GUI V3";
            Text = "By FirasHack";
            Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
        })
        
        Frame.Active = true
        Frame.Draggable = true 
        
        onof.MouseButton1Down:connect(function() 
            if nowe == true then
                nowe = false 
                
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
                speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
            else 
                nowe = true
                
                for i = 1, speeds do
                    spawn(function() 
                        local hb = game:GetService("RunService").Heartbeat
                        tpwalking = true
                        local chr = game.Players.LocalPlayer.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end 
                    end)
                end
                
                game.Players.LocalPlayer.Character.Animate.Disabled = true
                local Char = game.Players.LocalPlayer.Character
                local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController") 
                
                for i,v in next, Hum:GetPlayingAnimationTracks() do
                    v:AdjustSpeed(0)
                end
                
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
                speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
                speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
            end
            
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
                local plr = game.Players.LocalPlayer
                local torso = plr.Character.Torso
                local flying = true
                local deb = true
                local ctrl = {f = 0, b = 0, l = 0, r = 0}
                local lastctrl = {f = 0, b = 0, l = 0, r = 0}
                local maxspeed = 50
                local speed = 0
                
                local bg = Instance.new("BodyGyro", torso)
                bg.P = 9e4
                bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.cframe = torso.CFrame
                local bv = Instance.new("BodyVelocity", torso)
                bv.velocity = Vector3.new(0,0.1,0)
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
                
                if nowe == true then
                    plr.Character.Humanoid.PlatformStand = true
                end
                
                while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                    game:GetService("RunService").RenderStepped:Wait() 
                    
                    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                        speed = speed+.5+(speed/maxspeed)
                        if speed > maxspeed then
                            speed = maxspeed
                        end
                    elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                        speed = speed-1
                        if speed < 0 then
                            speed = 0
                        end
                    end
                    
                    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                    elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    else
                        bv.velocity = Vector3.new(0,0,0)
                    end
                    
                    bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
                end
                
                ctrl = {f = 0, b = 0, l = 0, r = 0}
                lastctrl = {f = 0, b = 0, l = 0, r = 0}
                speed = 0
                bg:Destroy()
                bv:Destroy()
                plr.Character.Humanoid.PlatformStand = false
                game.Players.LocalPlayer.Character.Animate.Disabled = false
                tpwalking = false
                
            else
                local plr = game.Players.LocalPlayer
                local UpperTorso = plr.Character.UpperTorso
                local flying = true
                local deb = true
                local ctrl = {f = 0, b = 0, l = 0, r = 0}
                local lastctrl = {f = 0, b = 0, l = 0, r = 0}
                local maxspeed = 50
                local speed = 0
                
                local bg = Instance.new("BodyGyro", UpperTorso)
                bg.P = 9e4
                bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                bg.cframe = UpperTorso.CFrame
                local bv = Instance.new("BodyVelocity", UpperTorso)
                bv.velocity = Vector3.new(0,0.1,0)
                bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
                
                if nowe == true then
                    plr.Character.Humanoid.PlatformStand = true
                end
                
                while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
                    wait() 
                    
                    if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                        speed = speed+.5+(speed/maxspeed)
                        if speed > maxspeed then
                            speed = maxspeed
                        end
                    elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                        speed = speed-1
                        if speed < 0 then
                            speed = 0
                        end
                    end
                    
                    if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
                    elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                    else
                        bv.velocity = Vector3.new(0,0,0)
                    end 
                    
                    bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
                end
                
                ctrl = {f = 0, b = 0, l = 0, r = 0}
                lastctrl = {f = 0, b = 0, l = 0, r = 0}
                speed = 0
                bg:Destroy()
                bv:Destroy()
                plr.Character.Humanoid.PlatformStand = false
                game.Players.LocalPlayer.Character.Animate.Disabled = false
                tpwalking = false
            end
        end) 
        
        local tis 
        
        up.MouseButton1Down:connect(function()
            tis = up.MouseEnter:connect(function()
                while tis do
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
                end
            end)
        end) 
        
        up.MouseLeave:connect(function()
            if tis then
                tis:Disconnect()
                tis = nil
            end
        end) 
        
        local dis 
        
        down.MouseButton1Down:connect(function()
            dis = down.MouseEnter:connect(function()
                while dis do
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
                end
            end)
        end) 
        
        down.MouseLeave:connect(function()
            if dis then
                dis:Disconnect()
                dis = nil
            end
        end)
        
        game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
            wait(0.7)
            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
            game.Players.LocalPlayer.Character.Animate.Disabled = false 
        end)
        
        plus.MouseButton1Down:connect(function()
            speeds = speeds + 1
            speed.Text = speeds
            if nowe == true then
                tpwalking = false
                for i = 1, speeds do
                    spawn(function() 
                        local hb = game:GetService("RunService").Heartbeat
                        tpwalking = true
                        local chr = game.Players.LocalPlayer.Character
                        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                        while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                            if hum.MoveDirection.Magnitude > 0 then
                                chr:TranslateBy(hum.MoveDirection)
                            end
                        end 
                    end)
                end
            end
        end)
        
        mine.MouseButton1Down:connect(function()
            if speeds == 1 then
                speed.Text = 'لا يمكن أن يكون أقل من 1'
                wait(1)
                speed.Text = speeds
            else
                speeds = speeds - 1
                speed.Text = speeds
                if nowe == true then
                    tpwalking = false
                    for i = 1, speeds do
                        spawn(function() 
                            local hb = game:GetService("RunService").Heartbeat
                            tpwalking = true
                            local chr = game.Players.LocalPlayer.Character
                            local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                            while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                                if hum.MoveDirection.Magnitude > 0 then
                                    chr:TranslateBy(hum.MoveDirection)
                                end
                            end 
                        end)
                    end
                end
            end
        end) 
        
        closebutton.MouseButton1Click:Connect(function()
            main:Destroy()
        end) 
        
        mini.MouseButton1Click:Connect(function()
            up.Visible = false
            down.Visible = false
            onof.Visible = false
            plus.Visible = false
            speed.Visible = false
            mine.Visible = false
            mini.Visible = false
            mini2.Visible = true
            main.Frame.BackgroundTransparency = 1
            closebutton.Position = UDim2.new(0, 0, -1, 57)
        end) 
        
        mini2.MouseButton1Click:Connect(function()
            up.Visible = true
            down.Visible = true
            onof.Visible = true
            plus.Visible = true
            speed.Visible = true
            mine.Visible = true
            mini.Visible = true
            mini2.Visible = false
            main.Frame.BackgroundTransparency = 0 
            closebutton.Position = UDim2.new(0, 0, -1, 27)
        end)
    end)
    
    Section:NewButton("No Clip", "", function()
        local Noclip = nil
        local Clip = nil
        
        function noclip()
            Clip = false
            local function Nocl()
                if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                            v.CanCollide = false
                        end
                    end
                end
                wait(0.21)
            end
            Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
        end
        
        function clip()
            if Noclip then Noclip:Disconnect() end
            Clip = true
        end
        
        noclip()
    end)
    
    Section:NewButton("InfinityJump", "", function()
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end)
    
    -- ============================================
    -- قسم Teleport
    -- ============================================
    local Tab = Window:NewTab("Teleport")
    local Section = Tab:NewSection("Teleport")
    
    Section:NewButton("Drones", "", function()
        pcall(function()
            if game:GetService("Workspace"):FindFirstChild("Model") and game.Workspace.Model:FindFirstChild("DroneFakeNew") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Model.DroneFakeNew.c.CFrame
            end
        end)
    end)
    
    Section:NewButton("School", "", function()
        pcall(function()
            if game:GetService("Workspace"):FindFirstChild("Model") and game.Workspace.Model:FindFirstChild("Desks") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Model.Desks.Desks.Seat.CFrame
            end
        end)
    end)
    
    Section:NewButton("Aqua Park", "", function()
        pcall(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Model["002_StaysWhiteWinterTime/GreenSummer/NoScriptInvolved"]["WhiteWinterTime/GreenSummer/LightGreenSpring"].CFrame
        end)
    end)
    
    Section:NewButton("Spawn", "", function()
        pcall(function()
            if game:GetService("Workspace"):FindFirstChild("Spawns!SkyDive") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace["Spawns!SkyDive"].Spawn.CFrame
            end
        end)
    end)
    
    -- ============================================
    -- قسم Render
    -- ============================================
    local Tab = Window:NewTab("Render")
    local Section = Tab:NewSection("Render")
    
    Section:NewButton("RTX", "", function()
        local a = game.Lighting
        a.Ambient = Color3.fromRGB(33, 33, 33)
        a.Brightness = 6.67
        a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
        a.EnvironmentDiffuseScale = 0.105
        a.EnvironmentSpecularScale = 0.522
        a.GlobalShadows = true
        a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
        a.ShadowSoftness = 0.04
        a.GeographicLatitude = -15.525
        a.ExposureCompensation = 0.75
        
        local b = Instance.new("BloomEffect", a)
        b.Enabled = true
        b.Intensity = 0.04
        b.Size = 1900
        b.Threshold = 0.915
        
        local c = Instance.new("ColorCorrectionEffect", a)
        c.Brightness = 0.176
        c.Contrast = 0.39
        c.Enabled = true
        c.Saturation = 0.2
        c.TintColor = Color3.fromRGB(217, 145, 57)
        
        local d = Instance.new("DepthOfFieldEffect", a)
        d.Enabled = true
        d.FarIntensity = 0.077
        d.FocusDistance = 21.54
        d.InFocusRadius = 20.77
        d.NearIntensity = 0.277
        
        local e = Instance.new("ColorCorrectionEffect", a)
        e.Brightness = 0
        e.Contrast = -0.07
        e.Saturation = 0
        e.Enabled = true
        e.TintColor = Color3.fromRGB(255, 247, 239)
        
        local e2 = Instance.new("ColorCorrectionEffect", a)
        e2.Brightness = 0.2
        e2.Contrast = 0.45
        e2.Saturation = -0.1
        e2.Enabled = true
        e2.TintColor = Color3.fromRGB(255, 255, 255)
        
        local s = Instance.new("SunRaysEffect", a)
        s.Enabled = true
        s.Intensity = 0.01
        s.Spread = 0.146
    end)
    
    -- إشعار عند التشغيل
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "FirasHack",
        Text = "تم التحميل بنجاح! اضغط على الزر الأحمر للتحكم",
        Duration = 3
    })
end

-- ============================================
-- زر التحكم المتحرك
-- ============================================
function CreateControlButton()
    local controlGui = Instance.new("ScreenGui")
    controlGui.Name = "FirasControl"
    controlGui.Parent = game:GetService("CoreGui")
    controlGui.ResetOnSpawn = false
    
    local controlButton = Instance.new("TextButton")
    controlButton.Name = "ControlButton"
    controlButton.Parent = controlGui
    controlButton.Size = UDim2.new(0, 60, 0, 60)
    controlButton.Position = UDim2.new(0, 30, 0, 100)
    controlButton.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
    controlButton.BackgroundTransparency = 0.1
    controlButton.BorderSizePixel = 0
    controlButton.Draggable = true
    controlButton.Active = true
    controlButton.Text = "▶"
    controlButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    controlButton.TextSize = 30
    controlButton.Font = Enum.Font.SourceSansBold
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(1, 0)
    buttonCorner.Parent = controlButton
    
    local guiVisible = true
    
    controlButton.MouseButton1Click:Connect(function()
        guiVisible = not guiVisible
        for _, v in pairs(game.CoreGui:GetChildren()) do
            if v:IsA("ScreenGui") and v.Name ~= "FirasControl" and v.Name ~= "RobloxGui" and v.Name ~= "FirasLoader" then
                v.Enabled = guiVisible
            end
        end
        controlButton.Text = guiVisible and "▶" or "⏸"
        controlButton.BackgroundColor3 = guiVisible and Color3.fromRGB(220, 0, 0) or Color3.fromRGB(150, 0, 0)
    end)
    
    controlButton.MouseEnter:Connect(function()
        controlButton.Size = UDim2.new(0, 65, 0, 65)
    end)
    
    controlButton.MouseLeave:Connect(function()
        controlButton.Size = UDim2.new(0, 60, 0, 60)
    end)
end

-- ============================================
-- وظيفة محاكاة التحميل
-- ============================================
local function SimulateLoading()
    local steps = 100
    for i = 0, steps do
        local percent = i / steps
        progressBar.Size = UDim2.new(percent, 0, 1, 0)
        percentLabel.Text = math.floor(percent * 100) .. "%"
        
        progressBar.BackgroundColor3 = Color3.fromRGB(
            255,
            math.floor(50 + (percent * 100)),
            math.floor(50 + (percent * 100))
        )
        
        wait(0.05)
    end
    
    playButton.Visible = true
    loadingText.Text = "تم التحميل بنجاح! ✅"
    loadingText.TextColor3 = Color3.fromRGB(100, 255, 100)
    
    playButton.MouseButton1Click:Connect(function()
        LoadMainScript()
    end)
end

-- بدء التحميل
SimulateLoading()

-- إشعار بدء التحميل
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "المطور فراس",
    Text = "جاري تحميل السكربت... ❤️",
    Duration = 3
})
