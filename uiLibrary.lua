local Library = {}

local main = Instance.new("ScreenGui")
main.Name = "Main"
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Library.MainScreenGUI = main

local main_2 = Instance.new("CanvasGroup")
main_2.Name = "Main"
main_2.BackgroundColor3 = Color3.new()
main_2.BackgroundTransparency = 0.6
main_2.Position = UDim2.new(0.386, 0, 0.236, 0)
main_2.BorderColor3 = Color3.new()
main_2.BorderSizePixel = 0
main_2.Size = UDim2.new(0.228, 0, 0.528, 0)
main_2.Parent = main

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.BackgroundTransparency = 0.7
topBar.BackgroundColor3 = Color3.new()
topBar.BorderColor3 = Color3.new()
topBar.BorderSizePixel = 0
topBar.Size = UDim2.new(1, 0, 0.1, 0)
topBar.Parent = main_2

local uIListLayout = Instance.new("UIListLayout")
uIListLayout.Name = "UIListLayout"
uIListLayout.FillDirection = Enum.FillDirection.Horizontal
uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout.Padding = UDim.new(0.01, 0)
uIListLayout.Parent = topBar

local bottomBar = Instance.new("Frame")
bottomBar.Name = "BottomBar"
bottomBar.BackgroundColor3 = Color3.new()
bottomBar.BackgroundTransparency = 0.7
bottomBar.Position = UDim2.new(0, 0, 0.955, 0)
bottomBar.BorderColor3 = Color3.new()
bottomBar.ZIndex = 2
bottomBar.BorderSizePixel = 0
bottomBar.Size = UDim2.new(1, 0, 0.0452, 0)
bottomBar.Parent = main_2

local uIListLayout_2 = Instance.new("UIListLayout")
uIListLayout_2.Name = "UIListLayout"
uIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
uIListLayout_2.Padding = UDim.new(0.005, 0)
uIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
uIListLayout_2.Parent = bottomBar

local frames = Instance.new("Frame")
frames.Name = "Frames"
frames.BackgroundColor3 = Color3.new(1, 1, 1)
frames.BackgroundTransparency = 1
frames.Position = UDim2.new(0, 0, 3.63e-08, 0)
frames.BorderColor3 = Color3.new()
frames.BorderSizePixel = 0
frames.Size = UDim2.new(1, 0, 1, 0)
frames.Parent = main_2

local uICorner_6 = Instance.new("UICorner")
uICorner_6.Name = "UICorner"
uICorner_6.Parent = main_2

function Library.ShowFrame(FrameName)
	for i,guiObject in pairs(frames:GetChildren()) do
		if guiObject:IsA("ScrollingFrame") and guiObject.Name ~= FrameName then
			guiObject.Visible = false
		elseif guiObject:IsA("ScrollingFrame") and frames:FindFirstChild(FrameName) then
			frames[FrameName].Visible = true
		end
	end
end

