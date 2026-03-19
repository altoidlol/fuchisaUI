--[[

	 _._     _,-'FUCHISAUI`------------------._
	(,-.`._,'( Based off ReGui, by altoidlol |\`-/|
	    `-.-' \ )--------------------------`( , o o)
	          `-                             \`_`"'-

	Original written by depso (ReGui)
	Edited by altoidlol
	MIT License
	
	https://github.com/depthso
	https://github.com/altoidlol
]]

local genv = getgenv and getgenv()
if genv and genv.__FUI_ENV then
	return genv.__FUI_ENV
end

local service_proxy
local helper_service
local coreui_service
local notification_service
local ini_service
local tween_service
local userinput_service
local http_service
local _empty = table.freeze({})

local fui = {
	windows = table.create(8),
	elements = table.create(8)
}
setmetatable(fui.windows, { __mode = "v" })
setmetatable(fui.elements, { __mode = "v" })

fui.icons = table.freeze({
	Dot = "rbxasset://textures/whiteCircle.png",
	Arrow = "rbxasset://textures/ui/AvatarContextMenu_Arrow.png",
	Close = "rbxasset://textures/loading/cancelButton.png",
	Checkmark = "rbxasset://textures/ui/Lobby/Buttons/nine_slice_button.png",
	Cat = "rbxassetid://16211812161",
	Script = "rbxassetid://11570895459",
	Settings = "rbxassetid://9743465390",
	Info = "rbxassetid://18754976792",
	Move = "rbxassetid://6710235139",
	Roblox = "rbxassetid://7414445494",
	Warning = "rbxassetid://11745872910",
	Audio = "rbxassetid://302250236",
	Shop = "rbxassetid://6473525198",
	CharacterDance = "rbxassetid://11932783331",
	Pants = "rbxassetid://10098755331",
	Home = "rbxassetid://4034483344",
	Robux = "rbxassetid://5986143282",
	Badge = "rbxassetid://16170504068",
	SpawnLocation = "rbxassetid://6400507398",
	Sword = "rbxassetid://7485051715",
	Clover = "rbxassetid://11999300014",
	Star = "rbxassetid://3057073083",
	Code = "rbxassetid://11348555035",
	Paw = "rbxassetid://13001190533",
	Shield = "rbxassetid://7461510428",
	Shield2 = "rbxassetid://7169354142",
	File = "rbxassetid://7276823330",
	Book = "rbxassetid://16061686835",
	Location = "rbxassetid://13549782519",
	Puzzle = "rbxassetid://8898417863",
	Discord = "rbxassetid://84828491431270",
	Premium = "rbxassetid://6487178625",
	Friend = "rbxassetid://10885655986",
	User = "rbxassetid://18854794412",
	Duplicate = "rbxassetid://11833749507",
	ChatBox = "rbxassetid://15839118471",
	ChatBox2 = "rbxassetid://15839116089",
	Devices = "rbxassetid://4458812712",
	Weight = "rbxassetid://9855685269",
	Image = "rbxassetid://123311808092347",
	Profile = "rbxassetid://13585614795",
	Admin = "rbxassetid://11656483170",
	PaintBrush = "rbxassetid://12111879608",
	Speed = "rbxassetid://12641434961",
	NoConnection = "rbxassetid://9795340967",
	Connection = "rbxassetid://119759670842477",
	Globe = "rbxassetid://18870359747",
	Box = "rbxassetid://140217940575618",
	Crown = "rbxassetid://18826490498",
	Control = "rbxassetid://18979524646",
	Send = "rbxassetid://18940312887",
	FastForward = "rbxassetid://112963221295680",
	Pause = "rbxassetid://109949100737970",
	Reload = "rbxassetid://11570018242",
	Joystick = "rbxassetid://18749336354",
	Controller = "rbxassetid://11894535915",
	Lock = "rbxassetid://17783082088",
	Calculator = "rbxassetid://85861816563977",
	Sun = "rbxassetid://13492317832",
	Moon = "rbxassetid://8498174594",
	Prohibited = "rbxassetid://5248916036",
	Flag = "rbxassetid://251346532",
	Website = "rbxassetid://98455290625865",
	Telegram = "rbxassetid://115860270107061",
	MusicNote = "rbxassetid://18187351229",
	Music = "rbxassetid://253830398",
	Headphones = "rbxassetid://1311321471",
	Phone = "rbxassetid://8411963035",
	Smartphone = "rbxassetid://14040313879",
	Desktop = "rbxassetid://3120635703",
	Desktop2 = "rbxassetid://4728059490",
	Laptop = "rbxassetid://4728059725",
	Server = "rbxassetid://9692125126",
	Wedge = "rbxassetid://9086583059",
	Drill = "rbxassetid://11959189471",
	Character = "rbxassetid://13285102351",
	Menu = "rbxassetid://14895352864",
	Search = "rbxassetid://105364076467397",
})

service_proxy = setmetatable({}, {
	__index = function(self, Name: string)
		local Service = game:GetService(Name)
		return helper_service:HSNewRef(Service)
	end,
})

local global_tween_info = TweenInfo.new(
	0.25,
	Enum.EasingStyle.Quad,
	Enum.EasingDirection.Out
)

--[[
	Classes
]]

local container_base = table.create(8)

local window_class = table.create(8)
window_class.__index = window_class
setmetatable(window_class, { __index = container_base })

do
	function window_class:GetTitle()
		return self.TitleBar.Text
	end
	
	function window_class:SetTitle(text)
		self.TitleBar.Text = text
		return self
	end
	
	function window_class:SetVisible(value)
		self.window.Visible = value
		return self
	end
	
	function window_class:GetContainer()
		return self.content_group.Frame
	end

	function window_class:Center()
		self.window.Position = UDim2.new(0.5, 0, 0.5, -self.window.Size.Y.Offset/2)
		return self
	end

	function window_class:AddTween(obj, props)
		if not obj then return end

		local tween = tween_service:Create(obj, global_tween_info, props)
		return self:_TrackTween(tween)
	end

	function window_class:Collapse()
		if self.animating then return end
		if self.collapsed then return end
		if not self.window then return end
		self.collapsed = not self.collapsed
		self.expanded_window_pos = self.window.Position
		self.expanded_content_height = self.content_group.Frame.AbsoluteSize.Y

		self.animating = true

		local new_size = UDim2.new(
			self.expanded_window_size.X.Scale,
			self.expanded_window_size.X.Offset,
			0,
			self.collapsed_height
		)

		local window_tween = self:AddTween(self.window, {
			Size = new_size,
			Position = self.expanded_window_pos
		})

		self:AddTween(self.content_group and self.content_group.Frame, {
			Size = UDim2.new(1,0,0,0),
			BackgroundTransparency = 1
		})

		self:AddTween(self.collapse_button, {
			Rotation = 0
		})

		self:AddTween(self.window.glowbottom1, {
			ImageTransparency = 1
		})

		self:AddTween(self.window.glowbottom2, {
			ImageTransparency = 1
		})

		for _,t in ipairs(self.tweens) do
			t:Play()
		end

		if window_tween then
			window_tween.Completed:Wait()
		end

		table.clear(self.tweens)
		self.animating = false
		
		return self
	end

	function window_class:Expand()
		if self.animating then return end
		if not self.collapsed then return end
		if not self.window then return end
		self.collapsed = not self.collapsed
		self.expanded_window_pos = self.window.Position

		self.animating = true

		local window_tween = self:AddTween(self.window, {
			Size = self.expanded_window_size,
			Position = self.expanded_window_pos
		})

		self:AddTween(self.content_group.Frame, {
			Size = UDim2.new(1, 0, 0, self.expanded_content_height),
			BackgroundTransparency = 0.3
		})

		self:AddTween(self.collapse_button, {
			Rotation = 90
		})

		self:AddTween(self.window.glowbottom1, {
			ImageTransparency = 0
		})

		self:AddTween(self.window.glowbottom2, {
			ImageTransparency = 0
		})

		for _,t in ipairs(self.tweens) do
			t:Play()
		end

		if window_tween then
			window_tween.Completed:Wait()
		end

		table.clear(self.tweens)
		self.animating = false
		
		return self
	end

	function window_class:Close()

		if self.destroyed then return end
		self.destroyed = true

		local window = self.window
		if not window then return end

		local close_tween_info = TweenInfo.new(
			0.22,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.In
		)

		local close_tween = self:_TrackTween(tween_service:Create(
			window,
			close_tween_info,
			{
				Size = UDim2.new(
					window.Size.X.Scale,
					window.Size.X.Offset * 0.85,
					window.Size.Y.Scale,
					window.Size.Y.Offset * 0.85
				),
				Position = UDim2.new(
					window.Position.X.Scale,
					window.Position.X.Offset,
					window.Position.Y.Scale,
					window.Position.Y.Offset + 8
				),
				BackgroundTransparency = 1
			}
			))

		local fade_tweens = {}
		
		local descendants = window:GetDescendants()
		for i = 1, #descendants do
			local obj = descendants[i]
			if obj:IsA("GuiObject") then
				local tween = self:_TrackTween(tween_service:Create(
					obj,
					close_tween_info,
					{
						BackgroundTransparency = 1
					}
				))
				
				fade_tweens[#fade_tweens+1] = tween
				tween:Play()
			elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
				local tween = self:_TrackTween(tween_service:Create(
					obj,
					close_tween_info,
					{
						TextTransparency = 1
					}
				))

				fade_tweens[#fade_tweens+1] = tween
				tween:Play()
			elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
				local tween = self:_TrackTween(tween_service:Create(
					obj,
					close_tween_info,
					{
						ImageTransparency = 1
					}
				))

				fade_tweens[#fade_tweens+1] = tween
				tween:Play()
			end
		end

		close_tween:Play()
		close_tween.Completed:Wait()

		self:_Destroy()
	end
	
	function window_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end
	
	function window_class:_TrackTween(tween)
		local tweens = self.tweens

		tweens[#tweens + 1] = tween

		tween.Completed:Once(function()
			for i = 1, #tweens do
				if tweens[i] ~= tween then continue end

				tweens[i] = tweens[#tweens]
				tweens[#tweens] = nil
				break
			end
		end)

		return tween
	end

	function window_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,tween in ipairs(self.tweens) do
			pcall(function()
				tween:Cancel()
			end)
		end

		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.window then
			self.window:Destroy()
		end
		
		self.connections = nil
		self.tweens = nil
		self.window = nil
		self.title_bar = nil
		self.content_group = nil
		self.collapse_button = nil
	end
	
	function window_class:_CreateWindow(parent, config)
		if self.window then return end
		
		local window = Instance.new("Frame")
		window.Name = "Window"
		window.Parent = parent
		window.Active = true
		window.AnchorPoint = Vector2.new(0.5, 0)
		window.BackgroundColor3 = Color3.fromRGB(255, 114, 114)
		window.BackgroundTransparency = 1.000
		window.BorderColor3 = Color3.fromRGB(0, 0, 0)
		window.BorderSizePixel = 0
		window.Position = config.Position
		window.Size = config.Size

		local window_padding = Instance.new("UIPadding")
		window_padding.Parent = window
		window_padding.PaddingBottom = UDim.new(0, 1)
		window_padding.PaddingLeft = UDim.new(0, 1)
		window_padding.PaddingRight = UDim.new(0, 1)
		window_padding.PaddingTop = UDim.new(0, 1)

		self.window = window
		self.expanded_window_size = window.Size
		self.expanded_window_pos = window.Position
	end

	function window_class:_CreateWindowGlow()
		if not self.window then return end

		local glowtop_1 = Instance.new("ImageLabel")
		glowtop_1.Name = "glowtop1"
		glowtop_1.Parent = self.window
		glowtop_1.AnchorPoint = Vector2.new(0.5, 0)
		glowtop_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowtop_1.BackgroundTransparency = 1.000
		glowtop_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowtop_1.BorderSizePixel = 0
		glowtop_1.Position = UDim2.new(0.5, 0, 0, -5)
		glowtop_1.Size = UDim2.new(1, 0, 0, 10)
		glowtop_1.ZIndex = 4
		glowtop_1.Image = "rbxassetid://76150694119616"

		local gradient_1 = Instance.new("UIGradient")
		gradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_1.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.22, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.74, 0.50), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
		gradient_1.Parent = glowtop_1

		local glowtop_2 = Instance.new("ImageLabel")
		glowtop_2.Name = "glowtop2"
		glowtop_2.Parent = self.window
		glowtop_2.AnchorPoint = Vector2.new(0.5, 0)
		glowtop_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowtop_2.BackgroundTransparency = 1.000
		glowtop_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowtop_2.BorderSizePixel = 0
		glowtop_2.Position = glowtop_1.Position
		glowtop_2.Size = UDim2.new(1, 0, 0, 10)
		glowtop_2.ZIndex = 4
		glowtop_2.Image = "rbxassetid://76150694119616"

		local gradient_2 = Instance.new("UIGradient")
		gradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_2.Parent = glowtop_2

		local glowbottom_1 = Instance.new("ImageLabel")
		glowbottom_1.Name = "glowbottom1"
		glowbottom_1.Parent = self.window
		glowbottom_1.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom_1.BackgroundTransparency = 1.000
		glowbottom_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom_1.BorderSizePixel = 0
		glowbottom_1.Position = UDim2.new(0.5, 0, 1, 5)
		glowbottom_1.Size = UDim2.new(1, 0, 0, 10)
		glowbottom_1.ZIndex = 4
		glowbottom_1.Image = "rbxassetid://76150694119616"

		local gradient_3 = Instance.new("UIGradient")
		gradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.32, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.52, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_3.Parent = glowbottom_1

		local glowbottom_2 = Instance.new("ImageLabel")
		glowbottom_2.Name = "glowbottom2"
		glowbottom_2.Parent = self.window
		glowbottom_2.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom_2.BackgroundTransparency = 1.000
		glowbottom_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom_2.BorderSizePixel = 0
		glowbottom_2.Position = glowbottom_1.Position
		glowbottom_2.Size = UDim2.new(1, 0, 0, 10)
		glowbottom_2.ZIndex = 4
		glowbottom_2.Image = "rbxassetid://76150694119616"

		local gradient_4 = Instance.new("UIGradient")
		gradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.32, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.52, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.32, 0.00), NumberSequenceKeypoint.new(0.52, 1.00), NumberSequenceKeypoint.new(0.74, 0.50), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
		gradient_4.Parent = glowbottom_2
	end

	function window_class:_CreateWindowContent()
		if self.content_group then return end
		if not self.window then return end

		local content_group = Instance.new("CanvasGroup")
		content_group.Name = "Content"
		content_group.Parent = self.window
		content_group.Active = true
		content_group.AutomaticSize = Enum.AutomaticSize.Y
		content_group.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		content_group.BackgroundTransparency = 1.000
		content_group.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_group.BorderSizePixel = 0
		content_group.Position = UDim2.new(0, 0, 0, 0)
		content_group.Size = UDim2.new(1, 0, 1, 0)

		local border_stroke = Instance.new("UIStroke")
		border_stroke.Name = "Border"
		border_stroke.Parent = content_group
		border_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border_stroke.Color = Color3.fromRGB(134, 134, 147)
		border_stroke.Thickness = 1

		local corner_radius = Instance.new("UICorner")
		corner_radius.CornerRadius = UDim.new(0, 8)
		corner_radius.Parent = content_group

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = content_group
		list_layout.Padding = UDim.new(0, 0)
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill

		local content_frame = Instance.new("Frame")
		content_frame.Parent = content_group
		content_frame.ClipsDescendants = true
		content_frame.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
		content_frame.BackgroundTransparency = 0.300
		content_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_frame.BorderSizePixel = 0
		content_frame.Position = UDim2.new(0, 0, 0, 0)
		content_frame.Size = UDim2.new(1, 0, 1, 0)

		self.content_group = content_group
	end

	function window_class:_CreateTitleBar(config)
		if self.title_bar then return end
		if not self.window then return end
		if not self.content_group then return end

		local title_bar = Instance.new("Frame")
		title_bar.Name = "TitleBar"
		title_bar.Parent = self.content_group
		title_bar.AutomaticSize = Enum.AutomaticSize.Y
		title_bar.BackgroundColor3 = Color3.fromRGB(35, 30, 35)
		title_bar.BackgroundTransparency = 0.300
		title_bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title_bar.BorderSizePixel = 0
		title_bar.ClipsDescendants = true
		title_bar.LayoutOrder = -1
		title_bar.Position = UDim2.new(0, 0, 0, 0)
		title_bar.Size = UDim2.new(1, 0, 0, 19)

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(170, 170, 170))}
		gradient.Parent = title_bar
		gradient.Enabled = false

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = title_bar
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill
		list_layout.Padding = UDim.new(0, 4)

		local padding = Instance.new("UIPadding")
		padding.Parent = title_bar
		padding.PaddingBottom = UDim.new(0, 1)
		padding.PaddingLeft = UDim.new(0, 4)
		padding.PaddingRight = UDim.new(0, 4)
		padding.PaddingTop = UDim.new(0, 1)

		local flex_item = Instance.new("UIFlexItem")
		flex_item.Parent = title_bar

		local title_bar_2 = Instance.new("TextButton")
		title_bar_2.Name = "TitleBar"
		title_bar_2.Parent = title_bar
		title_bar_2.AutomaticSize = Enum.AutomaticSize.Y
		title_bar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title_bar_2.BackgroundTransparency = 1.000
		title_bar_2.BorderColor3 = Color3.fromRGB(110, 110, 125)
		title_bar_2.BorderSizePixel = 0
		title_bar_2.ClipsDescendants = true
		title_bar_2.LayoutOrder = 1
		title_bar_2.Size = UDim2.new(1, 0, 0, 19)
		title_bar_2.AutoButtonColor = false
		title_bar_2.Font = "Montserrat"
		title_bar_2.FontFace.Weight = Enum.FontWeight.Medium
		title_bar_2.Text = config.Title
		title_bar_2.TextColor3 = Color3.fromRGB(200, 180, 200)
		title_bar_2.TextSize = 14.000

		local corner_radius = Instance.new("UICorner")
		corner_radius.CornerRadius = UDim.new(0, 0)
		corner_radius.Name = "FrameRounding"
		corner_radius.Parent = title_bar_2

		local gradient_2 = Instance.new("UIGradient")
		gradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(139, 189, 186))}
		gradient_2.Parent = title_bar_2
		gradient_2.Enabled = false

		local list_layout_2 = Instance.new("UIListLayout")
		list_layout_2.Parent = title_bar_2
		list_layout_2.FillDirection = Enum.FillDirection.Horizontal
		list_layout_2.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout_2.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout_2.VerticalFlex = Enum.UIFlexAlignment.Fill
		list_layout_2.Padding = UDim.new(0, 4)

		local padding_2 = Instance.new("UIPadding")
		padding_2.Parent = title_bar_2
		padding_2.PaddingLeft = UDim.new(0, 2)

		local dragging = false
		local drag_start, start_pos, active_tween

		self:_TrackConnection(title_bar_2.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			dragging = true
			drag_start = input.Position
			start_pos = self.window.Position
		end))

		self:_TrackConnection(title_bar_2.InputEnded:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			
			dragging = false
			active_tween = nil
		end))

		self:_TrackConnection(userinput_service.InputChanged:Connect(function(input)
			if not dragging then return end
			if input.UserInputType ~= Enum.UserInputType.MouseMovement 
				and input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end

			local delta = input.Position - drag_start

			local target_window_pos = UDim2.new(
				start_pos.X.Scale,
				start_pos.X.Offset + delta.X,
				start_pos.Y.Scale,
				start_pos.Y.Offset + delta.Y
			)

			if not config.SmoothDrag then
				self.window.Position = target_window_pos
				return
			end

			if active_tween then
				active_tween:Cancel()
				active_tween = nil
			end

			active_tween = self:_TrackTween(tween_service:Create(
				self.window,
				global_tween_info,
				{ Position = target_window_pos }
				))

			active_tween:Play()
		end))

		self.title_bar = title_bar
		task.defer(function()
			self.collapsed_height = title_bar.AbsoluteSize.Y
		end)
	end

	function window_class:_CreateCollapseButton()
		if self.collapse_button then return end
		if not self.title_bar then return end
		if not self.window then return end
		if not self.content_group then return end

		local toggle = Instance.new("Frame")
		toggle.Name = "CollapseToggle"
		toggle.Parent = self.title_bar.TitleBar
		toggle.Active = true
		toggle.AutomaticSize = Enum.AutomaticSize.X
		toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		toggle.BackgroundTransparency = 1.000
		toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		toggle.BorderSizePixel = 0
		toggle.Size = UDim2.new(0, 17, 0, 0)

		local constraint = Instance.new("UIAspectRatioConstraint")
		constraint.Parent = toggle

		local padding = Instance.new("UIPadding")
		padding.Parent = toggle
		padding.PaddingBottom = UDim.new(0, 1)
		padding.PaddingLeft = UDim.new(0, 1)
		padding.PaddingRight = UDim.new(0, 1)
		padding.PaddingTop = UDim.new(0, 1)

		local icon = Instance.new("ImageButton")
		icon.Name = "Icon"
		icon.Parent = toggle
		icon.AnchorPoint = Vector2.new(0.5, 0.5)
		icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.BackgroundTransparency = 1.000
		icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		icon.Rotation = 90.000
		icon.Size = UDim2.new(0.8, 0, 0.8, 0)
		icon.ZIndex = 1
		icon.Image = "rbxassetid://4731371527"

		local hover_circle = Instance.new("Frame")
		hover_circle.Name = "HoverCircle"
		hover_circle.Parent = toggle
		hover_circle.AnchorPoint = Vector2.new(0.5, 0.5)
		hover_circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		hover_circle.BackgroundTransparency = 1.000
		hover_circle.Position = UDim2.new(0.5, 0, 0.5, 0)
		hover_circle.Size = UDim2.new(0, 0, 0, 0)
		hover_circle.ZIndex = 0

		local grad = Instance.new("UIGradient")
		grad.Parent = hover_circle
		grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(200,180,255)),ColorSequenceKeypoint.new(1, Color3.fromRGB(150,200,255))}
		grad.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(1,0.9)}

		local stroke = Instance.new("UIStroke")
		stroke.Parent = hover_circle
		stroke.Color = Color3.fromRGB(200,180,255)
		stroke.Thickness = 1
		stroke.Transparency = 0.6

		local corner_radius = Instance.new("UICorner")
		corner_radius.Name = "FrameRounding"
		corner_radius.Parent = hover_circle
		corner_radius.CornerRadius = UDim.new(1, 0)

		self:_TrackConnection(icon.MouseButton1Click:Connect(function()
			if self.collapsed then
				self:Expand()
			else
				self:Collapse()
			end
		end))

		local hover_tween
		self:_TrackConnection(icon.MouseEnter:Connect(function()
			if hover_tween then
				hover_tween:Cancel()
			end

			hover_tween = self:_TrackTween(tween_service:Create(
				hover_circle,
				global_tween_info,
				{
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 0.75
				}
				))

			hover_tween:Play()
		end))

		self:_TrackConnection(icon.MouseLeave:Connect(function()
			if hover_tween then
				hover_tween:Cancel()
			end

			hover_tween = self:_TrackTween(tween_service:Create(
				hover_circle,
				global_tween_info,
				{
					Size = UDim2.new(0, 0, 0, 0),
					BackgroundTransparency = 1
				}
				))

			hover_tween:Play()
		end))

		self.collapse_button = icon
	end

	function window_class:_CreateCloseButton()
		if self.close_button then return end
		if not self.title_bar then return end
		if not self.window then return end
		if not self.content_group then return end

		local toggle = Instance.new("Frame")
		toggle.Name = "CloseToggle"
		toggle.Parent = self.title_bar.TitleBar
		toggle.Active = true
		toggle.AutomaticSize = Enum.AutomaticSize.X
		toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		toggle.BackgroundTransparency = 1.000
		toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		toggle.BorderSizePixel = 0
		toggle.LayoutOrder = 2
		toggle.Size = UDim2.new(0, 17, 0, 0)

		local constraint = Instance.new("UIAspectRatioConstraint")
		constraint.Parent = toggle

		local padding = Instance.new("UIPadding")
		padding.Parent = toggle
		padding.PaddingBottom = UDim.new(0, 1)
		padding.PaddingLeft = UDim.new(0, 1)
		padding.PaddingRight = UDim.new(0, 1)
		padding.PaddingTop = UDim.new(0, 1)

		local icon = Instance.new("ImageButton")
		icon.Name = "Icon"
		icon.Parent = toggle
		icon.AnchorPoint = Vector2.new(0.5, 0.5)
		icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.BackgroundTransparency = 1.000
		icon.Position = UDim2.new(0.5, 0, 0.5, 0)
		icon.Size = UDim2.new(0.8, 0, 0.8, 0)
		icon.ZIndex = 1
		icon.Image = "rbxassetid://90965270530088"

		local hover_circle = Instance.new("Frame")
		hover_circle.Name = "HoverCircle"
		hover_circle.Parent = toggle
		hover_circle.AnchorPoint = Vector2.new(0.5, 0.5)
		hover_circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		hover_circle.BackgroundTransparency = 1.000
		hover_circle.Position = UDim2.new(0.5, 0, 0.5, 0)
		hover_circle.Size = UDim2.new(0, 0, 0, 0)
		hover_circle.ZIndex = 0

		local grad = Instance.new("UIGradient")
		grad.Parent = hover_circle
		grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(200,180,255)),ColorSequenceKeypoint.new(1, Color3.fromRGB(150,200,255))}
		grad.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(1,0.9)}

		local stroke = Instance.new("UIStroke")
		stroke.Parent = hover_circle
		stroke.Color = Color3.fromRGB(200,180,255)
		stroke.Thickness = 1
		stroke.Transparency = 0.6

		local corner_radius = Instance.new("UICorner")
		corner_radius.Name = "FrameRounding"
		corner_radius.Parent = hover_circle
		corner_radius.CornerRadius = UDim.new(1, 0)

		self:_TrackConnection(icon.MouseButton1Click:Connect(function()
			self:Close()
		end))

		local hover_tween
		self:_TrackConnection(icon.MouseEnter:Connect(function()
			if hover_tween then
				hover_tween:Cancel()
			end

			hover_tween = self:_TrackTween(tween_service:Create(
				hover_circle,
				global_tween_info,
				{
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 0.75
				}
				))

			hover_tween:Play()
		end))

		self:_TrackConnection(icon.MouseLeave:Connect(function()
			if hover_tween then
				hover_tween:Cancel()
			end

			hover_tween = self:_TrackTween(tween_service:Create(
				hover_circle,
				global_tween_info,
				{
					Size = UDim2.new(0, 0, 0, 0),
					BackgroundTransparency = 1
				}
				))

			hover_tween:Play()
		end))

		self.close_button = icon
	end
