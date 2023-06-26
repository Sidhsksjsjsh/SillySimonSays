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
local tiles = {}
function rcreatetable(Table_string,localname)
for _,v in pairs(Table_string:GetChildren()) do
        table.insert(localname,v.Name)
    end
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
--[[if game:GetService("Workspace").Arena:FindFirstChild("Head"):FindFirstChild("Head") then
tp_client(game:GetService("Workspace").Arena.Head.Head)
end
if game:GetService("Workspace").MiniGameObjects:FindFirstChild("Head"):FindFirstChild("Head") then
tp_client(game:GetService("Workspace").MiniGameObjects.Head.Head)
end--]]
if game.Workspace.MiniGameObjects:FindFirstChild("Dummy").CollisionBox or game.Workspace.MiniGameObjects.Dummy:FindFirstChild("CollisionBox") then
game:GetService("ReplicatedStorage").Events.NotifyServerStompedObject:FireServer(game.Workspace.MiniGameObjects.Dummy.CollisionBox)
end
if game.Workspace:FindFirstChild("Scene") then
rcreatetable(game.Workspace.Scene,tiles)
game:GetService("ReplicatedStorage").Events.SubmitToServerMiniGameAnswer:FireServer(game.Workspace.Scene[tiles[math.random(1,#tiles)]],game.Workspace.Scene[tiles[math.random(1,#tiles)]])
end
end)

Tab1:CreateToggle("Auto Open Chest", function(value)
_G.OChest = value
while wait() do
if _G.OChest == false then break end
game:GetService("ReplicatedStorage").Functions.PurchaseFromServer:InvokeServer("RegularChest")
end
end)
