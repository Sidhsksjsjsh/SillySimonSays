local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Silly Simon Says")

local Tab1 = Window_1:NewSection("Main | Section 1")
local Tab2 = Window_1:NewSection("Main | Section 2")
local Tab3 = Window_1:NewSection("Egg and Chest")

local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new("Highlight")
highlight.Name = "Highlight"
--local Clones = game:GetService("Workspace").MiniGameObjects[game.Players.LocalPlayer]
--[[
next update:
1. ???
--]]

local round = 0
local pancake = 0

function tp_client(strip)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(strip.Position)
end

function random_tp_client(pvc)
for i = 1, #pvc do
        tp_client(pvc)
   end
end

function random_click(pvc)
  for i = 1, #pvc do
        fireclickdetector(pvc)
    end
end

function random_hit(pvc)
for i = 1, #pvc do
        game:GetService("ReplicatedStorage").Events.NotifyServerScoreInMiniGame:FireServer(game:GetService("Workspace").MiniGameObjects[pvc[math.random(1, #pvc)]])
    end
end

local ScriptAnglesAndCFrame = CFrame.new(14.7538480758667, 12.26094913482666, 0.11403696238994598) * CFrame.Angles(3.141366958618164, 0.4928203821182251, -3.1414761543273926)

function LandingScript(pvc)
for i = 1, #pvc do
       game:GetService("ReplicatedStorage").Events.NotifyServerPlayerLanded:FireServer(pvc)
    end
end

local tiles = {}
local anjingg = {}
function rcreatetable(Table_string,localname)
for _,v in pairs(Table_string:GetChildren()) do
        table.insert(localname,v.Name)
    end
end

Tab1:CreateButton("farm orb score", function()
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "orb" then
                random_tp_client(v)
            end
        end
    end
end)

Tab1:CreateButton("teleport to marbles", function()
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "outer" then
                random_tp_client(v)
            end
        end
    end
end)

Tab1:CreateButton("break glass", function()
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "glass" then
                v:Destroy()
            end
        end
    end
end)
--[[if game:GetService("Workspace").Arena:FindFirstChild("Head"):FindFirstChild("Head") then
tp_client(game:GetService("Workspace").Arena.Head.Head)
end
if game:GetService("Workspace").MiniGameObjects:FindFirstChild("Head"):FindFirstChild("Head") then
tp_client(game:GetService("Workspace").MiniGameObjects.Head.Head)
end--]]
Tab1:CreateButton("Throw and stomp", function()
if game.Workspace.MiniGameObjects.Dummy:FindFirstChild("CollisionBox") then
   game:GetService("ReplicatedStorage").Events.NotifyServerStompedObject:FireServer(game.Workspace.MiniGameObjects.Dummy.CollisionBox)
else
   game:GetService("ReplicatedStorage").Events.NotifyServerStompedObject:FireServer(game.Workspace.MiniGameObjects.Dummy)
end
end)

--Tab1:CreateButton("Make Pancake", function()
--pancake = pancake + 1
--game:GetService("ReplicatedStorage").Events.SubmitToServerMiniGameAnswer:FireServer(pancake)
--end)

Tab1:CreateButton("Click Pimple", function()
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
   if v:IsA("ClickDetector") then
      random_click(v)
    end
  end
end)

Tab1:CreateButton("teleport to head", function()
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "head" then
                random_tp_client(v)
            end
        end
    end
end)

Tab1:CreateButton("X-Ray Clones", function()
local Clones = game:GetService("Workspace").MiniGameObjects:FindFirstChild(game.Players.LocalPlayer)
for i, v in pairs(Clones:GetChildren()) do
    if not v:FindFirstChild("Highlight") then
        local highlightClone = highlight:Clone()
        highlightClone.Adornee = v
        highlightClone.Parent = v
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.Name = "Highlight"
        --highlightClone.ResetOnSpawn = false
    end
end

RunService.Heartbeat:Connect(function()
    for i, v in pairs(Clones:GetChildren()) do
        repeat wait() until v
        if not v:FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v
            highlightClone.Parent = v
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
            --highlightClone.ResetOnSpawn = false
            task.wait()
        end
end
end)
end)

Tab1:CreateButton("High Five", function()
rcreatetable(game:GetService("Workspace").MiniGameObjects,anjingg)
random_hit(anjingg)
end)

Tab1:CreateButton("Hit Toilet Head", function()
game:GetService("ReplicatedStorage").Events.NotifyServerHitObject:FireServer(game:GetService("Workspace").Scene.Toilets.Toilet.Head.Head)
end)

Tab1:CreateToggle("Level Up pet", function(value)
_G.VPet = value
while wait() do
if _G.VPet == false then break end
game:GetService("ReplicatedStorage").Events.AskServerToReinstanceLeveledUpEquippedPet:FireServer()
end
end)

Tab2:CreateButton("Auto step on head", function()
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "head" then
                LandingScript(CFrame.new(v.Position) * CFrame.Angles(3.141366958618164, 0.4928203821182251, -3.1414761543273926))
            end
        end
    end
end)

--[[
if game.Workspace:FindFirstChild("Scene") then
rcreatetable(game.Workspace.Scene,tiles)
game:GetService("ReplicatedStorage").Events.SubmitToServerMiniGameAnswer:FireServer(game.Workspace.Scene[tiles[math.random(1,#tiles),game.Workspace.Scene[tiles[math.random(1,#tiles))
end
end)
--]]

Tab3:CreateToggle("Auto Open Chest", function(value)
_G.OChest = value
while wait() do
if _G.OChest == false then break end
game:GetService("ReplicatedStorage").Functions.PurchaseFromServer:InvokeServer("RegularChest")
end
end)

Tab3:CreateToggle("Auto Open Egg", function(value)
_G.VChest = value
while wait() do
if _G.VChest == false then break end
game:GetService("ReplicatedStorage").Functions.PurchaseFromServer:InvokeServer("RegularEgg")
end
end)