end

local notif_class = table.create(8)
notif_class.__index = notif_class

do
	function notif_class:SetTitle(title)
		self.content_frame.Title.Text = title
		return self
	end
	
	function notif_class:SetBody(body)
		self.content_frame.Body.Text = body
		return self
	end
	
	function notif_class:SetIcon(icon)
		self.content_frame.Icon.Image = icon
		return self
	end
	
	function notif_class:SetDuration(duration)
		self.duration = duration
		return self
	end
	
	function notif_class:Push()
		if not self.notif then return end
		if not self.duration then return end

		tween_service:Create(
			self.notif.Border,
			global_tween_info,
			{
				Transparency = 0
			}
		):Play()

		tween_service:Create(
			self.content_frame.Title,
			global_tween_info,
			{
				TextTransparency = 0
			}
		):Play()

		tween_service:Create(
			self.content_frame.Body,
			global_tween_info,
			{
				TextTransparency = 0
			}
		):Play()

		tween_service:Create(
			self.content_frame.Icon,
			global_tween_info,
			{
				ImageTransparency = 0
			}
		):Play()

		tween_service:Create(
			self.notif,
			global_tween_info,
			{
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 0.3
			}
		):Play()
		
		tween_service:Create(
			self.notif.Gradient,
			TweenInfo.new(
				self.duration,
				Enum.EasingStyle.Linear,
				Enum.EasingDirection.Out
			),
			{
				Offset = Vector2.new(1, 0)
			}
		):Play()
	end
	
	function notif_class:Pull()
		if not self.notif then return end
		
		local exit_tween = tween_service:Create(
			self.notif,
			global_tween_info,
			{
				Position = UDim2.new(0.5, 0, 0.5, 12),
				BackgroundTransparency = 1
			}
		)

		tween_service:Create(
			self.notif.Border,
			global_tween_info,
			{
				Transparency = 1
			}
		):Play()

		tween_service:Create(
			self.content_frame.Title,
			global_tween_info,
			{
				TextTransparency = 1
			}
		):Play()

		tween_service:Create(
			self.content_frame.Body,
			global_tween_info,
			{
				TextTransparency = 1
			}
		):Play()

		tween_service:Create(
			self.content_frame.Icon,
			global_tween_info,
			{
				ImageTransparency = 1
			}
		):Play()

		exit_tween:Play()
		exit_tween.Completed:Wait()
		
		self:_Destroy()
	end
	
	function notif_class:_Destroy()
		local notifs = notification_service.notifs
		local index = table.find(notifs, self)

		if index then
			table.remove(notifs, index)
		end

		self.notif.Parent:Destroy()
		notification_service:NSRepositionNotifs()
	end
	
	function notif_class:_CreateNotif(parent)
		if self.notif then return end
		
		local holder_frame = Instance.new("Frame")
		holder_frame.Name = "NotifHolder"
		holder_frame.Parent = parent
		holder_frame.AnchorPoint = Vector2.new(1, 1)
		holder_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		holder_frame.BackgroundTransparency = 1.000
		holder_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		holder_frame.BorderSizePixel = 0
		holder_frame.Position = UDim2.new(1, -20, 1, -20)
		holder_frame.Size = UDim2.new(0, 256, 0, 120)

		local notif = Instance.new("Frame")	
		notif.Parent = holder_frame
		notif.AnchorPoint = Vector2.new(0.5, 0.5)
		notif.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		notif.BackgroundTransparency = 1
		notif.BorderColor3 = Color3.fromRGB(0, 0, 0)
		notif.BorderSizePixel = 0
		notif.ClipsDescendants = true
		notif.Size = UDim2.new(1, -10, 1, -10)
		notif.Position = UDim2.new(0.5, 0, 0.5, 10)
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.CornerRadius = UDim.new(0, 8)
		corner_radius.Parent = notif

		local gradient = Instance.new("UIGradient")
		gradient.Name = "Gradient"
		gradient.Offset = Vector2.new(-1, 0)
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 37, 49)), ColorSequenceKeypoint.new(0.04, Color3.fromRGB(26, 25, 33)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 25, 33))}
		gradient.Parent = notif
		
		local border_stroke = Instance.new("UIStroke")
		border_stroke.Name = "Border"
		border_stroke.Parent = notif
		border_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border_stroke.Color = Color3.fromRGB(134, 134, 147)
		border_stroke.Thickness = 1
		border_stroke.Transparency = 1

		self.notif = notif
	end
	
	function notif_class:_CreateNotifGlow()
		if not self.notif then return end
		
		local glowtop_1 = Instance.new("ImageLabel")
		glowtop_1.Name = "glowtop1"
		glowtop_1.Parent = self.notif
		glowtop_1.AnchorPoint = Vector2.new(0.5, 0)
		glowtop_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowtop_1.BackgroundTransparency = 1.000
		glowtop_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowtop_1.BorderSizePixel = 0
		glowtop_1.Position = UDim2.new(0.5, 0, 0, -5)
		glowtop_1.Size = UDim2.new(1, 0, 0, 10)
		glowtop_1.ZIndex = 4
		glowtop_1.Image = "rbxassetid://76150694119616"

		local gradient_1 = Instance.new("UIGradient")
		gradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_1.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.22, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.74, 0.50), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
		gradient_1.Parent = glowtop_1

		local glowtop_2 = Instance.new("ImageLabel")
		glowtop_2.Name = "glowtop2"
		glowtop_2.Parent = self.notif
		glowtop_2.AnchorPoint = Vector2.new(0.5, 0)
		glowtop_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowtop_2.BackgroundTransparency = 1.000
		glowtop_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowtop_2.BorderSizePixel = 0
		glowtop_2.Position = glowtop_1.Position
		glowtop_2.Size = UDim2.new(1, 0, 0, 10)
		glowtop_2.ZIndex = 4
		glowtop_2.Image = "rbxassetid://76150694119616"

		local gradient_2 = Instance.new("UIGradient")
		gradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_2.Parent = glowtop_2

		local glowbottom_1 = Instance.new("ImageLabel")
		glowbottom_1.Name = "glowbottom1"
		glowbottom_1.Parent = self.notif
		glowbottom_1.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom_1.BackgroundTransparency = 1.000
		glowbottom_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom_1.BorderSizePixel = 0
		glowbottom_1.Position = UDim2.new(0.5, 0, 1, 5)
		glowbottom_1.Size = UDim2.new(1, 0, 0, 10)
		glowbottom_1.ZIndex = 4
		glowbottom_1.Image = "rbxassetid://76150694119616"

		local gradient_3 = Instance.new("UIGradient")
		gradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.32, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.52, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_3.Parent = glowbottom_1

		local glowbottom_2 = Instance.new("ImageLabel")
		glowbottom_2.Name = "glowbottom2"
		glowbottom_2.Parent = self.notif
		glowbottom_2.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom_2.BackgroundTransparency = 1.000
		glowbottom_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom_2.BorderSizePixel = 0
		glowbottom_2.Position = glowbottom_1.Position
		glowbottom_2.Size = UDim2.new(1, 0, 0, 10)
		glowbottom_2.ZIndex = 4
		glowbottom_2.Image = "rbxassetid://76150694119616"

		local gradient_4 = Instance.new("UIGradient")
		gradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.32, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.52, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.32, 0.00), NumberSequenceKeypoint.new(0.52, 1.00), NumberSequenceKeypoint.new(0.74, 0.50), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
		gradient_4.Parent = glowbottom_2
	end
	
	function notif_class:_CreateNotifContent()
		if self.content_frame then return end
		if not self.notif then return end
		
		local content_frame = Instance.new("Frame")	
		content_frame.Parent = self.notif
		content_frame.AnchorPoint = Vector2.new(0.5, 0.5)
		content_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		content_frame.BackgroundTransparency = 1
		content_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_frame.BorderSizePixel = 0
		content_frame.ClipsDescendants = true
		content_frame.Size = UDim2.new(1, 0, 1, 0)
		content_frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		
		local title = Instance.new("TextLabel")
		title.Name = "Title"
		title.Parent = content_frame
		title.AnchorPoint = Vector2.new(1, 0)
		title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title.BackgroundTransparency = 1.000
		title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title.BorderSizePixel = 0
		title.Position = UDim2.new(1, 0, 0, 10)
		title.Size = UDim2.new(1, -40, 0, 20)
		title.Font = "Montserrat"
		title.FontFace.Weight = Enum.FontWeight.Bold
		title.TextColor3 = Color3.fromRGB(185, 176, 166)
		title.TextTransparency = 1
		title.TextSize = 20.000
		title.TextXAlignment = Enum.TextXAlignment.Left
		
		local icon = Instance.new("ImageLabel")
		icon.Name = "Icon"
		icon.Parent = content_frame
		icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.BackgroundTransparency = 1
		icon.ImageTransparency = 1
		icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		icon.BorderSizePixel = 0
		icon.Position = UDim2.new(0, 10, 0, 10)
		icon.Size = UDim2.new(0, 20, 0, 20)
		
		local body = Instance.new("TextLabel")
		body.Name = "Body"
		body.Parent = content_frame
		body.AnchorPoint = Vector2.new(0.5, 1)
		body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		body.BackgroundTransparency = 1.000
		body.BorderColor3 = Color3.fromRGB(0, 0, 0)
		body.BorderSizePixel = 0
		body.Position = UDim2.new(0.5, 0, 1, -10)
		body.Size = UDim2.new(1, -20, 1, -50)
		body.Font = "Montserrat"
		body.FontFace.Weight = Enum.FontWeight.Medium
		body.TextWrapped = true
		body.TextColor3 = Color3.fromRGB(185, 176, 166)
		body.TextTransparency = 1
		body.TextSize = 14.000
		body.TextXAlignment = Enum.TextXAlignment.Left
		body.TextYAlignment = Enum.TextYAlignment.Top
		
		self.content_frame = content_frame
	end