function Library:CreateTab(Name, LayoutOrder)
	local Tab = {}
	
	local tabExample = Instance.new("TextButton")
	tabExample.Name = Name
	tabExample.FontFace = Font.new("rbxasset://fonts/families/LegacyArial.json",Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	tabExample.Active = false
	tabExample.Text = Name
	tabExample.BackgroundColor3 = Color3.new(1, 1, 1)
	tabExample.TextColor3 = Color3.new(1, 1, 1)
	tabExample.Selectable = false
	tabExample.LayoutOrder = LayoutOrder
	tabExample.BackgroundTransparency = 0.95
	tabExample.TextTransparency = 0.2
	tabExample.TextStrokeColor3 = Color3.new(1, 1, 1)
	tabExample.BorderColor3 = Color3.new()
	tabExample.BorderSizePixel = 0
	tabExample.Size = UDim2.new(0.325, 0, 0.96, 0)
	tabExample.Parent = topBar
	
	local Frame = Instance.new("ScrollingFrame")
	Frame.Name = Name
	Frame.ScrollBarImageColor3 = Color3.new(0.153, 0.153, 0.153)
	Frame.BorderColor3 = Color3.new()
	Frame.ScrollBarThickness = 4
	Frame.BackgroundColor3 = Color3.new(1, 1, 1)
	Frame.AutomaticCanvasSize = Enum.AutomaticSize.XY
	Frame.BackgroundTransparency = 1
	Frame.Position = UDim2.new(0.00333, 0, 0.1, 0)
	Frame.Selectable = false
	Frame.ScrollBarImageTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0.997, 0, 0.855, 0)
	Frame.Visible = false
	Frame.Parent = frames
	
	local uIListLayout_3 = Instance.new("UIListLayout")
	uIListLayout_3.Name = "UIListLayout"
	uIListLayout_3.Padding = UDim.new(0.02, 0)
	uIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
	uIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
	uIListLayout_3.Parent = Frame

	local uIPadding = Instance.new("UIPadding")
	uIPadding.Name = "UIPadding"
	uIPadding.PaddingTop = UDim.new(0.01, 0)
	uIPadding.Parent = Frame
	
	tabExample.MouseButton1Down:Connect(function()
		Library.ShowFrame(Name)
	end)
	
	function Tab:CreateToggle(Name, DefaultValue, Callback)
		local toggleExample = Instance.new("TextButton")
		toggleExample.Name = Name
		toggleExample.Active = false
		toggleExample.TextTransparency = 1
		toggleExample.BackgroundColor3 = Color3.new()
		toggleExample.BorderColor3 = Color3.new()
		toggleExample.BackgroundTransparency = 0.8
		toggleExample.Position = UDim2.new(0.0301, 0, 0.00673, 0)
		toggleExample.Selectable = false
		toggleExample.BorderSizePixel = 0
		toggleExample.Size = UDim2.new(0.94, 0, 0.0991, 0)
		toggleExample.Parent = Frame
		
		local textLabel_2 = Instance.new("TextLabel")
		textLabel_2.Name = "TextLabel"
		textLabel_2.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
		textLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
		textLabel_2.TextColor3 = Color3.new(1, 1, 1)
		textLabel_2.Text = Name
		textLabel_2.BorderSizePixel = 0
		textLabel_2.TextScaled = true
		textLabel_2.TextWrapped = true
		textLabel_2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel_2.BackgroundTransparency = 1
		textLabel_2.Position = UDim2.new(0.0463, 0, 0.155, 0)
		textLabel_2.TextTransparency = 0.2
		textLabel_2.BorderColor3 = Color3.new()
		textLabel_2.TextSize = 14
		textLabel_2.Size = UDim2.new(0.635, 0, 0.688, 0)
		textLabel_2.Parent = toggleExample

		local uICorner_3 = Instance.new("UICorner")
		uICorner_3.Name = "UICorner"
		uICorner_3.Parent = toggleExample

		local uIStroke_3 = Instance.new("UIStroke")
		uIStroke_3.Name = "UIStroke"
		uIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uIStroke_3.Transparency = 0.8
		uIStroke_3.Color = Color3.new(0.278, 0.278, 0.278)
		uIStroke_3.Thickness = 2.3
		uIStroke_3.Parent = toggleExample

		local switch = Instance.new("Frame")
		switch.Name = "Switch"
		switch.BackgroundColor3 = Color3.new()
		switch.BackgroundTransparency = 0.55
		switch.Position = UDim2.new(0.681, 0, 0.197, 0)
		switch.BorderColor3 = Color3.new()
		switch.BorderSizePixel = 0
		switch.Size = UDim2.new(0.277, 0, 0.619, 0)
		switch.Parent = toggleExample
		
		local uICorner_4 = Instance.new("UICorner")
		uICorner_4.Name = "UICorner"
		uICorner_4.CornerRadius = UDim.new(1, 0)
		uICorner_4.Parent = switch

		local uIStroke_4 = Instance.new("UIStroke")
		uIStroke_4.Name = "UIStroke"
		uIStroke_4.Thickness = 1.7
		uIStroke_4.Transparency = 0.95
		uIStroke_4.Color = Color3.new(1, 1, 1)
		uIStroke_4.Parent = switch

		local circle = Instance.new("Frame")
		circle.Name = "Circle"
		circle.AnchorPoint = Vector2.new(1, 1)
		circle.BackgroundColor3 = Color3.new(0.51, 1, 0.298)
		circle.Position = UDim2.new(1, 0, 1.02, 0)
		circle.BorderColor3 = Color3.new()
		circle.BorderSizePixel = 0
		circle.Size = UDim2.new(0.32, 0, 1.13, 0)
		circle.Parent = switch
		
		local uIGradient = Instance.new("UIGradient")
		uIGradient.Name = "UIGradient"
		uIGradient.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
			ColorSequenceKeypoint.new(1, Color3.new(0.525, 0.525, 0.525))
		})
		uIGradient.Rotation = 90
		uIGradient.Parent = circle

		local uICorner_5 = Instance.new("UICorner")
		uICorner_5.Name = "UICorner"
		uICorner_5.CornerRadius = UDim.new(1, 0)
		uICorner_5.Parent = circle
		
		local toggleValue = DefaultValue
		
		if DefaultValue then
			circle.BackgroundColor3 = Color3.new(0.51, 1, 0.298)
			circle:TweenPosition(UDim2.new(1.05, 0, 1.02, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.3, true)
		else
			circle.BackgroundColor3 = Color3.new(1, 0.290196, 0.290196)
			circle:TweenPosition(UDim2.new(0.285, 0, 1.02, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, true)
		end
		
		Callback(toggleValue)
		
		toggleExample.MouseButton1Down:Connect(function()
			toggleValue = not toggleValue
			
			if toggleValue then
				circle.BackgroundColor3 = Color3.new(0.51, 1, 0.298)
				circle:TweenPosition(UDim2.new(1.05, 0, 1.02, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.3, true)
			else
				circle.BackgroundColor3 = Color3.new(1, 0.290196, 0.290196)
				circle:TweenPosition(UDim2.new(0.285, 0, 1.02, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, true)
			end
			
			Callback(toggleValue)
		end)
	end
	
	function Tab:CreateTextBox(Name, DefaultValue, Callback)
		local textBoxButtonExample = Instance.new("Frame")
		textBoxButtonExample.Name = Name
		textBoxButtonExample.BackgroundColor3 = Color3.new()
		textBoxButtonExample.BackgroundTransparency = 0.8
		textBoxButtonExample.Position = UDim2.new(0.0301, 0, 0.00673, 0)
		textBoxButtonExample.BorderColor3 = Color3.new()
		textBoxButtonExample.BorderSizePixel = 0
		textBoxButtonExample.Size = UDim2.new(0.94, 0, 0.0991, 0)
		textBoxButtonExample.Parent = Frame

		local uICorner = Instance.new("UICorner")
		uICorner.Name = "UICorner"
		uICorner.Parent = textBoxButtonExample

		local textBox = Instance.new("TextBox")
		textBox.Name = Name
		textBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
		textBox.TextColor3 = Color3.new(1, 1, 1)
		textBox.BorderColor3 = Color3.new()
		textBox.Text = DefaultValue
		textBox.BackgroundColor3 = Color3.new()
		textBox.TextSize = 14
		textBox.TextScaled = true
		textBox.BackgroundTransparency = 0.55
		textBox.Position = UDim2.new(0.669, 0, 0.155, 0)
		textBox.TextTransparency = 0.38
		textBox.TextWrapped = true
		textBox.BorderSizePixel = 0
		textBox.Size = UDim2.new(0.288, 0, 0.688, 0)
		textBox.Parent = textBoxButtonExample

		local uIStroke = Instance.new("UIStroke")
		uIStroke.Name = "UIStroke"
		uIStroke.Thickness = 1.7
		uIStroke.Transparency = 0.95
		uIStroke.Color = Color3.new(1, 1, 1)
		uIStroke.Parent = textBox

		local uICorner_2 = Instance.new("UICorner")
		uICorner_2.Name = "UICorner"
		uICorner_2.CornerRadius = UDim.new(1, 0)
		uICorner_2.Parent = textBox

		local uIStroke_2 = Instance.new("UIStroke")
		uIStroke_2.Name = "UIStroke"
		uIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uIStroke_2.Transparency = 0.8
		uIStroke_2.Color = Color3.new(0.278, 0.278, 0.278)
		uIStroke_2.Thickness = 2.3
		uIStroke_2.Parent = textBoxButtonExample

		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "TextLabel"
		textLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
		textLabel.BackgroundColor3 = Color3.new(1, 1, 1)
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.Text = Name
		textLabel.TextScaled = true
		textLabel.BorderSizePixel = 0
		textLabel.TextWrapped = true
		textLabel.Position = UDim2.new(0.0463, 0, 0.155, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextTransparency = 0.2
		textLabel.BorderColor3 = Color3.new()
		textLabel.TextSize = 14
		textLabel.Size = UDim2.new(0.635, 0, 0.688, 0)
		textLabel.Parent = textBoxButtonExample
		
		textBox:GetPropertyChangedSignal("Text"):Connect(function()
			local NewText = textBox.Text
			
			Callback(NewText)
		end)
		
		Callback(DefaultValue)
	end
	
	return Tab
end

main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

return Library
