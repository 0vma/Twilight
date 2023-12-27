assert(getgenv()._G.runnerapproved, "ERROR | Make sure to not run the script directly, may cause unpredictable issues or even BANS! Make sure load script.lua at the main github page first")

local Success, Helper = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/0vma/Twilight/main/Dependencies/Helper.lua", true))()
end)

assert(Success, "ERROR | Helper has failed to load!")
local Helper = Helper;

local Functions = Helper.Functions
local ShortLoad = Functions.ShortLoad
local GetLocalPlayer = Functions.GetLocalPlayer
local GetLocalCharacter = Functions.GetLocalCharacter 
local GetMemoryUsage = Functions.GetMemoryUsage 

local Fluent = ShortLoad("https://raw.githubusercontent.com/0vma/Twilight/main/Dependencies/UILibrary/Main.lua")
local InterfaceManager = ShortLoad("https://raw.githubusercontent.com/0vma/Twilight/main/Dependencies/UILibrary/InterfaceManager.lua")
local SaveManager = ShortLoad("https://raw.githubusercontent.com/0vma/Twilight/main/Dependencies/UILibrary/SaveManager.lua")

local Window = Fluent:CreateWindow({
    Title = "Pet Simulator 99 | Twilight Softworks",
    SubTitle = "discord.gg/invite/EtWyBV2Wts",
    TabWidth = 160,
    Size = UDim2.fromScale(0.55, 0.75),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Statistics = Window:AddTab({
        Title = "Statistics", 
        Icon = 6022668884 
    }),
    Farming = Window:AddTab({ 
        Title = "Settings", 
        Icon = "settings" 
    })
}


local Options = Fluent.Options
local StartTick = tick()
Fluent:Notify({
    Title = "Twilight Softworks",
    Content = "Loading Script...",
    SubContent = "note: might take a while", 
    Duration = 1 
}) 

local p = Tabs.Statistics:AddParagraph({
    Title = "Paragraph",
    Content = "This is a paragraph.\nSecond line!"
})

do 
    task.wait(10)
    p:SetTitle("haiii")
    p:SetDesc('baiiii')
end 