end

local tab_class = table.create(8)
tab_class.__index = tab_class
setmetatable(tab_class, { __index = container_base })

do
	function tab_class:GetName()
		return self.tab.Name
	end
	
	function tab_class:SetName(name)
		self.tab.Name = name
		self.content_frame.Name = name.."Content"
		return self
	end
	
	function tab_class:GetContainer()
		return self.content_frame
	end
	
	function tab_class:SetClickCallback(callback)
		self.click_callback = callback
		return self
	end
	
	function tab_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end
	
	function tab_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end
		
		if self.tab then
			pcall(function()
				self.tab:Destroy()
			end)
		end
		
		self.connections = nil
		self.tab = nil
	end
	
	function tab_class:_CreateTab(parent, name, icon)
		if self.tab then return end
		
		local tab = Instance.new("Frame")
		tab.Name = name
		tab.Parent = parent
		tab.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
		tab.BackgroundTransparency = 1.000
		tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tab.BorderSizePixel = 0
		tab.Position = UDim2.new(0, 0, 0, 0)
		tab.Size = UDim2.new(1, 0, 0, 24)
		
		local tab_content = Instance.new("Frame")
		tab_content.Name = "TabContent"
		tab_content.Parent = tab
		tab_content.AnchorPoint = Vector2.new(1, 0.5)
		tab_content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tab_content.BackgroundTransparency = 1.000
		tab_content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tab_content.BorderSizePixel = 0
		tab_content.Position = UDim2.new(1, 0, 0.5, 0)
		tab_content.Size = UDim2.new(1, -24, 1, 0)
		tab_content.ClipsDescendants = true
		
		local name_label = Instance.new("TextLabel")
		name_label.Name = "NameLabel"
		name_label.Parent = tab_content
		name_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		name_label.BackgroundTransparency = 1.000
		name_label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		name_label.BorderSizePixel = 0
		name_label.Position = UDim2.new(0, 0, 0, 0)
		name_label.Size = UDim2.new(1, 0, 1, 0)
		name_label.Font = "Montserrat"
		name_label.FontFace.Weight = Enum.FontWeight.Medium
		name_label.Text = name
		name_label.TextColor3 = Color3.fromRGB(200, 180, 200)
		name_label.TextSize = 16.000
		name_label.TextXAlignment = Enum.TextXAlignment.Left
		
		local padding = Instance.new("UIPadding")
		padding.Parent = tab_content
		padding.PaddingBottom = UDim.new(0, 8)
		padding.PaddingLeft = UDim.new(0, 8)
		padding.PaddingRight = UDim.new(0, 8)
		padding.PaddingTop = UDim.new(0, 8)
		
		local icon_button = Instance.new("ImageButton")
		icon_button.Name = "Icon"
		icon_button.Parent = tab
		icon_button.AnchorPoint = Vector2.new(0, 0.5)
		icon_button.AutoButtonColor = false
		icon_button.BackgroundColor3 = Color3.fromRGB(66, 150, 250)
		icon_button.BackgroundTransparency = 1.000
		icon_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		icon_button.BorderSizePixel = 0
		icon_button.Position = UDim2.new(0, 0, 0.5, 0)
		icon_button.Size = UDim2.new(1, 0, 1, 0)
		icon_button.ImageTransparency = 1.000
		
		local icon_image = Instance.new("ImageLabel")
		icon_image.Name = "IconImage"
		icon_image.Parent = icon_button
		icon_image.BackgroundTransparency = 1
		icon_image.Image = icon
		icon_image.AnchorPoint = Vector2.new(0, 0.5)
		icon_image.Position = UDim2.new(0, 0, 0.5, 0)
		icon_image.Size = UDim2.new(0, 24, 0, 24)
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Name = "FrameRounding"
		corner_radius.Parent = icon_button
		corner_radius.CornerRadius = UDim.new(1, 0)
		
		local constraint = Instance.new("UIAspectRatioConstraint")
		constraint.Parent = icon_image
		
		local glowtop_1 = Instance.new("ImageLabel")
		glowtop_1.Name = "glowtop1"
		glowtop_1.Parent = tab
		glowtop_1.AnchorPoint = Vector2.new(0, 0.5)
		glowtop_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowtop_1.BackgroundTransparency = 1.000
		glowtop_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowtop_1.BorderSizePixel = 0
		glowtop_1.Position = UDim2.new(0, 0, 0.5, 0)
		glowtop_1.Size = UDim2.new(1, 2, 1, 2)
		glowtop_1.ZIndex = 4
		glowtop_1.Image = "rbxassetid://76150694119616"
		
		local corner_radius_2 = Instance.new("UICorner")
		corner_radius_2.Name = "FrameRounding"
		corner_radius_2.Parent = glowtop_1
		corner_radius_2.CornerRadius = UDim.new(1, 0)

		local gradient_1 = Instance.new("UIGradient")
		gradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_1.Parent = glowtop_1
		
		local hover_tween
		local hovering = false
		
		self:_TrackConnection(icon_button.MouseEnter:Connect(function()
			hovering = true
			
			if hover_tween then
				hover_tween:Cancel()
			end
			
			tween_service:Create(
				glowtop_1,
				global_tween_info,
				{
					BackgroundTransparency = 0.8
				}
			):Play()
			
			local scoop = tween_service:Create(
				gradient_1,
				TweenInfo.new(
					0.2,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					Rotation = 90,
					Offset = Vector2.new(-1,0)
				}
			)

			scoop:Play()
			scoop.Completed:Wait()
			
			if not hovering then return end

			hover_tween = tween_service:Create(
				gradient_1,
				global_tween_info,
				{
					Offset = Vector2.new(1,-0.5)
				}
			)

			hover_tween:Play()
		end))

		self:_TrackConnection(icon_button.MouseLeave:Connect(function()
			hovering = false
			
			if hover_tween then
				hover_tween:Cancel()
			end
			
			tween_service:Create(
				glowtop_1,
				global_tween_info,
				{
					BackgroundTransparency = (self.is_active and 0.6 or 1)
				}
			):Play()

			hover_tween = tween_service:Create(
				gradient_1,
				global_tween_info,
				{
					Rotation = 0,
					Offset = Vector2.new(0,0)
				}
			)

			hover_tween:Play()
		end))
		
		self:_TrackConnection(icon_button.MouseButton1Click:Connect(function()
			if self.click_callback then
				self.click_callback()
			end
		end))
		
		self.tab = tab
	end
	
	function tab_class:_CreateTabContent(parent)
		if self.content_frame then return end
		if not self.tab then return end
		
		local content_frame = Instance.new("Frame")
		content_frame.Name = self:GetName().."Content"
		content_frame.Parent = parent
		content_frame.AnchorPoint = Vector2.new(1, 0.5)
		content_frame.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
		content_frame.BackgroundTransparency = 1.000
		content_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_frame.BorderSizePixel = 0
		content_frame.Position = UDim2.new(1, 0, 0.5, 0)
		content_frame.Size = UDim2.new(1, 0, 1, 0)
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = content_frame
		list_layout.Padding = UDim.new(0, 8)
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill
		
		local padding = Instance.new("UIPadding")
		padding.Parent = content_frame
		padding.PaddingBottom = UDim.new(0, 8)
		padding.PaddingRight = UDim.new(0, 8)
		padding.PaddingTop = UDim.new(0, 8)
		
		self.content_frame = content_frame
	end
end

local sidebar_class = table.create(8)
sidebar_class.__index = sidebar_class

