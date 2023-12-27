if not game:IsLoaded() then 
    repeat 
        task.wait()
    until game:IsLoaded()
end 

local Pilot = loadstring(game:HttpGet("https://raw.githubusercontent.com/0vma/Twilight/main/Pilot.lua", true))()
local Path = "https://raw.githubusercontent.com/0vma/Twilight/main/Scripts/"
local GameID = game.PlaceId

assert(Pilot.ScriptStates.Status[GameID], "ERROR | Invalid Game Place ID")
print("INFO | Script Found")
assert(not Pilot.ScriptStates.Status[GameID][2], string.format("ERROR | Script for this game is down: %s", Pilot.ScriptStates.Status[GameID][3]))
print("INFO | Script State: UP")

getgenv()._G.runnerapproved = true

local Compiled = Path..tostring(GameID)..".lua";
print(Compiled)
local scs, err = pcall(function()
    loadstring(game:HttpGet(Compiled, true))()
end)

if err ~= nil then 
    error("Error Occured: "..err or "Unknown")
end
print("INFO | Script Executed Successfully!")
