local Debounce = true
local UI = Instance.new("ScreenGui")
local Toggle = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

UI.Name = "UI"
UI.Parent = game.CoreGui

Toggle.Name = "Toggle"
Toggle.Parent = UI
Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0.342619061, 0, 0.548728406, 0)
Toggle.Size = UDim2.new(0.0541125536, 0, 0.0771604925, 0)
Toggle.AutoButtonColor = false
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "UI"
Toggle.TextColor3 = Color3.fromRGB(0, 170, 255)
Toggle.TextScaled = true
Toggle.TextSize = 14.000
Toggle.TextWrapped = true

UICorner.CornerRadius = UDim.new(1, 8)
UICorner.Parent = Toggle

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 85, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 120, 180))}
UIGradient.Parent = Toggle

UIAspectRatioConstraint.Parent = Toggle
UIAspectRatioConstraint.AspectRatio = 1

UITextSizeConstraint.Parent = Toggle
UITextSizeConstraint.MaxTextSize = 50

task.spawn(function()
	local UserInputService = game:GetService("UserInputService")

	local gui = Toggle
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end)

task.spawn(function()
	local Size = {Toggle.Size.X.Scale, Toggle.Size.Y.Scale}
	Toggle.MouseEnter:Connect(function()
		Toggle:TweenSize(UDim2.fromScale(Size[1] / 1.25, Size[2] / 1.25), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.125, true)
	end)

	Toggle.MouseLeave:Connect(function()
		Toggle:TweenSize(UDim2.fromScale(Size[1], Size[2]), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.125, true)
	end)

	Toggle.MouseButton1Down:Connect(function()
		Toggle:TweenSize(UDim2.fromScale(Size[1] / 1.15, Size[2] / 1.15), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.125, true)
	end)

	Toggle.MouseButton1Up:Connect(function()
		Toggle:TweenSize(UDim2.fromScale(Size[1] / 1.25, Size[2] / 1.25), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.125, true)
	end)
end)


return function(UI)
	if UI then 
		Toggle.MouseButton1Click:Connect(function()
			Debounce = not Debounce 
			UI.Enabled = Debounce
		end)
	end
end