do
	function sidebar_class:CreateTab(name, icon)
		if not self.tab_frame then return end
		
		local new_tab = setmetatable({}, tab_class)
		new_tab.connections = table.create(8)
		
		new_tab:_CreateTab(
			self.tab_frame.CenterSection,
			name,
			icon
		)
		new_tab:_CreateTabContent(self.content_frame)
		
		new_tab._CreateTab = nil
		new_tab._CreateTabContent = nil
		new_tab.content_frame.Visible = false
		new_tab.is_active = false
		
		new_tab.tab.LayoutOrder = #self.tabs
		table.insert(self.tabs, new_tab)
		
		local tab_idx = #self.tabs
		if not self.active_tab then
			self:_SetActiveTab(tab_idx)
		elseif self.active_tab == 1 and tab_idx == 2 then
			self:_SetActiveTab(tab_idx)
		end
		
		new_tab:SetClickCallback(function()
			self:_SetActiveTab(tab_idx)
		end)
		
		return new_tab
	end
	
	function sidebar_class:Collapse()
		if self.animating then return end
		if self.collapsed then return end
		if not self.sidebar then return end
		self.collapsed = not self.collapsed

		self.animating = true

		local sidebar_tween = tween_service:Create(
			self.sidebar,
			global_tween_info,
			{
				Size = UDim2.new(0, 34, 1, -20),
				BackgroundTransparency = 1
			}
		)
		
		sidebar_tween:Play()
		
		if sidebar_tween then
			sidebar_tween.Completed:Wait()
		end

		self.animating = false
		return self
	end
	
	function sidebar_class:Expand()
		if self.animating then return end
		if not self.collapsed then return end
		if not self.sidebar then return end
		self.collapsed = not self.collapsed

		self.animating = true

		local sidebar_tween = tween_service:Create(
			self.sidebar,
			global_tween_info,
			{
				Size = UDim2.new(0, 150, 1, -20),
				BackgroundTransparency = 0.4
			}
		)
		
		sidebar_tween:Play()

		if sidebar_tween then
			sidebar_tween.Completed:Wait()
		end

		self.animating = false
		return self
	end
	
	function sidebar_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end
	
	function sidebar_class:_SetActiveTab(index)
		local tab = self.tabs[index]
		
		if self.active_tab then
			local active_tab = self.tabs[self.active_tab]
			
			active_tab.is_active = false
			active_tab.content_frame.Visible = false
			
			tween_service:Create(
				active_tab.tab.glowtop1,
				global_tween_info,
				{
					BackgroundTransparency = 1
				}
			):Play()
		end
		
		tab.is_active = true
		tab.content_frame.Visible = true
		
		tween_service:Create(
			tab.tab.glowtop1,
			global_tween_info,
			{
				BackgroundTransparency = 0.600
			}
		):Play()

		self.active_tab = index
	end
	
	function sidebar_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,tab in ipairs(self.tabs) do
			pcall(function()
				tab:_Destroy()
			end)
		end
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.menu_toggle then
			pcall(function()
				self.menu_toggle:_Destroy()
			end)
		end
		
		if self.search_bar then
			pcall(function()
				self.search_bar:_Destroy()
			end)
		end

		if self.sidebar then
			pcall(function()
				self.sidebar:Destroy()
			end)
		end
		
		self.tabs = nil
		self.connections = nil
		self.menu_toggle = nil
		self.search_bar = nil
		self.settings_tab = nil
		self.sidebar = nil
		self.tab_frame = nil
	end
	
	function sidebar_class:_CreateSidebar(parent)
		if self.sidebar then return end
		
		local sidebar = Instance.new("Frame")
		sidebar.Parent = parent
		sidebar.AnchorPoint = Vector2.new(0, 0.5)
		sidebar.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
		sidebar.BackgroundTransparency = 1.000
		sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sidebar.BorderSizePixel = 0
		sidebar.Position = UDim2.new(0, 10, 0.5, 0)
		sidebar.Size = UDim2.new(0, 34, 1, -20)
		sidebar.ClipsDescendants = true
		sidebar.ZIndex = 2
		
		local border = Instance.new("UIStroke")
		border.Parent = sidebar
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.CornerRadius = UDim.new(0, 5)
		corner_radius.Parent = sidebar
		
		sidebar.Destroying:Once(self._Destroy)
		
		local tab_frame = Instance.new("Frame")
		tab_frame.Name = "Content"
		tab_frame.Parent = sidebar
		tab_frame.AnchorPoint = Vector2.new(0, 0.5)
		tab_frame.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
		tab_frame.BackgroundTransparency = 1.000
		tab_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tab_frame.BorderSizePixel = 0
		tab_frame.Position = UDim2.new(0, 0, 0.5, 0)
		tab_frame.Size = UDim2.new(1, 0, 1, 0)

		local top_section = Instance.new("Frame")
		top_section.Name = "TopSection"
		top_section.Parent = tab_frame
		top_section.AnchorPoint = Vector2.new(0.5, 0)
		top_section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		top_section.BackgroundTransparency = 1.000
		top_section.BorderColor3 = Color3.fromRGB(0, 0, 0)
		top_section.BorderSizePixel = 0
		top_section.Position = UDim2.new(0.5, 0, 0, 0)
		top_section.Size = UDim2.new(1, 0, 0, 80)

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = top_section
		list_layout.Padding = UDim.new(0, 6)
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill

		local padding = Instance.new("UIPadding")
		padding.Parent = top_section
		padding.PaddingBottom = UDim.new(0, 5)
		padding.PaddingLeft = UDim.new(0, 5)
		padding.PaddingRight = UDim.new(0, 5)
		padding.PaddingTop = UDim.new(0, 5)

		local bottom_section = Instance.new("Frame")
		bottom_section.Name = "BottomSection"
		bottom_section.Parent = tab_frame
		bottom_section.AnchorPoint = Vector2.new(0.5, 1)
		bottom_section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		bottom_section.BackgroundTransparency = 1.000
		bottom_section.BorderColor3 = Color3.fromRGB(0, 0, 0)
		bottom_section.BorderSizePixel = 0
		bottom_section.Position = UDim2.new(0.5, 0, 1, 0)
		bottom_section.Size = UDim2.new(1, 0, 0, 40)

		local list_layout_2 = Instance.new("UIListLayout")
		list_layout_2.Parent = bottom_section
		list_layout_2.Padding = UDim.new(0, 6)
		list_layout_2.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout_2.HorizontalFlex = Enum.UIFlexAlignment.Fill
		list_layout_2.VerticalAlignment = Enum.VerticalAlignment.Bottom

		local padding_2 = Instance.new("UIPadding")
		padding_2.Parent = bottom_section
		padding_2.PaddingBottom = UDim.new(0, 5)
		padding_2.PaddingLeft = UDim.new(0, 5)
		padding_2.PaddingRight = UDim.new(0, 5)
		padding_2.PaddingTop = UDim.new(0, 5)

		local center_section = Instance.new("ScrollingFrame")
		center_section.Name = "CenterSection"
		center_section.Parent = tab_frame
		center_section.AutomaticCanvasSize = Enum.AutomaticSize.Y
		center_section.Active = true
		center_section.AnchorPoint = Vector2.new(0.5, 1)
		center_section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		center_section.BackgroundTransparency = 1.000
		center_section.BorderColor3 = Color3.fromRGB(0, 0, 0)
		center_section.BorderSizePixel = 0
		center_section.Position = UDim2.new(0.5, 0, 1, -45)
		center_section.Size = UDim2.new(1, 0, 1, -130)
		center_section.ScrollBarImageTransparency = 1.000
		center_section.ScrollBarThickness = 0
		center_section.ScrollingDirection = Enum.ScrollingDirection.Y
		center_section.ScrollingEnabled = true

		local list_layout_3 = Instance.new("UIListLayout")
		list_layout_3.Parent = center_section
		list_layout_3.Padding = UDim.new(0, 8)
		list_layout_3.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout_3.HorizontalFlex = Enum.UIFlexAlignment.Fill

		local padding_3 = Instance.new("UIPadding")
		padding_3.Parent = center_section
		padding_3.PaddingBottom = UDim.new(0, 5)
		padding_3.PaddingLeft = UDim.new(0, 5)
		padding_3.PaddingRight = UDim.new(0, 5)
		padding_3.PaddingTop = UDim.new(0, 5)
		
		self.sidebar = sidebar
		self.tab_frame = tab_frame
	end
	
	function sidebar_class:_CreateSidebarContent(parent)
		if self.content_frame then return end
		if not self.sidebar then return end

		local content_frame = Instance.new("Frame")
		content_frame.Name = "ContentFrame"
		content_frame.Parent = parent
		content_frame.AnchorPoint = Vector2.new(1, 0.5)
		content_frame.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
		content_frame.BackgroundTransparency = 1.000
		content_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_frame.BorderSizePixel = 0
		content_frame.Position = UDim2.new(1, 0, 0.5, 0)
		content_frame.Size = UDim2.new(1, -55, 1, -20)

		self.content_frame = content_frame
	end
	
	function sidebar_class:_CreateMenuToggle()
		if self.menu_toggle then return end
		if not self.tab_frame then return end

		local new_tab = setmetatable({}, tab_class)
		new_tab.connections = table.create(8)

		new_tab:_CreateTab(
			self.tab_frame.TopSection,
			"",
			fui.icons.Menu
		)
		
		new_tab:SetClickCallback(function()
			if self.collapsed then
				self:Expand()
			else
				self:Collapse()
			end
		end)
		
		new_tab.tab.LayoutOrder = 0
		new_tab.tab.Icon.Size = UDim2.new(0, 24, 0, 24)
		new_tab.tab.glowtop1.Size = UDim2.new(0, 24, 0, 24)
		
		new_tab.tab.TabContent.NameLabel.Text = "Menu"
		
		new_tab._CreateTab = nil
		new_tab._CreateTabContent = nil
		self.menu_toggle = new_tab
	end
	
	function sidebar_class:_CreateSearchBar()
		if self.search_bar then return end
		if not self.tab_frame then return end

		local new_tab = setmetatable({}, tab_class)
		new_tab.connections = table.create(8)

		new_tab:_CreateTab(
			self.tab_frame.TopSection,
			"",
			fui.icons.Search
		)
		new_tab.tab.LayoutOrder = 1
		new_tab.tab.TabContent.NameLabel:Destroy()
		new_tab.tab.TabContent.UIPadding.PaddingBottom = UDim.new(0, 4)
		new_tab.tab.TabContent.UIPadding.PaddingLeft = UDim.new(0, 4)
		new_tab.tab.TabContent.UIPadding.PaddingRight = UDim.new(0, 4)
		new_tab.tab.TabContent.UIPadding.PaddingTop = UDim.new(0, 4)
		
		local container = Instance.new("Frame")
		container.Name = "Container"
		container.Parent = new_tab.tab.TabContent
		container.AnchorPoint = Vector2.new(0.5, 0.5)
		container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		container.BackgroundTransparency = 0.300
		container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		container.BorderSizePixel = 0
		container.Position = UDim2.new(0.5, 0, 0.5, 0)
		container.Size = UDim2.new(1, 0, 1, 0)
		
		local gradient = Instance.new("UIGradient")
		gradient.Parent = container
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(200,180,255)),ColorSequenceKeypoint.new(1, Color3.fromRGB(150,200,255))}
		gradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(1,0.9)}
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.CornerRadius = UDim.new(1, 0)
		corner_radius.Parent = container
		
		local padding = Instance.new("UIPadding")
		padding.Parent = container
		padding.PaddingBottom = UDim.new(0, 0)
		padding.PaddingLeft = UDim.new(0, 12)
		padding.PaddingRight = UDim.new(0, 12)
		padding.PaddingTop = UDim.new(0, 0)
		
		local searchbar = Instance.new("TextBox")
		searchbar.Parent = container
		searchbar.AnchorPoint = Vector2.new(0.5, 0.5)
		searchbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		searchbar.BackgroundTransparency = 1.000
		searchbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		searchbar.BorderSizePixel = 0
		searchbar.ClearTextOnFocus = false
		searchbar.Position = UDim2.new(0.5, 0, 0.5, 0)
		searchbar.Size = UDim2.new(1, 0, 1, 0)
		searchbar.ClipsDescendants = true
		searchbar.Font = "Montserrat"
		searchbar.FontFace.Weight = Enum.FontWeight.Medium
		searchbar.PlaceholderText = "Search"
		searchbar.PlaceholderColor3 = Color3.fromRGB(200, 180, 200)
		searchbar.Text = ""
		searchbar.TextColor3 = Color3.fromRGB(200, 180, 200)
		searchbar.TextSize = 14.000
		searchbar.TextXAlignment = Enum.TextXAlignment.Left
		
		new_tab:SetClickCallback(function()
			if self.collapsed then
				self:Expand()
			end
			
			searchbar:CaptureFocus()
		end)
		
		self:_TrackConnection(searchbar:GetPropertyChangedSignal("Text"):Connect(function()
			local query = searchbar.Text:lower()

			for idx, tab in ipairs(self.tabs) do
				local tab_name = (tab.tab.TabContent.NameLabel and tab.tab.TabContent.NameLabel.Text or ""):lower()

				if tab_name:find(query) then
					tab.tab.Visible = true
				else
					tab.tab.Visible = false
				end
			end
		end))

		new_tab._CreateTab = nil
		new_tab._CreateTabContent = nil
		self.search_bar = new_tab
	end
	
	function sidebar_class:_CreateSettingsTab()
		if self.settings_tab then return end
		if not self.tab_frame then return end

		local new_tab = self:CreateTab("Settings", fui.icons.Settings)

		new_tab.tab.Parent = self.tab_frame.BottomSection
		new_tab.tab.LayoutOrder = 0
		
		self.settings_tab = new_tab
	end
end

local region_class = table.create(8)
region_class.__index = region_class
setmetatable(region_class, { __index = container_base })

do
	function region_class:GetContainer()
		return self.content_frame
	end

	function region_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end

	function region_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.region then
			pcall(function()
				self.region:Destroy()
			end)
		end

		self.connections = nil
		self.region = nil
	end
	
	function region_class:_CreateRegion(parent, config)
		if self.region then return end
		
		local class = config.Scroll and "ScrollingFrame" or "Frame"
		local region = Instance.new(class)
		region.Name = config.Scroll and "ScrollingCanvas" or "Canvas"
		region.Parent = parent
		region.Active = true
		region.AutomaticSize = config.AutomaticSize
		region.BackgroundColor3 = Color3.new(255, 255, 255)
		region.BackgroundTransparency = 1.000
		region.BorderColor3 = Color3.fromRGB(0, 0, 0)
		region.BorderSizePixel = 0
		region.ClipsDescendants = true
		
		region.Destroying:Once(self._Destroy)
		
		if class == "ScrollingFrame" then
			region.ElasticBehavior = Enum.ElasticBehavior.Never
			region.ScrollBarImageColor3 = Color3.fromRGB(82, 79, 104)
			region.ScrollBarImageTransparency = 0.300
			region.ScrollBarThickness = 5
		end
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Name = "CornerRadius"
		corner_radius.Parent = region
		corner_radius.CornerRadius = config.CornerRadius
		
		if not config.Border then
			self.region = region
			return
		end
		
		local border = Instance.new("UIStroke")
		border.Parent = region
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
		
		self.region = region
	end
	
	function region_class:_CreateRegionContent()
		if self.content_frame then return end
		if not self.region then return end
		
		local content_frame = Instance.new("Frame")
		content_frame.Name = "ContentFrame"
		content_frame.Parent = self.region
		content_frame.AnchorPoint = Vector2.new(0.5, 0.5)
		content_frame.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
		content_frame.BackgroundTransparency = 1.000
		content_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_frame.BorderSizePixel = 0
		content_frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		content_frame.Size = UDim2.new(1, 0, 1, 0)
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = content_frame
		list_layout.Padding = UDim.new(0, 4)
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder

		local padding = Instance.new("UIPadding")
		padding.Parent = content_frame
		padding.PaddingBottom = UDim.new(0, 8)
		padding.PaddingLeft = UDim.new(0, 8)
		padding.PaddingRight = UDim.new(0, 8)
		padding.PaddingTop = UDim.new(0, 8)

		self.content_frame = content_frame
	end
end

local label_class = table.create(8)
label_class.__index = label_class

do
	function label_class:SetText(text)
		self.label.Text = text
		return self
	end
	
	function label_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		if self.label then
			pcall(function()
				self.label:Destroy()
			end)
		end

		self.label = nil
	end
	
	function label_class:_CreateLabel(parent, config)
		if self.label then return end
		
		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Parent = parent
		label.AutomaticSize = Enum.AutomaticSize.XY
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1.000
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.Font = config.Font
		label.FontFace.Weight = config.Weight
		label.Text = config.Text
		label.TextSize = config.TextSize
		label.TextColor3 = Color3.fromRGB(200, 180, 200)
		label.TextXAlignment = config.TextXAlignment
		label.TextYAlignment = config.TextYAlignment
		
		label.Destroying:Once(self._Destroy)
		
		local padding = Instance.new("UIPadding")
		padding.Parent = label
		padding.PaddingBottom = config.Padding
		padding.PaddingLeft = config.Padding
		padding.PaddingRight = config.Padding
		padding.PaddingTop = config.Padding
		
		self.label = label
	end
end

local console_class = table.create(8)
console_class.__index = console_class

do
	function console_class:SetValue(text)
		local source = self.console.Source
		source.Text = text
		return self
	end
	
	function console_class:AppendText(text)
		local source = self.console.Source
		source.Text = source.Text..(source.Text ~= '' and '\n' or '')..text
		return self
	end
	
	function console_class:Clear()
		local source = self.console.Source
		source.Text = ""
		return self
	end

	function console_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		if self.label then
			pcall(function()
				self.label:Destroy()
			end)
		end

		self.label = nil
	end
	
	function console_class:_SourceChanged(prop)
		if prop ~= "Text" then return end
		wait()
		
		if self.callback then self.callback() end
		if self.auto_scroll then self:_ScrollToBottom() end
	end
	
	function console_class:_ScrollToBottom()
		if not self.console then return end
		self.console.CanvasPosition = Vector2.new(0, self.console.CanvasSize.Y.Offset - self.console.AbsoluteSize.Y)
	end

	function console_class:_CreateConsole(parent, config)
		if self.console then return end

		local console = Instance.new("ScrollingFrame")
		console.Name = "Console"
		console.Parent = parent
		console.Active = true
		console.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		console.BackgroundTransparency = 0.300
		console.BorderColor3 = Color3.fromRGB(0, 0, 0)
		console.BorderSizePixel = 0
		console.Size = UDim2.new(1, 0, 0, 150)
		console.AutomaticCanvasSize = Enum.AutomaticSize.Y
		console.CanvasSize = UDim2.new(0, 0, 0, 0)
		console.ElasticBehavior = Enum.ElasticBehavior.Never
		console.ScrollBarImageColor3 = Color3.fromRGB(26, 25, 33)
		console.ScrollBarImageTransparency = 0.300
		console.ScrollBarThickness = 1
		
		console.Destroying:Once(self._Destroy)
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = console
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Name = "CornerRadius"
		corner_radius.Parent = console
		corner_radius.CornerRadius = config.CornerRadius
		
		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 30, 41)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(25, 23, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 30, 41))}
		gradient.Parent = console
		
		local source = Instance.new("TextBox")
		source.Name = "Source"
		source.Parent = console
		source.AutomaticSize = Enum.AutomaticSize.Y
		source.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		source.BackgroundTransparency = 1.000
		source.BorderColor3 = Color3.fromRGB(0, 0, 0)
		source.BorderSizePixel = 0
		source.ClearTextOnFocus = false
		source.LayoutOrder = 2
		source.MultiLine = true
		source.Size = UDim2.new(1, 0, 0, 0)
		source.TextEditable = not config.ReadOnly
		source.ZIndex = 13
		source.FontFace = Font.fromName("Inconsolata")
		source.FontFace.Weight = Enum.FontWeight.Regular
		source.RichText = config.RichText
		source.Text = config.Value
		source.TextSize = 14.000
		source.TextColor3 = Color3.fromRGB(200, 180, 200)
		source.TextWrapped = config.TextWrapped
		source.TextXAlignment = Enum.TextXAlignment.Left
		source.TextYAlignment = Enum.TextYAlignment.Top
		
		source.Changed:Once(self._SourceChanged)
		
		local list_layout_2 = Instance.new("UIListLayout")
		list_layout_2.Parent = source
		list_layout_2.SortOrder = Enum.SortOrder.LayoutOrder
		
		local padding = Instance.new("UIPadding")
		padding.Parent = source
		padding.PaddingBottom = UDim.new(0, 5)
		padding.PaddingLeft = UDim.new(0, 5)
		padding.PaddingRight = UDim.new(0, 5)
		padding.PaddingTop = UDim.new(0, 5)
		
		local highlight = Instance.new("TextBox")
		highlight.Name = "Highlight"
		highlight.Parent = source
		highlight.Active = false
		highlight.AutomaticSize = Enum.AutomaticSize.Y
		highlight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		highlight.BackgroundTransparency = 1.000
		highlight.BorderColor3 = Color3.fromRGB(0, 0, 0)
		highlight.BorderSizePixel = 0
		highlight.ClearTextOnFocus = false
		highlight.Interactable = false
		highlight.LayoutOrder = 2
		highlight.MultiLine = true
		highlight.Size = UDim2.new(1, 0, 0, 0)
		highlight.TextEditable = false
		highlight.ZIndex = 13
		highlight.Selectable = false
		highlight.FontFace = Font.fromName("Inconsolata")
		highlight.FontFace.Weight = Enum.FontWeight.Regular
		highlight.RichText = config.RichText
		highlight.Text = ""
		highlight.TextColor3 = Color3.fromRGB(255, 255, 255)
		highlight.TextSize = 14
		highlight.TextXAlignment = Enum.TextXAlignment.Left
		highlight.TextYAlignment = Enum.TextYAlignment.Top
		
		local highlight_line = Instance.new("TextLabel")
		highlight_line.Name = "HighlightLine"
		highlight_line.Parent = source
		highlight_line.AutomaticSize = Enum.AutomaticSize.Y
		highlight_line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		highlight_line.BackgroundTransparency = 1.000
		highlight_line.Interactable = false
		highlight_line.LayoutOrder = 2
		highlight_line.Size = UDim2.new(1, 0, 0, 0)
		highlight_line.ZIndex = 13
		highlight_line.FontFace = Font.fromName("Inconsolata")
		highlight_line.FontFace.Weight = Enum.FontWeight.Regular
		highlight_line.RichText = config.RichText
		highlight_line.Text = ""
		highlight_line.TextColor3 = Color3.fromRGB(255, 255, 255)
		highlight_line.TextSize = 14
		highlight_line.TextWrapped = config.TextWrapped
		highlight_line.TextXAlignment = Enum.TextXAlignment.Left
		highlight_line.TextYAlignment = Enum.TextYAlignment.Top

		self.console = console
		self.callback = config.Callback
		self.auto_scroll = config.AutoScroll
	end
	
	function console_class:_CreateConsoleBorder()
		if not self.console then return end
		
		local border = Instance.new("UIStroke")
		border.Parent = self.console
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
	end
	
	function console_class:_CreateConsoleLines()
		if not self.console then return end
		
		local lines = Instance.new("TextLabel")
		lines.Name = "Lines"
		lines.Parent = self.console
		lines.AutomaticSize = Enum.AutomaticSize.XY
		lines.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		lines.BackgroundTransparency = 1.000
		lines.BorderColor3 = Color3.fromRGB(0, 0, 0)
		lines.BorderSizePixel = 0
		lines.LayoutOrder = 1
		lines.ZIndex = 14
		lines.FontFace = Font.fromName("Inconsolata")
		lines.FontFace.Weight = Enum.FontWeight.Regular
		lines.Text = "1"
		lines.TextColor3 = Color3.fromRGB(255, 255, 255)
		lines.TextSize = 14
		lines.TextXAlignment = Enum.TextXAlignment.Left
		lines.TextYAlignment = Enum.TextYAlignment.Top

		local padding_2 = Instance.new("UIPadding")
		padding_2.Parent = lines
		padding_2.PaddingBottom = UDim.new(0, 5)
		padding_2.PaddingLeft = UDim.new(0, 5)
		padding_2.PaddingRight = UDim.new(0, 5)
		padding_2.PaddingTop = UDim.new(0, 5)

		local flex_item = Instance.new("UIFlexItem")
		flex_item.Parent = lines
	end
