local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Keji Hub | Key System", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "OrionTest"})

loadstring(game:HttpGet("https://raw.githubusercontent.com/Grayy12/KeySys/main/Protected%20(4).lua",true))()

getgenv().KeyInput = "string"

function Destroy()
    game:GetService("CoreGui").Orion:Destroy()
end

function CheckKey()
    if sf_key == KeyInput then
        Destroy()
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        local Window = OrionLib:MakeWindow({Name = "Keji Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
        
    end
end

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        KeyInput = Value
    end      
})

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
          CheckKey()
      end    
})
