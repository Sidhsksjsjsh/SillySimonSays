local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Silly Simon Says")

local Tab1 = Window_1:NewSection("Main")
--[[
next update:
1. ???
--]]

function tp_client(strip)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(strip.Position)
end

Tab1:CreateButton("farm orb score", function()
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "orb" then
                tp_client(v)
            end
        end
    end
end)

Tab1:CreateButton("Cheat Simon Say", function()
if game.Workspace:FindFirstChild("Outer") then
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "outer" then
                tp_client(v)
            end
        end
    end
   end
if game.Workspace:FindFirstChild("glass") or game.Workspace:FindFirstChild("Glass") then
for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            if v.Name:lower() == "glass" then
                v:Destroy()
            end
        end
    end
end
if game:GetService("Workspace").Arena:FindFirstChild("Head"):FindFirstChild("Head") then
tp_client(game:GetService("Workspace").Arena.Head.Head)
end
if game:GetService("Workspace").MiniGameObjects:FindFirstChild("Head"):FindFirstChild("Head") then
tp_client(game:GetService("Workspace").MiniGameObjects.Head.Head)
end
end)