end

local sliderfloat_class = table.create(8)
sliderfloat_class.__index = sliderfloat_class

do
	function sliderfloat_class:SetValue(value)
		local precision = tonumber(self.format:match("%%%.(%d)f"))
		local multiplier = 10 ^ precision
		local rounded = math.floor(value * multiplier + 0.5) / multiplier
		
		if self.callback and rounded ~= self.value then
			self:callback(rounded)
		end

		self.raw_value = rounded
		self.value = tostring(rounded)
		self.track.Value.Text = self.value
		
		self.grab.Position = UDim2.new(0, self:_GetSliderOffset(), 0.5, 0)
		
		return self
	end
	
	function sliderfloat_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end
	
	function sliderfloat_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.sliderfloat then
			pcall(function()
				self.sliderfloat:Destroy()
			end)
		end

		self.connections = nil
		self.sliderfloat = nil
	end
	
	function sliderfloat_class:_Update(input)
		local mouse_x = input.Position.X
		local value, offset = self:_GetValueFromMouse(mouse_x)
		
		local precision = tonumber(self.format:match("%%%.(%d)f"))
		local multiplier = 10 ^ precision
		local rounded = math.floor(value * multiplier + 0.5) / multiplier
		
		if self.callback and rounded ~= self.value then
			self:callback(rounded)
		end
		
		self.raw_value = rounded
		self.value = tostring(rounded)
		self.track.Value.Text = self.value

		self.grab.Position = UDim2.new(0, offset, 0.5, 0)
	end
	
	function sliderfloat_class:_GetValueFromMouse(mouse_x)
		local min = self.min or 0
		local max = self.max or 100

		local track_pos = self.track.AbsolutePosition.X
		local track_width = self.track.AbsoluteSize.X
		local grab_width = self.grab.AbsoluteSize.X
		local anchor_x = self.grab.AnchorPoint.X

		if track_width <= 0 then
			return min, 0
		end

		local min_bound = grab_width * anchor_x
		local max_bound = track_width - grab_width

		local relative = mouse_x - track_pos
		relative = math.clamp(relative, min_bound, max_bound)

		local alpha = (relative - min_bound) / (max_bound - min_bound)
		local value = min + (max - min) * alpha

		return value, relative
	end
	
	function sliderfloat_class:_GetSliderOffset()
		local value = self.raw_value

		local min = self.min or 0
		local max = self.max or 100

		local track_width = self.track.AbsoluteSize.X
		local grab_width = self.grab.AbsoluteSize.X
		local anchor_x = self.grab.AnchorPoint.X

		if track_width <= 0 then
			return 0
		end

		local min_bound = grab_width * anchor_x
		local max_bound = track_width - grab_width / anchor_x

		local alpha = (value - min) / (max - min)
		alpha = math.clamp(alpha, 0, 1)

		local relative = min_bound + (max_bound - min_bound) * alpha

		return relative
	end
	
	function sliderfloat_class:_CreateSliderFloat(parent, config)
		if self.sliderfloat then return end
		self.min = config.Minimum
		self.max = config.Maximum
		self.format = config.Format
		self.raw_value = config.Value
		self.value = string.format(config.Format, config.Value)
		self.callback = config.Callback
		
		local sliderfloat = Instance.new("Frame")
		sliderfloat.Name = "SliderFloat"
		sliderfloat.Parent = parent
		sliderfloat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		sliderfloat.BackgroundTransparency = 1.000
		sliderfloat.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sliderfloat.BorderSizePixel = 0
		sliderfloat.Size = UDim2.new(1, 0, 0, 20)
		
		sliderfloat.Destroying:Once(self._Destroy)
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = sliderfloat
		list_layout.Padding = UDim.new(0, 4)
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill
		
		local track = Instance.new("TextButton")
		track.Name = "Track"
		track.Parent = sliderfloat
		track.AutoButtonColor = false
		track.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		track.BackgroundTransparency = 0.300
		track.BorderColor3 = Color3.fromRGB(0, 0, 0)
		track.BorderSizePixel = 0
		track.Size = UDim2.new(0.5, 0, 1, 0)
		track.Font = "Montserrat"
		track.FontFace.Weight = Enum.FontWeight.Medium
		track.Text = ""
		track.TextTransparency = 1
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = track
		corner_radius.CornerRadius = UDim.new(0, 2)
		
		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 30, 41)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(25, 23, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 30, 41))}
		gradient.Parent = track
		
		local padding = Instance.new("UIPadding")
		padding.Parent = track
		padding.PaddingBottom = UDim.new(0, 2)
		padding.PaddingLeft = UDim.new(0, 2)
		padding.PaddingRight = UDim.new(0, 2)
		padding.PaddingTop = UDim.new(0, 2)
		
		local border = Instance.new("UIStroke")
		border.Parent = track
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
		
		local value = Instance.new("TextLabel")
		value.Name = "Value"
		value.Parent = track
		value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		value.BackgroundTransparency = 1
		value.BorderColor3 = Color3.fromRGB(0, 0, 0)
		value.BorderSizePixel = 0
		value.Size = UDim2.new(1, 0, 1, 0)
		value.ZIndex = 2
		value.ClipsDescendants = true
		value.Font = "Montserrat"
		value.FontFace.Weight = Enum.FontWeight.Medium
		value.Text = self.value
		value.TextColor3 = Color3.fromRGB(200, 180, 200)
		value.TextSize = 14
		
		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Parent = sliderfloat
		label.AutomaticSize = Enum.AutomaticSize.XY
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.LayoutOrder = 1
		label.Size = UDim2.new(0, 5, 0, 5)
		label.Font = "Montserrat"
		label.FontFace.Weight = Enum.FontWeight.Medium
		label.Text = config.Label
		label.TextColor3 = Color3.fromRGB(200, 180, 200)
		label.TextSize = 14
		label.TextXAlignment = Enum.TextXAlignment.Left
		
		self:_TrackConnection(track.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			
			self.dragging = true
			self:_Update(input)
		end))
		
		self:_TrackConnection(track.MouseEnter:Connect(function()
			if not self.grab then return end
			
			tween_service:Create(
				self.grab,
				global_tween_info,
				{
					BackgroundTransparency = 0
				}
			):Play()
		end))
		
		self:_TrackConnection(track.MouseLeave:Connect(function()
			if not self.grab then return end

			tween_service:Create(
				self.grab,
				global_tween_info,
				{
					BackgroundTransparency = 0.300
				}
			):Play()
		end))
		
		self:_TrackConnection(userinput_service.InputChanged:Connect(function(input)
			if not self.dragging or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
			self:_Update(input)
		end))
		
		self:_TrackConnection(userinput_service.InputEnded:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			self.dragging = false
		end))
		
		self.sliderfloat = sliderfloat
		self.track = track
	end
	
	function sliderfloat_class:_CreateSliderGrab()
		if self.grab then return end
		if not self.sliderfloat then return end
		
		local overlay = Instance.new("Frame")
		overlay.Name = "Overlay"
		overlay.Parent = self.track
		overlay.AnchorPoint = Vector2.new(0.5, 0.5)
		overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		overlay.BackgroundTransparency = 1
		overlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
		overlay.BorderSizePixel = 0
		overlay.Position = UDim2.new(0.5, 0, 0.5, 0)
		overlay.Size = UDim2.new(1, 0, 1, 8)
		overlay.ClipsDescendants = true
		
		local grab = Instance.new("Frame")
		grab.Name = "Grab"
		grab.Parent = overlay
		grab.AnchorPoint = Vector2.new(0.5, 0.5)
		grab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		grab.BackgroundTransparency = 0.300
		grab.BorderSizePixel = 0
		grab.Position = UDim2.new(0, 0, 0.5, 0)
		grab.Size = UDim2.new(0, 10, 1, -8)
		
		local border = Instance.new("UIStroke")
		border.Parent = grab
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(233, 173, 234)
		border.Transparency = 0.800
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = grab
		corner_radius.CornerRadius = UDim.new(0, 2)
		
		local gradient = Instance.new("UIGradient")
		gradient.Parent = grab
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(233, 173, 234))}
		
		local constraint = Instance.new("UISizeConstraint")
		constraint.MaxSize = Vector2.new(math.huge, math.huge)
		constraint.MinSize = Vector2.new(10, 0)
		
		local glowbottom = Instance.new("ImageLabel")
		glowbottom.Name = "glowbottom"
		glowbottom.Parent = grab
		glowbottom.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom.BackgroundTransparency = 1.000
		glowbottom.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom.BorderSizePixel = 0
		glowbottom.Position = UDim2.new(0.5, 0, 1, 4)
		glowbottom.Size = UDim2.new(1, 50, 0, 4)
		glowbottom.ZIndex = 4
		glowbottom.Image = "rbxassetid://76150694119616"
		
		local gradient_2 = Instance.new("UIGradient")
		gradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(144, 98, 135)), ColorSequenceKeypoint.new(0.28, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 173, 234)), ColorSequenceKeypoint.new(0.72, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 98, 135))}
		gradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.03, 0.86), NumberSequenceKeypoint.new(0.06, 0.69), NumberSequenceKeypoint.new(0.11, 0.53), NumberSequenceKeypoint.new(0.15, 0.43), NumberSequenceKeypoint.new(0.20, 0.31), NumberSequenceKeypoint.new(0.27, 0.18), NumberSequenceKeypoint.new(0.33, 0.09), NumberSequenceKeypoint.new(0.39, 0.04), NumberSequenceKeypoint.new(0.45, 0.01), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.56, 0.01), NumberSequenceKeypoint.new(0.61, 0.04), NumberSequenceKeypoint.new(0.67, 0.11), NumberSequenceKeypoint.new(0.73, 0.21), NumberSequenceKeypoint.new(0.78, 0.34), NumberSequenceKeypoint.new(0.86, 0.52), NumberSequenceKeypoint.new(0.93, 0.72), NumberSequenceKeypoint.new(1.00, 1.00)}
		gradient_2.Parent = glowbottom
		
		local glowbottom_2 = Instance.new("ImageLabel")
		glowbottom_2.Name = "glowbottom_2"
		glowbottom_2.Parent = grab
		glowbottom_2.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom_2.BackgroundTransparency = 1.000
		glowbottom_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom_2.BorderSizePixel = 0
		glowbottom_2.Position = UDim2.new(0.5, 0, 1, 4)
		glowbottom_2.Size = UDim2.new(1, 50, 0, 4)
		glowbottom_2.ZIndex = 4
		glowbottom_2.Image = "rbxassetid://76150694119616"
		
		local gradient_3 = Instance.new("UIGradient")
		gradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(144, 98, 135)), ColorSequenceKeypoint.new(0.28, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 173, 234)), ColorSequenceKeypoint.new(0.72, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 98, 135))}
		gradient_3.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.03, 0.86), NumberSequenceKeypoint.new(0.06, 0.69), NumberSequenceKeypoint.new(0.11, 0.53), NumberSequenceKeypoint.new(0.15, 0.43), NumberSequenceKeypoint.new(0.20, 0.31), NumberSequenceKeypoint.new(0.27, 0.18), NumberSequenceKeypoint.new(0.33, 0.09), NumberSequenceKeypoint.new(0.39, 0.04), NumberSequenceKeypoint.new(0.45, 0.01), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(0.56, 0.01), NumberSequenceKeypoint.new(0.61, 0.04), NumberSequenceKeypoint.new(0.67, 0.11), NumberSequenceKeypoint.new(0.73, 0.21), NumberSequenceKeypoint.new(0.78, 0.34), NumberSequenceKeypoint.new(0.86, 0.52), NumberSequenceKeypoint.new(0.93, 0.72), NumberSequenceKeypoint.new(1.00, 1.00)}
		gradient_3.Parent = glowbottom_2
		
		local glowbottom_3 = Instance.new("ImageLabel")
		glowbottom_3.Name = "glowbottom_3"
		glowbottom_3.Parent = grab
		glowbottom_3.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom_3.BackgroundTransparency = 1.000
		glowbottom_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom_3.BorderSizePixel = 0
		glowbottom_3.Position = UDim2.new(0.5, 0, 1, 4)
		glowbottom_3.Size = UDim2.new(1, 50, 0, 4)
		glowbottom_3.ZIndex = 4
		glowbottom_3.Image = "rbxassetid://76150694119616"
		
		local gradient_4 = Instance.new("UIGradient")
		gradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(144, 98, 135)), ColorSequenceKeypoint.new(0.28, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 173, 234)), ColorSequenceKeypoint.new(0.72, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 98, 135))}
		gradient_4.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
		gradient_4.Parent = glowbottom_3
		
		local glowbottom_4 = Instance.new("ImageLabel")
		glowbottom_4.Name = "glowbottom_4"
		glowbottom_4.Parent = grab
		glowbottom_4.AnchorPoint = Vector2.new(0.5, 1)
		glowbottom_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowbottom_4.BackgroundTransparency = 1.000
		glowbottom_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowbottom_4.BorderSizePixel = 0
		glowbottom_4.Position = UDim2.new(0.5, 0, 1, 4)
		glowbottom_4.Size = UDim2.new(1, 50, 0, 4)
		glowbottom_4.ZIndex = 4
		glowbottom_4.Image = "rbxassetid://76150694119616"
		
		local gradient_5 = Instance.new("UIGradient")
		gradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(144, 98, 135)), ColorSequenceKeypoint.new(0.28, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 173, 234)), ColorSequenceKeypoint.new(0.72, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 98, 135))}
		gradient_5.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.50, 0.00), NumberSequenceKeypoint.new(1.00, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
		gradient_5.Parent = glowbottom_4
		
		task.defer(function()
			grab.Position = UDim2.new(0, self:_GetSliderOffset(), 0.5, 0)
		end)
			
		self.grab = grab
	end
end

local checkbox_class = table.create(8)
checkbox_class.__index = checkbox_class

do
	function checkbox_class:SetValue(value)
		self:_ChangeValue(value)
		return self	
	end
	
	function checkbox_class:Toggle()
		self:_ChangeValue(not self.value)
		return self	
	end
	
	function checkbox_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end

	function checkbox_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.checkbox then
			pcall(function()
				self.checkbox:Destroy()
			end)
		end

		self.connections = nil
		self.checkbox = nil
	end
	
	function checkbox_class:_ChangeValue(value)
		if value == self.value then return end
		if not self.tick then return end
		
		if value then
			tween_service:Create(
				self.tick,
				global_tween_info,
				{
					BackgroundTransparency = 0.300,
					Size = UDim2.new(1, 0, 1, 0)
				}
			):Play()

			tween_service:Create(
				self.tick.UICorner,
				global_tween_info,
				{
					CornerRadius = UDim.new(0, 2)
				}
			):Play()
			
			tween_service:Create(
				self.tick.UIStroke,
				global_tween_info,
				{
					Transparency = 0.8
				}
			):Play()
			
			tween_service:Create(
				self.tick.glowtop,
				global_tween_info,
				{
					ImageTransparency = 0
				}
			):Play()

			tween_service:Create(
				self.tick.glowtop_2,
				global_tween_info,
				{
					ImageTransparency = 0
				}
			):Play()
		else
			tween_service:Create(
				self.tick,
				global_tween_info,
				{
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 0)
				}
			):Play()

			tween_service:Create(
				self.tick.UICorner,
				global_tween_info,
				{
					CornerRadius = UDim.new(1, 0)
				}
			):Play()
			
			tween_service:Create(
				self.tick.UIStroke,
				global_tween_info,
				{
					Transparency = 1
				}
			):Play()
			
			tween_service:Create(
				self.tick.glowtop,
				global_tween_info,
				{
					ImageTransparency = 1
				}
			):Play()
			
			tween_service:Create(
				self.tick.glowtop_2,
				global_tween_info,
				{
					ImageTransparency = 1
				}
			):Play()
		end
		
		if self.callback then
			self:callback(value)
		end
		
		self.value = value
	end
	
	function checkbox_class:_CreateCheckbox(parent, config)
		if self.checkbox then return end
		self.value = config.Value
		self.callback = config.Callback
		
		local checkbox = Instance.new("TextButton")
		checkbox.Name = "Checkbox"
		checkbox.Parent = parent
		checkbox.AutoButtonColor = false
		checkbox.AutomaticSize = Enum.AutomaticSize.XY
		checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		checkbox.BackgroundTransparency = 1.000
		checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		checkbox.BorderSizePixel = 0
		checkbox.Size = UDim2.new(0, 10, 0, 0)
		checkbox.Text = ""
		checkbox.TextTransparency = 1
		
		checkbox.Destroying:Once(self._Destroy)
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = checkbox
		list_layout.Padding = UDim.new(0, 5)
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		
		local tickbox = Instance.new("ImageButton")
		tickbox.Name = "Tickbox"
		tickbox.Parent = checkbox
		tickbox.AutoButtonColor = false
		tickbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tickbox.BackgroundTransparency = 0.300
		tickbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tickbox.BorderSizePixel = 0
		tickbox.Size = UDim2.new(0, 20, 0, 20)
		tickbox.Image = ""
		tickbox.Selectable = false
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = tickbox
		corner_radius.CornerRadius = UDim.new(0, 5)
		
		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 30, 41)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(25, 23, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 30, 41))}
		gradient.Parent = tickbox
		
		local padding = Instance.new("UIPadding")
		padding.Parent = tickbox
		padding.PaddingBottom = UDim.new(0, 3)
		padding.PaddingLeft = UDim.new(0, 3)
		padding.PaddingRight = UDim.new(0, 3)
		padding.PaddingTop = UDim.new(0, 3)

		local border = Instance.new("UIStroke")
		border.Parent = tickbox
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
		
		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Parent = checkbox
		label.AutomaticSize = Enum.AutomaticSize.XY
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.LayoutOrder = 1
		label.Size = UDim2.new(0, 5, 0, 5)
		label.Font = "Montserrat"
		label.FontFace.Weight = Enum.FontWeight.Medium
		label.Text = config.Label
		label.TextColor3 = Color3.fromRGB(200, 180, 200)
		label.TextSize = 14
		label.TextXAlignment = Enum.TextXAlignment.Left
		
		self:_TrackConnection(tickbox.MouseEnter:Connect(function()
			if not self.tick then return end

			tween_service:Create(
				self.tick,
				global_tween_info,
				{
					BackgroundTransparency = 0
				}
			):Play()
		end))

		self:_TrackConnection(tickbox.MouseLeave:Connect(function()
			if not self.tick then return end

			tween_service:Create(
				self.tick,
				global_tween_info,
				{
					BackgroundTransparency = 0.300
				}
			):Play()
		end))
		
		self:_TrackConnection(tickbox.MouseButton1Click:Connect(function()
			if not self.tick then return end

			self:Toggle()
		end))
		
		self.checkbox = checkbox
	end
	
	function checkbox_class:_CreateTick()
		if self.tick then return end
		if not self.checkbox then return end
		
		local tick_img = Instance.new("Frame")
		tick_img.Name = "Tick"
		tick_img.Parent = self.checkbox.Tickbox
		tick_img.AnchorPoint = Vector2.new(0.5, 0.5)
		tick_img.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tick_img.BackgroundTransparency = 0.300
		tick_img.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tick_img.BorderSizePixel = 0
		tick_img.Interactable = false
		tick_img.LayoutOrder = 1
		tick_img.Position = UDim2.new(0.5, 0, 0.5, 0)
		tick_img.Size = UDim2.new(1, 0, 1, 0)
		
		local border = Instance.new("UIStroke")
		border.Parent = tick_img
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(233, 173, 234)
		border.Transparency = 0.800

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = tick_img
		corner_radius.CornerRadius = UDim.new(0, 2)

		local gradient = Instance.new("UIGradient")
		gradient.Parent = tick_img
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(233, 173, 234))}
		
		local glowtop = Instance.new("ImageLabel")
		glowtop.Name = "glowtop"
		glowtop.Parent = tick_img
		glowtop.AnchorPoint = Vector2.new(0.5, 0.5)
		glowtop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowtop.BackgroundTransparency = 1.000
		glowtop.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowtop.BorderSizePixel = 0
		glowtop.Position = UDim2.new(0.5, 0, 0.5, 0)
		glowtop.Size = UDim2.new(1, 10, 1, 10)
		glowtop.ZIndex = 4
		glowtop.Image = "rbxassetid://76150694119616"
		
		local gradient_2 = Instance.new("UIGradient")
		gradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_2.Parent = glowtop
		
		local corner_radius_2 = Instance.new("UICorner")
		corner_radius_2.Parent = glowtop
		
		local glowtop_2 = Instance.new("ImageLabel")
		glowtop_2.Name = "glowtop_2"
		glowtop_2.Parent = tick_img
		glowtop_2.AnchorPoint = Vector2.new(0.5, 0.5)
		glowtop_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glowtop_2.BackgroundTransparency = 1.000
		glowtop_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glowtop_2.BorderSizePixel = 0
		glowtop_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		glowtop_2.Size = UDim2.new(1, 10, 1, 10)
		glowtop_2.ZIndex = 4
		glowtop_2.Image = "rbxassetid://76150694119616"
		
		local gradient_3 = Instance.new("UIGradient")
		gradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(134, 134, 147)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 142, 255)), ColorSequenceKeypoint.new(0.74, Color3.fromRGB(148, 189, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 147))}
		gradient_3.Parent = glowtop_2
		
		local corner_radius_3 = Instance.new("UICorner")
		corner_radius_3.Parent = glowtop_2
		
		self.tick = tick_img
	end
