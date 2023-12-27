print("[*] Initializing Twilight Helper...")
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local Localization = game:GetService("LocalizationService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
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
		end,
		GetDate = function(t, ctick)
				return t == 'Date' and string.format("%x", ctick) or t == 'Time' and string.format("%X", ctick) or t == 'Day' and string.format("%A", ctick)
		end,
		Tween = function(obj, tweeninfo: tweeninfo, goal, dowait: boolean)
				local nTween = TweenService:Create(obj, tweeninfo, goal)
			  nTween:Play()
			  if dowait then nTween.Completed:Wait() end
		end,
		InitAntiAFK = function()
				game:GetService("Players").LocalPlayer.Idled:connect(function()
					VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
					wait(1)
					VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				end)
		end,
		ShortLoad = function(url)
    			return loadstring(game:HttpGet(url, true))()
		end,
		SecondsToTime(seconds)
		    local hours = math.floor(seconds / 3600)
		    local minutes = math.floor((seconds % 3600) / 60)
		    local remainingSeconds = seconds % 60
		
		    return hours, minutes, remainingSeconds
		end

  },
}
