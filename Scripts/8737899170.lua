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
local SecondsToTime = Functions.SecondsToTime
local GetPing = Functions.GetPing

local Fluent = ShortLoad("https://raw.githubusercontent.com/0vma/Twilight/main/Dependencies/UILibrary/Main.lua")
local InterfaceManager = ShortLoad("https://raw.githubusercontent.com/0vma/Twilight/main/Dependencies/UILibrary/InterfaceManager.lua")
local SaveManager = ShortLoad("https://raw.githubusercontent.com/0vma/Twilight/main/Dependencies/UILibrary/SaveManager.lua")

Fluent:ToggleTransparency(false)
local Window = Fluent:CreateWindow({
    Title = "Pet Simulator 99 | Twilight Softworks",
    SubTitle = "Version: 0.0.1",
    TabWidth = 90,
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
        Title = "Farming", 
        Icon = 6023426988
    }),
    Settings = Window:AddTab({
        Title = "Settings",
        Icon = 6031280882
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

local TimeSinceExecution = Tabs.Statistics:AddParagraph({
    Title = "Time since Execution: ",
    Content = "NaN"
})
local MemoryConsumpton = Tabs.Statistics:AddParagraph({
    Title = "Memory Consumption: ",
    Content = "NaN"
})
local Ping = Tabs.Statistics:AddParagraph({
    Title = "Ping: ",
    Content = "NaN"
})

task.spawn(function()
    while true do 
        local Hours, Minutes, Seconds = SecondsToTime(math.round(tick() - StartTick))
        TimeSinceExecution:SetDesc(string.format("%sh %sm %ss", Hours, Minutes, Seconds))

        MemoryConsumpton:SetDesc(string.format("%s MB", math.floor(GetMemoryUsage())))
        Ping:SetDesc(string.format("%s Miliseconds", math.round(GetPing())))
        task.wait(1) 
    end
end)

Window:SelectTab(1)