end

local button_class = table.create(8)
button_class.__index = button_class

do
	function button_class:SetClickCallback(callback)
		self.callback = callback
		return self
	end
	
	function button_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end

	function button_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.button then
			pcall(function()
				self.button:Destroy()
			end)
		end

		self.connections = nil
		self.button = nil
	end
	
	function button_class:_SetButtonStyle(style)
		if not self.button then return end
		self.style = string.lower(style)
		
		local gradient = self.button.UIGradient
		
		if self.style == "primary" then
			gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(144, 98, 135)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(223, 173, 234)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(144, 98, 135))}
			gradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.30), NumberSequenceKeypoint.new(1.00, 0.30)}
		elseif self.style == "secondary" then
			gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(223, 173, 234)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(125, 99, 134)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(189, 134, 185)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 173, 234))}
			gradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.80), NumberSequenceKeypoint.new(0.50, 0.60), NumberSequenceKeypoint.new(1.00, 0.80)}
		end
	end
	
	function button_class:_CreateButton(parent, config)
		if self.button then return end
		self.callback = config.Callback
		
		local button = Instance.new("TextButton")
		button.Name = "Button"
		button.Parent = parent
		button.AutoButtonColor = false
		button.AutomaticSize = Enum.AutomaticSize.XY
		button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		button.BackgroundTransparency = 0
		button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		button.BorderSizePixel = 0
		button.Size = UDim2.new(1, 0, 0, 20)
		button.Text = ""
		button.TextTransparency = 1
		
		button.Destroying:Once(self._Destroy)
		
		local border = Instance.new("UIStroke")
		border.Parent = button
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(123, 92, 126)
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = button
		corner_radius.CornerRadius = UDim.new(0, 2)
		
		local gradient = Instance.new("UIGradient")
		gradient.Parent = button
		gradient.Rotation = 90
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = button
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		
		local padding = Instance.new("UIPadding")
		padding.Parent = button
		padding.PaddingBottom = UDim.new(0, 3)
		padding.PaddingLeft = UDim.new(0, 4)
		padding.PaddingRight = UDim.new(0, 4)
		padding.PaddingTop = UDim.new(0, 3)
		
		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Parent = button
		label.AutomaticSize = Enum.AutomaticSize.XY
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.LayoutOrder = 1
		label.Size = UDim2.new(0, 5, 0, 5)
		label.Font = "Montserrat"
		label.FontFace.Weight = Enum.FontWeight.Medium
		label.Text = config.Text
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.TextSize = 12
		label.TextXAlignment = Enum.TextXAlignment.Left
		
		self:_TrackConnection(button.MouseEnter:Connect(function()
			if not self.button then return end

			tween_service:Create(
				self.button.UIStroke,
				global_tween_info,
				{
					Color = Color3.fromRGB(184, 138, 189)
				}
			):Play()
		end))

		self:_TrackConnection(button.MouseLeave:Connect(function()
			if not self.button then return end

			tween_service:Create(
				self.button.UIStroke,
				global_tween_info,
				{
					Color = Color3.fromRGB(123, 92, 126)
				}
			):Play()
		end))
		
		self:_TrackConnection(button.MouseButton1Down:Connect(function()
			if not self.button then return end

			tween_service:Create(
				self.button,
				global_tween_info,
				{
					BackgroundTransparency = 0.300
				}
			):Play()
		end))
		
		self:_TrackConnection(button.MouseButton1Up:Connect(function()
			if not self.button then return end

			tween_service:Create(
				self.button,
				global_tween_info,
				{
					BackgroundTransparency = 0
				}
			):Play()
		end))

		self:_TrackConnection(button.MouseButton1Click:Connect(function()
			if not self.button then return end

			if self.callback then
				self:callback()
			end
		end))
		
		self.button = button
	end
end

local keybind_class = table.create(8)
keybind_class.__index = keybind_class

do
	function keybind_class:SetValue(value)
		self.value = value
		self.keybind.Display.Value.Text = self:_GetStringForKeyCode(value)
		
		if self.callback then
			self:callback(value)
		end
		
		return self
	end
	
	function keybind_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end

	function keybind_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.keybind then
			pcall(function()
				self.keybind:Destroy()
			end)
		end

		self.connections = nil
		self.keybind = nil
	end
	
	function keybind_class:_GetStringForKeyCode(keycode)
		local text = keycode.Name
		text = text:gsub("Left", "L"):gsub("Right", "R"):gsub("Control", "Ctrl")
		return text
	end
	
	function keybind_class:_CreateKeybind(parent, config)
		if self.keybind then return end
		self.value = config.Value
		self.callback = config.Callback
		
		local keybind = Instance.new("Frame")
		keybind.Name = "Keybind"
		keybind.Parent = parent
		keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		keybind.BackgroundTransparency = 1.000
		keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
		keybind.BorderSizePixel = 0
		keybind.Size = UDim2.new(1, 0, 0, 20)

		keybind.Destroying:Once(self._Destroy)

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = keybind
		list_layout.Padding = UDim.new(0, 4)
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.None
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill
		
		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Parent = keybind
		label.AutomaticSize = Enum.AutomaticSize.XY
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.Size = UDim2.new(0, 5, 0, 5)
		label.Font = "Montserrat"
		label.FontFace.Weight = Enum.FontWeight.Medium
		label.Text = config.Label
		label.TextColor3 = Color3.fromRGB(200, 180, 200)
		label.TextSize = 14
		label.TextXAlignment = Enum.TextXAlignment.Left

		local display = Instance.new("TextButton")
		display.Name = "Display"
		display.Parent = keybind
		display.AutoButtonColor = false
		display.AutomaticSize = Enum.AutomaticSize.X
		display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		display.BackgroundTransparency = 0.300
		display.BorderColor3 = Color3.fromRGB(0, 0, 0)
		display.BorderSizePixel = 0
		display.LayoutOrder = 1
		display.Size = UDim2.new(0, 0, 1, 0)
		display.Text = ""
		display.TextTransparency = 1

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = display
		corner_radius.CornerRadius = UDim.new(0, 2)

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 30, 41)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(25, 23, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 30, 41))}
		gradient.Parent = display

		local padding = Instance.new("UIPadding")
		padding.Parent = display
		padding.PaddingBottom = UDim.new(0, 2)
		padding.PaddingLeft = UDim.new(0, 8)
		padding.PaddingRight = UDim.new(0, 8)
		padding.PaddingTop = UDim.new(0, 2)

		local border = Instance.new("UIStroke")
		border.Parent = display
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
		
		local value = Instance.new("TextLabel")
		value.Name = "Value"
		value.Parent = display
		value.AutomaticSize = Enum.AutomaticSize.X
		value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		value.BackgroundTransparency = 1
		value.BorderColor3 = Color3.fromRGB(0, 0, 0)
		value.BorderSizePixel = 0
		value.Size = UDim2.new(0, 0, 1, 0)
		value.ZIndex = 2
		value.ClipsDescendants = true
		value.Font = "Montserrat"
		value.FontFace.Weight = Enum.FontWeight.Medium
		value.Text = self:_GetStringForKeyCode(self.value)
		value.TextColor3 = Color3.fromRGB(200, 180, 200)
		value.TextSize = 14
		
		self:_TrackConnection(display.MouseButton1Click:Connect(function()
			if self.listening then return end

			self.listening = true
			self.new_value = nil

			value.Text = "_"

			while self.listening do
				value.Text = value.Text == " " and "_" or " "
				task.wait(0.5)
			end
		end))

		self:_TrackConnection(userinput_service.InputBegan:Connect(function(input, processed)
			if processed or input.UserInputType ~= Enum.UserInputType.Keyboard then return end

			if self.listening then
				self.new_value = input.KeyCode
				self.listening = false

				if not self.new_value then return end
				
				self.value = self.new_value
				value.Text = self:_GetStringForKeyCode(self.new_value)
			end

			if input.KeyCode == self.value and self.callback then
				self:callback(self.value)
			end
		end))
		
		self.keybind = keybind
	end
