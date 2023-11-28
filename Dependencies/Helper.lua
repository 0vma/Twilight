print("[*] Initializing Twilight Helper...")
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local Localization = game:GetService("LocalizationService")
return {
  Functions = {
    GetMemoryUsage = function()
        return Stats:GetTotalMemoryUsageMb() or 0
    end,
    GetLocalPlayer = function()
        return Players.LocalPlayer
    end,
    GetLocalCharacter = function()
      local Character = Players.LocalPlayer.Character
      return (Character or nil)
    end,
    GetCountryCode = function()
        return Localization:GetCountryRegionForPlayerAsync(Players.LocalPlayer)
    end,
    ChangePosition = function(pos)
        pos = type(pos) == "CFrame" and pos or CFrame.new(pos)
        if pos ~= nil and Players.LocalPlayer.Character then
            pcall(function()
                Players.LocalPlayer.Character.PrimaryPart.CFrame = pos
            end)
        end
    end,
		GetPing = function()
			return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
		end;
  },
}
