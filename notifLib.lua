-- Warning for non-synapse users.

-- Variables

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

local NotificationList = {}

local function TweenDrawing(Render, RenderInfo, RenderTo)
    local Start = {}
    local CurrentTime = 0
    local Connection
    for Index, Value in pairs(RenderTo) do
        Start[Index] = Render[Index]
        RenderTo[Index] = ((Value - Start[Index]))
    end
    Connection = RunService.RenderStepped:Connect(function(Delta)
        if CurrentTime < RenderInfo.Time then
            CurrentTime = CurrentTime + Delta
            local TweenedValue = TweenService:GetValue((CurrentTime / RenderInfo.Time), RenderInfo.EasingStyle, RenderInfo.EasingDirection)
            for Index, Value in pairs(RenderTo) do
                if typeof(Value) == "number" then
                    Render[Index] = (Value * TweenedValue) + Start[Index]
                elseif typeof(Value) == "Vector2" then
                    Render[Index] = Vector2.new((Value.X * TweenedValue) + Start[Index].X, (Value.Y * TweenedValue) + Start[Index].Y)
                elseif typeof(Value) == "function" then
                    Render[Index] = Value(TweenedValue)
                end
            end
        else
            Connection:Disconnect()
        end
    end)
end

return function(TitleText,DescriptionText,Time)
    local NotificationPosition;

    local notificationCount = #NotificationList
    print("old count", notificationCount, "new location", notificationCount+1)
    NotificationList[notificationCount+1] = notificationCount+1 

    if #NotificationList == 0 then
        NotificationPosition = Vector2.new((Camera.ViewportSize.X), (Camera.ViewportSize.Y) - (100))
    else
        NotificationPosition = Vector2.new((Camera.ViewportSize.X), (Camera.ViewportSize.Y) - (100) - #NotificationList * 27)
    end

    local Box = Drawing.new("Square")
    Box.Position = NotificationPosition
    Box.Filled = true
    Box.Transparency = 1
    Box.Visible = true
    Box.Size = Vector2.new(250, 25)
    Box.Color = Color3.fromRGB(32,32,32)

    local Outline = Drawing.new("Square")
    Outline.Position = Box.Position
    Outline.Filled = false
    Outline.Transparency = 1
    Outline.Visible = true
    Outline.Size = Vector2.new(250, 25)
    Outline.Thickness = 2
    Outline.Color = Color3.fromRGB(14,14,14)
    
    local Title = Drawing.new("Text") 
    Title.Position = Vector2.new((Box.Position.X + Box.Size.X/4), Box.Position.Y)
    Title.Text = TitleText
    Title.Visible = true
    Title.Color = Color3.new(255,255,255)
    Title.Size = 25
    Title.Center = true

    local Description = Drawing.new("Text") 
    Description.Position = Vector2.new((Title.Position.X + 150), (Title.Position.Y))
    Description.Text = DescriptionText
    Description.Visible = true
    Description.Color = Color3.new(255,255,255)
    Description.Size = 25
    Description.Center = true

    task.spawn(function()
        TweenDrawing(Box, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Box.Position.X) - (Box.Size.X), (Box.Position.Y))})
        TweenDrawing(Outline, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Box.Position.X) - (Box.Size.X), (Box.Position.Y))})
        TweenDrawing(Title, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Title.Position.X) - (Box.Size.X), (Title.Position.Y))})
        TweenDrawing(Description, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Description.Position.X) - (Box.Size.X), (Description.Position.Y))})

        task.wait(1 + Time)
        
        TweenDrawing(Box, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Box.Position.X) + (Box.Size.X*2), (Box.Position.Y))})
        TweenDrawing(Outline, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Box.Position.X) + (Box.Size.X*2), (Box.Position.Y))})
        TweenDrawing(Title, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Title.Position.X) + (Box.Size.X*2), (Title.Position.Y))})
        TweenDrawing(Description, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Vector2.new((Description.Position.X) + (Box.Size.X*2), (Description.Position.Y))})
        task.wait(2)
        Title:Remove()
        Box:Remove()
        Outline:Remove()
        Description:Remove()

        table.remove(NotificationList, notificationCount+1)
        print("testing -> old count", notificationCount, "new count", #NotificationList)

        for i,v in pairs(NotificationList) do
            print("table ->", i,v)
        end
    end)
end