end

local combo_class = table.create(8)
combo_class.__index = combo_class

do
	function combo_class:GetItems()
		return self.items
	end
	
	function combo_class:Clear()
		table.clear(self.items)
		self:_RefreshItems()
	end

	function combo_class:AddItem(item)
		table.insert(self.items, item)
		self:_RefreshItems()
	end
	
	function combo_class:Expand()
		if not self.collapsed then return end

		tween_service:Create(
			self.combo.Display.Arrow,
			global_tween_info,
			{
				Rotation = 90
			}
		):Play()

		self.dropdown.Visible = true
		self.collapsed = false
	end

	function combo_class:Collapse()
		if self.collapsed then return end

		tween_service:Create(
			self.combo.Display.Arrow,
			global_tween_info,
			{
				Rotation = 180
			}
		):Play()

		self.dropdown.Visible = false
		self.collapsed = true
	end
	
	function combo_class:SetValue(value)
		self:_ChangeValue(value)
		return self
	end
	
	function combo_class:GetValue()
		return self.value
	end
	
	function combo_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end

	function combo_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.combo then
			pcall(function()
				self.combo:Destroy()
			end)
		end

		self.connections = nil
		self.combo = nil
	end
	
	function combo_class:_ClearDropdown()
		if not self.dropdown then return end
		
		for i, v in ipairs(self.dropdown:GetChildren()) do
			if not v:IsA("TextButton") then continue end
			v:Destroy()
		end
	end
	
	function combo_class:_ChangeValue(value)
		if not self.combo then return end
		
		self.combo.Display.Value.Text = value
		self.value = value
		
		if self.callback then
			self:callback(value)
		end
	end
	
	function combo_class:_RefreshItems()
		if not self.dropdown then return end
		
		self:_ClearDropdown()
		
		for i, v in ipairs(self.items) do
			local item = Instance.new("TextButton")
			item.Name = v
			item.Parent = self.dropdown
			item.AutoButtonColor = false
			item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			item.BackgroundTransparency = 1
			item.BorderColor3 = Color3.fromRGB(0, 0, 0)
			item.BorderSizePixel = 0
			item.LayoutOrder = i
			item.Size = UDim2.new(1, 0, 0, 20)
			item.ClipsDescendants = true
			item.Text = ""
			item.TextTransparency = 1
			
			local value = Instance.new("TextLabel")
			value.Name = "Value"
			value.Parent = item
			value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			value.BackgroundTransparency = 1
			value.BorderColor3 = Color3.fromRGB(0, 0, 0)
			value.BorderSizePixel = 0
			value.Size = UDim2.new(1, 0, 1, 0)
			value.ClipsDescendants = true
			value.Font = "Montserrat"
			value.FontFace.Weight = Enum.FontWeight.Medium
			value.TextXAlignment = Enum.TextXAlignment.Left
			value.Text = v
			value.TextTruncate = Enum.TextTruncate.SplitWord
			value.TextColor3 = Color3.fromRGB(200, 180, 200)
			value.TextSize = 14
			
			item.MouseButton1Click:Once(function()
				self:Collapse()
				self:_ChangeValue(value.Text)
			end)
		end
	end
	
	function combo_class:_CreateCombo(parent, config)
		if self.combo then return end
		self.value = config.Placeholder
		self.items = config.Items
		self.callback = config.Callback
		
		local combo = Instance.new("Frame")
		combo.Name = "Combo"
		combo.Parent = parent
		combo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		combo.BackgroundTransparency = 1.000
		combo.BorderColor3 = Color3.fromRGB(0, 0, 0)
		combo.BorderSizePixel = 0
		combo.Size = UDim2.new(1, 0, 0, 20)
		combo.ZIndex = 99

		combo.Destroying:Once(self._Destroy)
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = combo
		list_layout.Padding = UDim.new(0, 4)
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill

		local display = Instance.new("TextButton")
		display.Name = "Display"
		display.Parent = combo
		display.AutoButtonColor = false
		display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		display.BackgroundTransparency = 0.300
		display.BorderColor3 = Color3.fromRGB(0, 0, 0)
		display.BorderSizePixel = 0
		display.Size = UDim2.new(0.5, 0, 1, 0)
		display.Text = ""
		display.TextTransparency = 1

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = display
		corner_radius.CornerRadius = UDim.new(0, 2)

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 30, 41)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(25, 23, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 30, 41))}
		gradient.Parent = display

		local padding = Instance.new("UIPadding")
		padding.Parent = display
		padding.PaddingBottom = UDim.new(0, 2)
		padding.PaddingLeft = UDim.new(0, 4)
		padding.PaddingRight = UDim.new(0, 2)
		padding.PaddingTop = UDim.new(0, 2)

		local border = Instance.new("UIStroke")
		border.Parent = display
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800

		local value = Instance.new("TextLabel")
		value.Name = "Value"
		value.Parent = display
		value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		value.BackgroundTransparency = 1
		value.BorderColor3 = Color3.fromRGB(0, 0, 0)
		value.BorderSizePixel = 0
		value.Size = UDim2.new(1, -15, 1, 0)
		value.ZIndex = 2
		value.ClipsDescendants = true
		value.Font = "Montserrat"
		value.FontFace.Weight = Enum.FontWeight.Medium
		value.TextXAlignment = Enum.TextXAlignment.Left
		value.Text = self.value
		value.TextTruncate = Enum.TextTruncate.SplitWord
		value.TextColor3 = Color3.fromRGB(200, 180, 200)
		value.TextSize = 14
		
		local arrow = Instance.new("ImageLabel")
		arrow.Name = "Arrow"
		arrow.Parent = display
		arrow.AnchorPoint = Vector2.new(1, 0.5)
		arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		arrow.BackgroundTransparency = 1.000
		arrow.Position = UDim2.new(1, 0, 0.5, 0)
		arrow.Rotation = 180.000
		arrow.Size = UDim2.new(0, 15, 0, 15)
		arrow.ZIndex = 1
		arrow.Image = "rbxassetid://4731371527"
		
		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Parent = combo
		label.AutomaticSize = Enum.AutomaticSize.XY
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.LayoutOrder = 1
		label.Size = UDim2.new(0, 5, 0, 5)
		label.Font = "Montserrat"
		label.FontFace.Weight = Enum.FontWeight.Medium
		label.Text = config.Label
		label.TextColor3 = Color3.fromRGB(200, 180, 200)
		label.TextSize = 14
		label.TextXAlignment = Enum.TextXAlignment.Left
		
		self:_TrackConnection(display.MouseButton1Click:Connect(function()
			if not self.dropdown then return end

			if self.collapsed then
				self:Expand()
			else
				self:Collapse()
			end
			
			self:_RefreshItems()
		end))
		
		self.combo = combo
		self.collapsed = true
	end
	
	function combo_class:_CreateDropdownMenu()
		if self.dropdown then return end
		if not self.combo then return end
		
		local dropdown = Instance.new("Frame")
		dropdown.Name = "Dropdown"
		dropdown.Parent = self.combo.Display
		dropdown.AnchorPoint = Vector2.new(0.5, 0)
		dropdown.AutomaticSize = Enum.AutomaticSize.Y
		dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdown.BackgroundTransparency = 0.300
		dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdown.BorderSizePixel = 0
		dropdown.Visible = false
		dropdown.Position = UDim2.new(0.5, 0, 1, 4)
		dropdown.Size = UDim2.new(1, 0, 0, 0)
		
		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = dropdown
		list_layout.FillDirection = Enum.FillDirection.Vertical
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Top
		list_layout.VerticalFlex = Enum.UIFlexAlignment.None
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = dropdown
		corner_radius.CornerRadius = UDim.new(0, 2)

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 30, 41)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(25, 23, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 30, 41))}
		gradient.Parent = dropdown

		local padding = Instance.new("UIPadding")
		padding.Parent = dropdown
		padding.PaddingBottom = UDim.new(0, 2)
		padding.PaddingLeft = UDim.new(0, 4)
		padding.PaddingRight = UDim.new(0, 2)
		padding.PaddingTop = UDim.new(0, 2)

		local border = Instance.new("UIStroke")
		border.Parent = dropdown
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
		
		self.dropdown = dropdown
	end
end

local separator_class = table.create(8)
separator_class.__index = separator_class

do
	function separator_class:_CreateSeparator(parent)
		if self.separator then return end
		
		local separator = Instance.new("Frame")
		separator.Name = "Separator"
		separator.Parent = parent
		separator.AutomaticSize = Enum.AutomaticSize.Y
		separator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		separator.BackgroundTransparency = 1
		separator.BorderColor3 = Color3.fromRGB(0, 0, 0)
		separator.BorderSizePixel = 0
		separator.Size = UDim2.new(1, 0, 0, 0)
		
		local padding = Instance.new("UIPadding")
		padding.Parent = separator
		padding.PaddingBottom = UDim.new(0, 4)
		padding.PaddingLeft = UDim.new(0, 2)
		padding.PaddingRight = UDim.new(0, 2)
		padding.PaddingTop = UDim.new(0, 4)
		
		local bar = Instance.new("Frame")
		bar.Name = "Bar"
		bar.Parent = separator
		bar.AnchorPoint = Vector2.new(0.5, 0.5)
		bar.BackgroundColor3 = Color3.fromRGB(110, 110, 128)
		bar.BackgroundTransparency = 0.5
		bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		bar.BorderSizePixel = 0
		bar.Position = UDim2.new(0.5, 0, 0.5, 0)
		bar.Size = UDim2.new(1, 0, 0, 2)
		
		self.separator = separator
	end
end

local inputtext_class = table.create(8)
inputtext_class.__index = inputtext_class

do
	function inputtext_class:Clear()
		if not self.input then return end
		self.input.Text = ""
		return self
	end
	
	function inputtext_class:SetValue(value)
		self:_ChangeValue(value)
		return self
	end
	
	function inputtext_class:_TrackConnection(conn)
		local t = self.connections
		t[#t+1] = conn
		return conn
	end

	function inputtext_class:_Destroy()
		if not self or self.destroying then return end
		self.destroying = true
		
		for _,conn in ipairs(self.connections) do
			if conn.Connected then conn:Disconnect() end
		end

		if self.input.Parent then
			pcall(function()
				self.input.Parent:Destroy()
			end)
		end

		self.connections = nil
		self.input = nil
	end
	
	function inputtext_class:_ChangeValue(value)
		if not self.input then return end

		self.input.Text = value
		self.value = value
	end
	
	function inputtext_class:_CreateInputText(parent, config)
		if self.input then return end
		self.value = config.Value
		self.callback = config.Callback
		
		local inputtext = Instance.new("Frame")
		inputtext.Name = "InputText"
		inputtext.Parent = parent
		inputtext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		inputtext.BackgroundTransparency = 1.000
		inputtext.BorderColor3 = Color3.fromRGB(0, 0, 0)
		inputtext.BorderSizePixel = 0
		inputtext.Size = UDim2.new(1, 0, 0, 20)

		inputtext.Destroying:Once(self._Destroy)

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = inputtext
		list_layout.Padding = UDim.new(0, 4)
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill
		
		local display = Instance.new("Frame")
		display.Name = "Display"
		display.Parent = inputtext
		display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		display.BackgroundTransparency = 0.300
		display.BorderColor3 = Color3.fromRGB(0, 0, 0)
		display.BorderSizePixel = 0
		display.Size = UDim2.new(0.5, 0, 1, 0)

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = display
		corner_radius.CornerRadius = UDim.new(0, 2)

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(31, 30, 41)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(25, 23, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(31, 30, 41))}
		gradient.Parent = display

		local padding = Instance.new("UIPadding")
		padding.Parent = display
		padding.PaddingBottom = UDim.new(0, 2)
		padding.PaddingLeft = UDim.new(0, 2)
		padding.PaddingRight = UDim.new(0, 2)
		padding.PaddingTop = UDim.new(0, 2)

		local border = Instance.new("UIStroke")
		border.Parent = display
		border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border.Color = Color3.fromRGB(134, 134, 147)
		border.Transparency = 0.800
		
		local input = Instance.new("TextBox")
		input.Name = "Input"
		input.Parent = display
		input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		input.BackgroundTransparency = 1
		input.BorderColor3 = Color3.fromRGB(0, 0, 0)
		input.BorderSizePixel = 0
		input.ClearTextOnFocus = false
		input.Size = UDim2.new(1, 0, 1, 0)
		input.ClipsDescendants = true
		input.AutoLocalize = false
		input.PlaceholderColor3 = Color3.fromRGB(141, 127, 141)
		input.PlaceholderText = config.Placeholder
		input.Font = "Montserrat"
		input.FontFace.Weight = Enum.FontWeight.Medium
		input.Text = config.Value
		input.TextColor3 = Color3.fromRGB(200, 180, 200)
		input.TextSize = 14
		input.TextTruncate = Enum.TextTruncate.AtEnd
		input.TextXAlignment = Enum.TextXAlignment.Left

		local label = Instance.new("TextLabel")
		label.Name = "Label"
		label.Parent = inputtext
		label.AutomaticSize = Enum.AutomaticSize.XY
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.LayoutOrder = 1
		label.Size = UDim2.new(0, 5, 0, 5)
		label.Font = "Montserrat"
		label.FontFace.Weight = Enum.FontWeight.Medium
		label.Text = config.Label
		label.TextColor3 = Color3.fromRGB(200, 180, 200)
		label.TextSize = 14
		label.TextXAlignment = Enum.TextXAlignment.Left
		
		self:_TrackConnection(input:GetPropertyChangedSignal("Text"):Connect(function()
			self.value = input.Text
			
			if self.callback then
				self:callback(self.value)
			end
		end))
		
		self.input = input
	end
end

--[[
	Helper Service
]]
helper_service = { } do
	function helper_service:HSMerge(defaults, config)
		config = config or {}

		for k,v in pairs(defaults) do
			if config[k] == nil then
				config[k] = v
			end
		end

		return config
	end
	
	function helper_service:HSGetGuiRoot()
		return gethui and gethui()
			or get_hidden_gui and get_hidden_gui()
			or helper_service:HSNewRef(game:GetService("CoreGui")).RobloxGui
	end
	
	function helper_service:HSNewRef(instance)
		if cloneref then
			return cloneref(instance)
		end
		
		return instance
	end
	
	function helper_service:HSRandomString(length)
		local result = ""
		if not self.rng then self.rng = Random.new() end
		for i = 1, length do
			result = result..string.char(self.rng:NextInteger(1,255))
		end
		return result
	end
end

