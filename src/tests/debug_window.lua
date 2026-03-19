local fui = loadstring(game:HttpGet('https://raw.githubusercontent.com/altoidlol/fuchisaUI/refs/heads/main/src/fui.min.lua'))()
local Window = fui:Window({
	Title = "fuchisaUI - Debug",
	NoClose = true,
	Size = UDim2.new(0, 600, 0, 400)
}):Center()

local Sidebar, SettingsTab = Window:Sidebar()
local HomeTab = Sidebar:CreateTab("Home", fui.icons.Home)
local PlayerTab = Sidebar:CreateTab("Player", fui.icons.Character)

local function CreateRegion(Parent, Title)
	local Region = Parent:Region({
		Border = true,
        Scroll = true,
		BorderThickness = 1,
		CornerRadius = UDim.new(0, 5)
	})

	Region:Label({
		Text = Title
	})

	return Region
end

local HomeRegion1 = CreateRegion(HomeTab, "Home Region 1")
local HomeRegion2 = CreateRegion(HomeTab, "Home Region 2")

local console = HomeRegion1:Console({
    Enabled = true,
	  Value = "",
	  TextWrapped = false,
	  Border = true,
	  MaxLines = 300,
	  Callback = nil,
})

console:AppendText("Hello World!")
console:AppendText("I can even come in <font color=\"#FF0000\">colors!</font>")

HomeRegion1:SliderFloat({
    Label = "Slider",
    Value = 1.0,
    Callback = function(self, value)
        print(value)
    end,
})

HomeRegion1:Checkbox({
	Label = "Checkbox",
	Value = false,
	Callback = function(self, Value)
		print("Checked: "..tostring(Value))
	end
})

HomeRegion1:Button({
    Text = "Primary Button",
    Style = "Primary",
    Callback = function()
        print("Clicked Primary")
    end
})

HomeRegion1:Button({
    Text = "Secondary Button",
    Style = "Secondary",
    Callback = function()
        print("Clicked Secondary")
    end
})

HomeRegion1:Keybind({
	Label = "Show / Hide GUI",
	Value = Enum.KeyCode.RightShift,
	Callback = function(_, NewKeybind)
		local IsVisible = Window.window.Visible
		Window:SetVisible(not IsVisible)
	end
})

HomeRegion1:Separator()

HomeRegion1:Combo({
    Label = "Combo",
    Items = {
        "Item1",
        "Item2"
    },
    Callback = function(self, value)
        print("Combo Changed: "..value)
    end
})

fui:PushNotification({
    Title = "Loaded!",
    Body = "FUI Library Loaded.",
    Icon = fui.icons.Send,
    Duration = 3
})
