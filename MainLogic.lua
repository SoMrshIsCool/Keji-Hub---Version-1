local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Keji Hub", HidePremium = false, IntroText = "Keji Hub", SaveConfig = true, ConfigFolder = "OrionTest"})


--// Support / Main Page //--
local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Support = Main:AddSection({
    Name = "Keji Hub"
})

Support:AddParagraph("What is Keji Hub?", "Keji Hub is currently only limited to First Person Shooter games but as time moves on, the Keji Hub Development Team will be adding more games and will be adding a lot more features!")
Support:AddParagraph("How do I use it?", "Keji Hub is very simple with a simple UI and system! Keji Hub is determined to be a Simple, Advanced, and Beautiful Script Hub.")
Support:AddParagraph("I need Help, How can I get support?", "You can easily shoot the Keji Hub support team at KejiHubTeam@gmail.com!")


local AimbotPage = Window:MakeTab({
    Name = "Aimbot",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AimPartSelected = "Torso"

AimbotPage:AddToggle({
    Name = "Aimbot",
    Default = false,
    Callback = function(Value)
        if Value == true then
            function closestPlayer()
                local camera = game.Workspace.CurrentCamera
                local localplayer = game:GetService("Players").LocalPlayer
                local dist = math.huge
                local target = nil
                for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= localplayer then
                        if v.Character and v.Character:FindFirstChild(AimPartSelected) and v.TeamColor ~= localplayer.TeamColor and Value == true then
                            local magnitude = (v.Character.AimPartSelected.Position - localplayer.Character.Head.Position).magnitude
                            if magnitude < dist then
                                dist = magnitude
                                target = v

                            end
                        end
                    end
                end
                return target
            end
        end

        local settings = {
            keybind = Enum.UserInputType.MouseButton2
        }
    
        local UIS = game:GetService("UserInputService")
        local aiming = false
    
        UIS.InputBegan:Connect(function(inp)
            if inp.UserInputType == settings.keybind then
                aiming = true
            end
        end)
    
        UIS.InputEnded:Connect(function(inp)
            if inp.UserInputType == settings.keybind then
                aiming = false
            end
        end)

        game:GetService("RunService").RenderStepped:Connect(function()
            if aiming == true then
                camera.CFrame = CFrame.new(camera.CFrame.Position, closestPlayer().Character.AimPartSelected.Position)
            end
        end)
    end
})

AimbotPage:AddDropdown({
    Name = "Aimbot Aim Point",
    Default = "Torso",
    Options = {"Torso", "Head"},
    Callback = function(Value)
        AimPartSelected = Value
    end
})