--[[
	Core UI Service
]]
coreui_service = { } do
	function coreui_service:CSGetSafeGui()
		if coreui_service.safe_gui then
			return coreui_service.safe_gui
		end
		
		local safe_gui = Instance.new("ScreenGui")
		safe_gui.Name = helper_service:HSRandomString(20)
		safe_gui.IgnoreGuiInset = true
		safe_gui.ResetOnSpawn = false
		safe_gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		safe_gui.DisplayOrder = 2147483647
		safe_gui.Parent = helper_service:HSGetGuiRoot()
		coreui_service.safe_gui = safe_gui
		
		return safe_gui
	end
	
	function coreui_service:CSNotifCreate(config)
		local new_notif_obj = setmetatable({}, notif_class)
		
		new_notif_obj:_CreateNotif(coreui_service:CSGetSafeGui())
		new_notif_obj:_CreateNotifGlow()
		new_notif_obj:_CreateNotifContent()
		
		if config.Title then
			new_notif_obj:SetTitle(config.Title)
		end
		
		if config.Body then
			new_notif_obj:SetBody(config.Body)
		end
		
		if config.Icon then
			new_notif_obj:SetIcon(config.Icon)
		end
		
		if config.Duration then
			new_notif_obj:SetDuration(config.Duration)
		end
		
		return new_notif_obj
	end
	
	function coreui_service:CSWindowCreate(config)
		local new_window_obj = setmetatable({}, window_class)
		
		new_window_obj.destroyed = false
		new_window_obj.tweens = table.create(8)
		new_window_obj.connections = table.create(8)
		
		new_window_obj:_CreateWindow(coreui_service:CSGetSafeGui(), config)
		new_window_obj:_CreateWindowGlow()
		new_window_obj:_CreateWindowContent()
		new_window_obj:_CreateTitleBar(config)
		
		if not config.NoCollapse then
			new_window_obj:_CreateCollapseButton()
		end
		
		if not config.NoClose then
			new_window_obj:_CreateCloseButton()
		end
		
		if config.Collapsed then
			new_window_obj:Collapse()
		else
			new_window_obj:Expand()
		end
		
		return new_window_obj
	end
	
	function coreui_service:CSSidebarCreate(parent)
		local new_sidebar_obj = setmetatable({}, sidebar_class)
		
		new_sidebar_obj.collapsed = true
		new_sidebar_obj.tabs = table.create(8)
		new_sidebar_obj.connections = table.create(8)
		
		new_sidebar_obj:_CreateSidebar(parent)
		new_sidebar_obj:_CreateSidebarContent(parent)
		new_sidebar_obj:_CreateMenuToggle()
		new_sidebar_obj:_CreateSearchBar()
		new_sidebar_obj:_CreateSettingsTab()
		
		return new_sidebar_obj, new_sidebar_obj.settings_tab
	end
	
	function coreui_service:CSRegionCreate(parent, config)
		local new_region_obj = setmetatable({}, region_class)
		new_region_obj.connections = table.create(8)
		
		new_region_obj:_CreateRegion(parent, config)
		new_region_obj:_CreateRegionContent()
		
		return new_region_obj
	end
	
	function coreui_service:CSLabelCreate(parent, config)
		local new_label_obj = setmetatable({}, label_class)
		
		new_label_obj:_CreateLabel(parent, config)
		
		return new_label_obj
	end
	
	function coreui_service:CSConsoleCreate(parent, config)
		local new_console_obj = setmetatable({}, console_class)
		
		new_console_obj:_CreateConsole(parent, config)
		
		if config.Border then
			new_console_obj:_CreateConsoleBorder()
		end
		
		if config.LineNumbers then
			new_console_obj:_CreateConsoleLines()
		end
		
		return new_console_obj
	end
	
	function coreui_service:CSSliderFloatCreate(parent, config)
		local new_sliderfloat_obj = setmetatable({}, sliderfloat_class)
		
		new_sliderfloat_obj.dragging = false
		new_sliderfloat_obj.connections = table.create(8)
		
		new_sliderfloat_obj:_CreateSliderFloat(parent, config)
		new_sliderfloat_obj:_CreateSliderGrab()
		
		return new_sliderfloat_obj
	end
	
	function coreui_service:CSCheckboxCreate(parent, config)
		local new_checkbox_obj = setmetatable({}, checkbox_class)
		new_checkbox_obj.connections = table.create(8)
		
		new_checkbox_obj:_CreateCheckbox(parent, config)
		new_checkbox_obj:_CreateTick()
		
		if config.Value then
			new_checkbox_obj.tick.BackgroundTransparency = 0.300
			new_checkbox_obj.tick.Size = UDim2.new(1, 0, 1, 0)
			new_checkbox_obj.tick.UICorner.CornerRadius = UDim.new(0, 2)
			new_checkbox_obj.tick.UIStroke.Transparency = 0.8
			new_checkbox_obj.tick.glowtop.ImageTransparency = 0
			new_checkbox_obj.tick.glowtop_2.ImageTransparency = 0
		else
			new_checkbox_obj.tick.BackgroundTransparency = 1
			new_checkbox_obj.tick.Size = UDim2.new(0, 0, 0, 0)
			new_checkbox_obj.tick.UICorner.CornerRadius = UDim.new(1, 0)
			new_checkbox_obj.tick.UIStroke.Transparency = 1
			new_checkbox_obj.tick.glowtop.ImageTransparency = 1
			new_checkbox_obj.tick.glowtop_2.ImageTransparency = 1
		end
		
		return new_checkbox_obj
	end
	
	function coreui_service:CSButtonCreate(parent, config)
		local new_button_obj = setmetatable({}, button_class)
		new_button_obj.connections = table.create(8)
		
		new_button_obj:_CreateButton(parent, config)
		new_button_obj:_SetButtonStyle(config.Style)
		
		return new_button_obj
	end
	
	function coreui_service:CSKeybindCreate(parent, config)
		local new_keybind_obj = setmetatable({}, keybind_class)
		new_keybind_obj.connections = table.create(8)
		
		new_keybind_obj:_CreateKeybind(parent, config)
		
		return new_keybind_obj
	end
	
	function coreui_service:CSComboCreate(parent, config)
		local new_combo_obj = setmetatable({}, combo_class)
		
		new_combo_obj.items = table.create(8)
		new_combo_obj.connections = table.create(8)
		
		new_combo_obj:_CreateCombo(parent, config)
		new_combo_obj:_CreateDropdownMenu()
		
		return new_combo_obj
	end
	
	function coreui_service:CSSeparatorCreate(parent)
		local new_separator_obj = setmetatable({}, separator_class)
		
		new_separator_obj:_CreateSeparator(parent)
		
		return new_separator_obj
	end
	
	function coreui_service:CSInputTextCreate(parent, config)
		local new_inputtext_obj = setmetatable({}, inputtext_class)
		new_inputtext_obj.connections = table.create(8)

		new_inputtext_obj:_CreateInputText(parent, config)

		return new_inputtext_obj
	end
end

--[[
	Notification Service
]]
notification_service = {
	notifs = table.create(8)	
} do
	setmetatable(notification_service.notifs, { __mode = "v" })
	
	function notification_service:NSRepositionNotifs()
		for index, notif in ipairs(self.notifs) do
			local target_y = -20 - ((index - 1) * (120 + 10))

			tween_service:Create(
				notif.notif.Parent,
				TweenInfo.new(
					0.35,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				),
				{
					Position = UDim2.new(1, -20, 1, target_y)
				}
			):Play()
		end
	end
	
	function notification_service:NSPushNotification(config)
		local notif = coreui_service:CSNotifCreate(config)
		
		table.insert(self.notifs, 1, notif)
		self:NSRepositionNotifs()
		
		notif:Push()
		task.wait(notif.duration)
		notif:Pull()
	end
end

--[[
	Ini Service
]]
ini_service = {
	ini_to_save = {
		"value"
	},
	ini_settings = table.create(8)
} do
	function ini_service:ISGetIniData(class)
		local ini_to_save = self.ini_to_save
		local ini = {}

		for _, name in next, ini_to_save do
			ini[name] = class[name]
		end

		return ini
	end
	
	function ini_service:ISDumpIni(json_encode)
		local ini_settings = self.ini_settings
		local parsed_json = {}

		for flag, element in next, ini_settings do
			parsed_json[flag] = self:ISGetIniData(element)
		end

		if json_encode then
			return http_service:JSONEncode(parsed_json)
		end

		return parsed_json
	end
	
	function ini_service:ISLoadIniIntoElement(element, values)
		local value_funcs = {
			["value"] = function(value)
				element:SetValue(value)
			end,
		}

		for name, value in next, values do
			local set_value = value_funcs[name]
			if set_value then
				set_value(value)
				continue
			end

			element[name] = value
		end
	end
	
	function ini_service:ISLoadIni(new_settings, json_encoded)
		local ini_settings = self.ini_settings
		assert(new_settings, "No Ini configuration was passed")

		if json_encoded then
			new_settings = http_service:JSONDecode(new_settings)
		end

		for flag, value in next, new_settings do
			local element = ini_settings[flag]
			self:ISLoadIniIntoElement(element, value)
		end
	end

	function ini_service:ISAddIniFlag(flag, element)
		local ini_settings = self.ini_settings
		ini_settings[flag] = element
	end
end

--[[
	FUI API
]]

function fui:RegisterElement(name, constructor)
	self.elements[name] = constructor

	container_base[name] = function(self, config)
		return constructor(self, config)
	end
end

function fui:Window(config)
	config = helper_service:HSMerge({
		Title = "Window",
		Size = UDim2.fromOffset(600,400),
		Position = UDim2.new(0.5, 0, 0.5, -200),
		Collapsed = false,
		SmoothDrag = false
	}, config)
	
	local object = coreui_service:CSWindowCreate(config)
	
	object._CreateWindow = nil
	object._CreateWindowGlow = nil
	object._CreateWindowContent = nil
	object._CreateTitleBar = nil
	object._CreateCollapseButton = nil
	object._CreateCloseButton = nil
	
	table.insert(self.windows, object)
	return object
end

function fui:PushNotification(config)
	config = helper_service:HSMerge({
		Title = "Notification",
		Body = "This is a notification.",
		Icon = fui.icons.Send,
		Duration = 3
	}, config)
	
	notification_service:NSPushNotification(config)
end

function fui:DumpIni(json_encode)
	return ini_service:ISDumpIni(json_encode)
end

function fui:LoadIni(new_settings, json_encoded)
	return ini_service:ISLoadIni(new_settings, json_encoded)
end

function fui:AddIniFlag(flag, element)
	return ini_service:ISAddIniFlag(flag, element)
end

fui:RegisterElement("Sidebar", function(parent, config)
	local object, settings_tab = coreui_service:CSSidebarCreate(parent:GetContainer())
	
	object._CreateSidebar = nil
	object._CreateSidebarContent = nil
	object._CreateMenuToggle = nil
	object._CreateSearchBar = nil
	object._CreateSettingsTab = nil
	object._TrackConnection = nil
	
	return object, settings_tab
end)

fui:RegisterElement("Region", function(parent, config)
	config = helper_service:HSMerge({
		Scroll = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		Border = true,
		BorderThickness = 1,
		CornerRadius = UDim.new(0, 8)
	}, config)
	
	local object = coreui_service:CSRegionCreate(parent:GetContainer(), config)
	
	object._CreateRegion = nil
	object._CreateRegionContent = nil
	object._TrackConnection = nil
	
	return object
end)

fui:RegisterElement("Label", function(parent, config)
	config = helper_service:HSMerge({
		Font = "Montserrat",
		Weight = Enum.FontWeight.Medium,
		Text = "Label",
		Padding = UDim.new(0, 4),
		TextSize = 13.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center
	}, config)
	
	local object = coreui_service:CSLabelCreate(parent:GetContainer(), config)
	
	object._CreateLabel = nil
	
	return object
end)

fui:RegisterElement("Console", function(parent, config)
	config = helper_service:HSMerge({
		Enabled = true,
		Value = "",
		TextWrapped = false,
		CornerRadius = UDim.new(0, 2),
		Border = true,
		MaxLines = 300,
		ReadOnly = true,
		RichText = true,
		LineNumbers = false,
		AutoScroll = true,
		Callback = nil
	}, config)
	
	local object = coreui_service:CSConsoleCreate(parent:GetContainer(), config)
	
	object._CreateConsole = nil
	object._CreateConsoleBorder = nil
	object._CreateConsoleLines = nil
	
	return object
end)

fui:RegisterElement("SliderFloat", function(parent, config)
	config = helper_service:HSMerge({
		Label = "SliderFloat", 
		Minimum = 0.0, 
		Maximum = 1.0,
		Value = 0.5,
		Format = "%.2f",
		Callback = nil
	}, config)
	
	local object = coreui_service:CSSliderFloatCreate(parent:GetContainer(), config)
	
	object._CreateSliderFloat = nil
	object._CreateSliderGrab = nil
	object._TrackConnection = nil
	
	return object
end)

fui:RegisterElement("Checkbox", function(parent, config)
	config = helper_service:HSMerge({
		Label = "Checkbox",
		Value = false,
		Callback = nil
	}, config)
	
	local object = coreui_service:CSCheckboxCreate(parent:GetContainer(), config)
	
	object._CreateCheckbox = nil
	object._CreateTick = nil
	object._TrackConnection = nil
	
	return object
end)

fui:RegisterElement("Button", function(parent, config)
	config = helper_service:HSMerge({
		Text = "Button",
		Style = "Primary", -- can be "Secondary"
		Callback = nil
	}, config)
	
	local object = coreui_service:CSButtonCreate(parent:GetContainer(), config)
	
	object._CreateButton = nil
	object._SetButtonStyle = nil
	object._TrackConnection = nil
	
	return object
end)

fui:RegisterElement("Keybind", function(parent, config)
	config = helper_service:HSMerge({
		Label = "Keybind",
		Value = Enum.KeyCode.K,
		Callback = nil
	}, config)
	
	local object = coreui_service:CSKeybindCreate(parent:GetContainer(), config)
	
	object._CreateKeybind = nil
	object._TrackConnection = nil
	
	return object
end)

fui:RegisterElement("Combo", function(parent, config)
	config = helper_service:HSMerge({
		Label = "Combo",
		Placeholder = "Select...",
		Items = nil,
		Callback = nil
	}, config)
	
	local object = coreui_service:CSComboCreate(parent:GetContainer(), config)
	
	object._CreateCombo = nil
	object._CreateDropdownMenu = nil
	object._TrackConnection = nil
	
	return object
end)

fui:RegisterElement("Separator", function(parent, config)
	local object = coreui_service:CSSeparatorCreate(parent:GetContainer())

	object._CreateSeparator = nil

	return object
end)

fui:RegisterElement("PopupModal", function(parent, config)
	config = helper_service:HSMerge({
		Title = "PopupModal",
		Size = UDim2.fromOffset(372, 38),
		AutomaticSize = Enum.AutomaticSize.XY,
		NoCollapse = true,
		NoClose = true,
		Collapsed = false,
		SmoothDrag = false
	}, config)

	local object = fui:Window(config)

	local modal_effect = Instance.new("TextButton")
	modal_effect.Name = "ModalEffect"
	modal_effect.Parent = parent:GetContainer()
	modal_effect.AnchorPoint = Vector2.new(0.5, 0.5)
	modal_effect.AutoButtonColor = false
	modal_effect.Position = UDim2.new(0.5, 0, 0.5, 0)
	modal_effect.Size = UDim2.new(1, 0, 1, 0)
	modal_effect.BackgroundColor3 = Color3.fromRGB(26, 25, 33)
	modal_effect.BackgroundTransparency = 1
	modal_effect.BorderColor3 = Color3.fromRGB(0, 0, 0)
	modal_effect.BorderSizePixel = 0
	modal_effect.Selectable = false
	modal_effect.Text = ""
	modal_effect.TextTransparency = 1
	modal_effect.ZIndex = 99

	object.window.Parent = modal_effect
	object.window.AnchorPoint = Vector2.new(0.5, 0.5)
	object.window.AutomaticSize = config.AutomaticSize
	object.modal_effect = modal_effect
	
	local list_layout = Instance.new("UIListLayout")
	list_layout.Parent = object:GetContainer()
	list_layout.Padding = UDim.new(0, 4)
	list_layout.SortOrder = Enum.SortOrder.LayoutOrder

	local padding = Instance.new("UIPadding")
	padding.Parent = object:GetContainer()
	padding.PaddingBottom = UDim.new(0, 8)
	padding.PaddingLeft = UDim.new(0, 8)
	padding.PaddingRight = UDim.new(0, 8)
	padding.PaddingTop = UDim.new(0, 8)

	local old_destroy = object._Destroy
	function object:_Destroy()
		old_destroy(self)
		
		if self.modal_effect then
			self.modal_effect:Destroy()
			self.modal_effect = nil
		end
	end

	object:AddTween(modal_effect, {
		BackgroundTransparency = 0.3
	}):Play()

	function object:ClosePopup()
		if self.destroyed then return end

		local tween = self:AddTween(modal_effect, {
			BackgroundTransparency = 1
		})

		if tween then
			tween:Play()
			tween.Completed:Wait()
		end

		self:Close()
	end

	return object:Center()
end)

fui:RegisterElement("InputText", function(parent, config)
	config = helper_service:HSMerge({
		Value = "",
		Placeholder = "Type here...",
		Label = "InputText",
		Callback = nil
	}, config)
	
	local object = coreui_service:CSInputTextCreate(parent:GetContainer(), config)
	
	object._CreateInputText = nil
	object._TrackConnection = nil
	
	return object
end)

tween_service = service_proxy.TweenService
userinput_service = service_proxy.UserInputService
http_service = service_proxy.HttpService

if genv then
	genv.__FUI_ENV = fui
end

return fui
