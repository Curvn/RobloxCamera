local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Template = Instance.new("Frame")
local Username = Instance.new("TextLabel")
local Message = Instance.new("TextLabel")
local UserImage = Instance.new("ImageLabel")

ScreenGui.Name = "RobloxCameraChatLog"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.DisplayOrder = 1
ScreenGui.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Main.BackgroundTransparency = 1
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.02, 0, 0.257449359, 0)
Main.Size = UDim2.new(0.228608757, 0, 0.471990466, 0)
Main.ZIndex = 2

UIListLayout.Parent = Main
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 5)

Template.Name = "Template"
Template.Parent = ScreenGui
Template.BackgroundColor3 = Color3.fromRGB(147, 147, 147)
Template.BackgroundTransparency = 1.000
Template.Position = UDim2.new(0, 0, 0.833333313, 0)
Template.Size = UDim2.new(1, 0, 0.166666672, 0)
Template.ZIndex = 2
Template.Visible = false

Username.Name = "Username"
Username.Parent = Template
Username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Username.BackgroundTransparency = 1.000
Username.Size = UDim2.new(1, 0, 0.303030312, 0)
Username.ZIndex = 4
Username.Font = Enum.Font.Ubuntu
Username.Text = "Name:"
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 18.000
Username.TextStrokeTransparency = 0.900
Username.TextWrapped = true
Username.TextXAlignment = Enum.TextXAlignment.Left

Message.Name = "Message"
Message.Parent = Template
Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Message.BackgroundTransparency = 1.000
Message.Position = UDim2.new(0.168571427, 0, 0.303030312, 0)
Message.Size = UDim2.new(0.808571458, 0, 0.696969688, 0)
Message.ZIndex = 4
Message.Font = Enum.Font.Ubuntu
Message.Text = ""
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextScaled = true
Message.TextSize = 14.000
Message.TextStrokeTransparency = 0.900
Message.TextWrapped = true
Message.TextXAlignment = Enum.TextXAlignment.Left

UserImage.Name = "UserImage"
UserImage.Parent = Template
UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserImage.BackgroundTransparency = 1.000
UserImage.Position = UDim2.new(0, 0, 0.303030312, 0)
UserImage.Size = UDim2.new(0.13142857, 0, 0.696969688, 0)
UserImage.ZIndex = 4
UserImage.Image = ""

local PS
local plr_userid
local TT, TS = Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420

function output(plr, msg)
	PS = game:GetService("Players")
	plr_userid = plr.UserId

	local plr_message_frame = Template:Clone()
	plr_message_frame.Parent = Main
	plr_message_frame.Username.Text = plr.Name .. ":"
	plr_message_frame.Message.Text = msg
	plr_message_frame.UserImage.Image = PS:GetUserThumbnailAsync(plr_userid, TT, TS)
	plr_message_frame.Visible = true
end

for i,v in pairs(game.Players:GetChildren()) do
	v.Chatted:Connect(function(msg)
		output(v, msg)
	end)
end

game.Players.ChildAdded:Connect(function(plr)
	if plr:IsA("Player") then
		plr.Chatted:Connect(function(msg)
			output(plr, msg)
		end)
	end
end)
