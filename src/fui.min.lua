local a=getgenv and getgenv()if a and a.__FUI_ENV then return a.
__FUI_ENV end local b local c local d
local e local f local g local
h local i table.freeze{}local j={
windows=table.create(8),elements=table.create(8)}setmetatable(j.windows,{
__mode='v'})setmetatable(j.elements,{__mode='v'})j.icons=table.freeze{Dot=
'rbxasset://textures/whiteCircle.png',Arrow=
'rbxasset://textures/ui/AvatarContextMenu_Arrow.png',Close=
'rbxasset://textures/loading/cancelButton.png',Checkmark=
'rbxasset://textures/ui/Lobby/Buttons/nine_slice_button.png',Cat=
'rbxassetid://16211812161',Script='rbxassetid://11570895459',Settings=
'rbxassetid://9743465390',Info='rbxassetid://18754976792',Move=
'rbxassetid://6710235139',Roblox='rbxassetid://7414445494',Warning=
'rbxassetid://11745872910',Audio='rbxassetid://302250236',Shop=
'rbxassetid://6473525198',CharacterDance='rbxassetid://11932783331',Pants=
'rbxassetid://10098755331',Home='rbxassetid://4034483344',Robux=
'rbxassetid://5986143282',Badge='rbxassetid://16170504068',SpawnLocation=
'rbxassetid://6400507398',Sword='rbxassetid://7485051715',Clover=
'rbxassetid://11999300014',Star='rbxassetid://3057073083',Code=
'rbxassetid://11348555035',Paw='rbxassetid://13001190533',Shield=
'rbxassetid://7461510428',Shield2='rbxassetid://7169354142',File=
'rbxassetid://7276823330',Book='rbxassetid://16061686835',Location=
'rbxassetid://13549782519',Puzzle='rbxassetid://8898417863',Discord=
'rbxassetid://84828491431270',Premium='rbxassetid://6487178625',Friend=
'rbxassetid://10885655986',User='rbxassetid://18854794412',Duplicate=
'rbxassetid://11833749507',ChatBox='rbxassetid://15839118471',ChatBox2=
'rbxassetid://15839116089',Devices='rbxassetid://4458812712',Weight=
'rbxassetid://9855685269',Image='rbxassetid://123311808092347',Profile=
'rbxassetid://13585614795',Admin='rbxassetid://11656483170',PaintBrush=
'rbxassetid://12111879608',Speed='rbxassetid://12641434961',NoConnection=
'rbxassetid://9795340967',Connection='rbxassetid://119759670842477',Globe=
'rbxassetid://18870359747',Box='rbxassetid://140217940575618',Crown=
'rbxassetid://18826490498',Control='rbxassetid://18979524646',Send=
'rbxassetid://18940312887',FastForward='rbxassetid://112963221295680',Pause=
'rbxassetid://109949100737970',Reload='rbxassetid://11570018242',Joystick=
'rbxassetid://18749336354',Controller='rbxassetid://11894535915',Lock=
'rbxassetid://17783082088',Calculator='rbxassetid://85861816563977',Sun=
'rbxassetid://13492317832',Moon='rbxassetid://8498174594',Prohibited=
'rbxassetid://5248916036',Flag='rbxassetid://251346532',Website=
'rbxassetid://98455290625865',Telegram='rbxassetid://115860270107061',MusicNote=
'rbxassetid://18187351229',Music='rbxassetid://253830398',Headphones=
'rbxassetid://1311321471',Phone='rbxassetid://8411963035',Smartphone=
'rbxassetid://14040313879',Desktop='rbxassetid://3120635703',Desktop2=
'rbxassetid://4728059490',Laptop='rbxassetid://4728059725',Server=
'rbxassetid://9692125126',Wedge='rbxassetid://9086583059',Drill=
'rbxassetid://11959189471',Character='rbxassetid://13285102351',Menu=
'rbxassetid://14895352864',Search='rbxassetid://105364076467397'}b=
setmetatable({},{__index=function(k,l:string)local m=game:
GetService(l)return c:HSNewRef(m)end})local
k=TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.
Out)local l=table.create(8)local m=table.create(8)
m.__index=m setmetatable(m,{__index=
l})do function m.GetTitle(n)return n.TitleBar.Text end
function m.SetTitle(n,o)n.TitleBar.Text=o return n end
function m.SetVisible(n,o)n.window.Visible=o return n end
function m.GetContainer(n)return n.content_group.Frame end function
m.Center(n)n.window.Position=UDim2.new(0.5,0,0.5,-n.window.Size.
Y.Offset/2)return n end function m.AddTween(n,o,p)if not o
then return end local q=g:Create(o,k,p)
return n:_TrackTween(q)end function m.Collapse(n)if n.
animating then return end if n.collapsed then return end if not n.window
then return end n.collapsed=not n.collapsed n.expanded_window_pos=n.
window.Position n.expanded_content_height=n.content_group.Frame.
AbsoluteSize.Y n.animating=true local o=UDim2.new(n.
expanded_window_size.X.Scale,n.expanded_window_size.X.Offset,0,n.
collapsed_height)local p=n:AddTween(n.window,{Size=o,
Position=n.expanded_window_pos})n:AddTween(n.content_group and n.
content_group.Frame,{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1})n:
AddTween(n.collapse_button,{Rotation=0})n:AddTween(n.window.glowbottom1
,{ImageTransparency=1})n:AddTween(n.window.glowbottom2,{ImageTransparency=
1})for q,r in ipairs(n.tweens)do r:Play()end if p then
p.Completed:Wait()end table.clear(n.tweens)n.animating=false
return n end function m.Expand(n)if n.animating then return end
if not n.collapsed then return end if not n.window then return end n.
collapsed=not n.collapsed n.expanded_window_pos=n.window.Position n.
animating=true local o=n:AddTween(n.window,{Size=n.
expanded_window_size,Position=n.expanded_window_pos})n:AddTween(n.
content_group.Frame,{Size=UDim2.new(1,0,0,n.expanded_content_height),
BackgroundTransparency=0.3})n:AddTween(n.collapse_button,{Rotation=90})
n:AddTween(n.window.glowbottom1,{ImageTransparency=0})n:AddTween(n.
window.glowbottom2,{ImageTransparency=0})for p,q in ipairs(n.tweens)do q:
Play()end if o then o.Completed:Wait()end table.clear(n
.tweens)n.animating=false return n end function m.Close(n)if
n.destroyed then return end n.destroyed=true local o=n.window if
not o then return end local p=TweenInfo.new(0.22,Enum.
EasingStyle.Quad,Enum.EasingDirection.In)local q=n:_TrackTween(
g:Create(o,p,{Size=UDim2.new(o.Size.X.Scale
,o.Size.X.Offset*0.85,o.Size.Y.Scale,o.Size.Y.Offset*0.85),
Position=UDim2.new(o.Position.X.Scale,o.Position.X.Offset,o.
Position.Y.Scale,o.Position.Y.Offset+8),BackgroundTransparency=1}))local
r={}local s=o:GetDescendants()for t=1,#s do
local u=s[t]if u:IsA'GuiObject'then local v=n:
_TrackTween(g:Create(u,p,{BackgroundTransparency=1}
))r[#r+1]=v v:Play()elseif u:IsA'TextLabel'or
u:IsA'TextButton'then local v=n:_TrackTween(g:Create(u,
p,{TextTransparency=1}))r[#r+1]=v v:
Play()elseif u:IsA'ImageLabel'or u:IsA'ImageButton'then local v=n
:_TrackTween(g:Create(u,p,{ImageTransparency=1}))
r[#r+1]=v v:Play()end end q:Play()
q.Completed:Wait()n:_Destroy()end function m.
_TrackConnection(n,o)local p=n.connections p[#p+1]=o return o end
function m._TrackTween(n,o)local p=n.tweens p[#p+
1]=o o.Completed:Once(function()for q=1,#p do if p[q]~=o
then continue end p[q]=p[#p]p[#p]=nil break end end)
return o end function m._Destroy(n)if not n or n.destroying
then return end n.destroying=true for o,p in ipairs(n.tweens)do pcall(
function()p:Cancel()end)end for o,p in ipairs(n.connections)do if p
.Connected then p:Disconnect()end end if n.window then n.window:
Destroy()end n.connections=nil n.tweens=nil n.window=nil n.title_bar
=nil n.content_group=nil n.collapse_button=nil end function m.
_CreateWindow(n,o,p)if n.window then return end local q=Instance
.new'Frame'q.Name='Window'q.Parent=o q.Active=true q.
AnchorPoint=Vector2.new(0.5,0)q.BackgroundColor3=Color3.fromRGB(255,114,114
)q.BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q
.BorderSizePixel=0 q.Position=p.Position q.Size=p.Size local
r=Instance.new'UIPadding'r.Parent=q
r.PaddingBottom=UDim.new(0,1)r.PaddingLeft=UDim.new(0,
1)r.PaddingRight=UDim.new(0,1)r.PaddingTop=UDim.new(0,
1)n.window=q n.expanded_window_size=q.Size n.
expanded_window_pos=q.Position end function m._CreateWindowGlow(n
)if not n.window then return end local o=Instance.new'ImageLabel'
o.Name='glowtop1'o.Parent=n.window o.AnchorPoint=
Vector2.new(0.5,0)o.BackgroundColor3=Color3.fromRGB(255,255,255)
o.BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)
o.BorderSizePixel=0 o.Position=UDim2.new(0.5,0,0,-5)o.
Size=UDim2.new(1,0,0,10)o.ZIndex=4 o.Image=
'rbxassetid://76150694119616'local p=Instance.new'UIGradient'
p.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}p.Transparency
=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(
0.22,1),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(0.74,0.5),
NumberSequenceKeypoint.new(1,1),NumberSequenceKeypoint.new(1,0)}p.
Parent=o local q=Instance.new'ImageLabel'q.Name=
'glowtop2'q.Parent=n.window q.AnchorPoint=Vector2.new(0.5,0)
q.BackgroundColor3=Color3.fromRGB(255,255,255)q.
BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.
BorderSizePixel=0 q.Position=o.Position q.Size=UDim2.
new(1,0,0,10)q.ZIndex=4 q.Image='rbxassetid://76150694119616'
local r=Instance.new'UIGradient'r.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.
new(0.5,Color3.fromRGB(223,142,255)),ColorSequenceKeypoint.new(0.74,Color3.
fromRGB(148,189,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}
r.Parent=q local s=Instance.new'ImageLabel'
s.Name='glowbottom1's.Parent=n.window s.
AnchorPoint=Vector2.new(0.5,1)s.BackgroundColor3=Color3.fromRGB(255,
255,255)s.BackgroundTransparency=1 s.BorderColor3=Color3.
fromRGB(0,0,0)s.BorderSizePixel=0 s.Position=UDim2.new(0.5
,0,1,5)s.Size=UDim2.new(1,0,0,10)s.ZIndex=4 s.
Image='rbxassetid://76150694119616'local t=Instance.new'UIGradient'
t.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}t.Parent=
s local u=Instance.new'ImageLabel'u.Name=
'glowbottom2'u.Parent=n.window u.AnchorPoint=Vector2.
new(0.5,1)u.BackgroundColor3=Color3.fromRGB(255,255,255)u.
BackgroundTransparency=1 u.BorderColor3=Color3.fromRGB(0,0,0)
u.BorderSizePixel=0 u.Position=s.Position
u.Size=UDim2.new(1,0,0,10)u.ZIndex=4 u.Image=
'rbxassetid://76150694119616'local v=Instance.new'UIGradient'
v.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}v.Transparency
=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0
,1),NumberSequenceKeypoint.new(0.32,0),NumberSequenceKeypoint.new(0.52,1),
NumberSequenceKeypoint.new(0.74,0.5),NumberSequenceKeypoint.new(1,1),
NumberSequenceKeypoint.new(1,0)}v.Parent=u end function
m._CreateWindowContent(n)if n.content_group then return end if not
n.window then return end local o=Instance.new'CanvasGroup'
o.Name='Content'o.Parent=n.window o.
Active=true o.AutomaticSize=Enum.AutomaticSize.Y o.
BackgroundColor3=Color3.fromRGB(255,255,255)o.BackgroundTransparency
=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel
=0 o.Position=UDim2.new(0,0,0,0)o.Size=UDim2.new(1,0,1,0
)local p=Instance.new'UIStroke'p.Name='Border'
p.Parent=o p.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border p.Color=Color3.fromRGB(134,134,147)
p.Thickness=1 local q=Instance.new'UICorner'
q.CornerRadius=UDim.new(0,8)q.Parent=o local
r=Instance.new'UIListLayout'r.Parent=o
r.Padding=UDim.new(0,0)r.SortOrder=Enum.SortOrder.
LayoutOrder r.VerticalFlex=Enum.UIFlexAlignment.Fill local
s=Instance.new'Frame's.Parent=o
s.ClipsDescendants=true s.BackgroundColor3=Color3.
fromRGB(26,25,33)s.BackgroundTransparency=0.3 s.
BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0 s.
Position=UDim2.new(0,0,0,0)s.Size=UDim2.new(1,0,1,0)n.
content_group=o end function m._CreateTitleBar(n,o)if
n.title_bar then return end if not n.window then return end if not n.
content_group then return end local p=Instance.new'Frame'p.
Name='TitleBar'p.Parent=n.content_group p.AutomaticSize=Enum.
AutomaticSize.Y p.BackgroundColor3=Color3.fromRGB(35,30,35)p.
BackgroundTransparency=0.3 p.BorderColor3=Color3.fromRGB(0,0,0)p
.BorderSizePixel=0 p.ClipsDescendants=true p.LayoutOrder=-1
p.Position=UDim2.new(0,0,0,0)p.Size=UDim2.new(1,0,0,19)local
q=Instance.new'UIGradient'q.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(170,170,170))}q.Parent=p q.Enabled=
false local r=Instance.new'UIListLayout'r.Parent=p
r.FillDirection=Enum.FillDirection.Horizontal r.SortOrder=
Enum.SortOrder.LayoutOrder r.VerticalAlignment=Enum.VerticalAlignment.
Center r.VerticalFlex=Enum.UIFlexAlignment.Fill r.Padding=
UDim.new(0,4)local s=Instance.new'UIPadding's.Parent=p
s.PaddingBottom=UDim.new(0,1)s.PaddingLeft=UDim.new(0,4)s.
PaddingRight=UDim.new(0,4)s.PaddingTop=UDim.new(0,1)local t=
Instance.new'UIFlexItem't.Parent=p local u=Instance.
new'TextButton'u.Name='TitleBar'u.Parent=p
u.AutomaticSize=Enum.AutomaticSize.Y u.BackgroundColor3=
Color3.fromRGB(255,255,255)u.BackgroundTransparency=1 u.
BorderColor3=Color3.fromRGB(110,110,125)u.BorderSizePixel=0
u.ClipsDescendants=true u.LayoutOrder=1 u.Size=
UDim2.new(1,0,0,19)u.AutoButtonColor=false u.Font=
'Montserrat'u.FontFace.Weight=Enum.FontWeight.Medium u.Text=
o.Title u.TextColor3=Color3.fromRGB(200,180,200)u.
TextSize=14 local v=Instance.new'UICorner'v.
CornerRadius=UDim.new(0,0)v.Name='FrameRounding'v.Parent
=u local w=Instance.new'UIGradient'w.Color=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(139,189,186))}w.Parent=
u w.Enabled=false local x=Instance.new
'UIListLayout'x.Parent=u x.FillDirection=Enum
.FillDirection.Horizontal x.SortOrder=Enum.SortOrder.LayoutOrder
x.VerticalAlignment=Enum.VerticalAlignment.Center x.
VerticalFlex=Enum.UIFlexAlignment.Fill x.Padding=UDim.new(0,4)local
y=Instance.new'UIPadding'y.Parent=u y.
PaddingLeft=UDim.new(0,2)local z=false local A,B,
C n:_TrackConnection(u.InputBegan:Connect(function(D
)if D.UserInputType~=Enum.UserInputType.MouseButton1 then return end
z=true A=D.Position B=n.window.Position end))n
:_TrackConnection(u.InputEnded:Connect(function(D)if D.
UserInputType~=Enum.UserInputType.MouseButton1 then return end z=false
C=nil end))n:_TrackConnection(h.InputChanged:
Connect(function(D)if not z then return end if D.UserInputType~=
Enum.UserInputType.MouseMovement and D.UserInputType~=Enum.UserInputType.
Touch then return end local E=D.Position-A local
F=UDim2.new(B.X.Scale,B.X.Offset+E.X,
B.Y.Scale,B.Y.Offset+E.Y)if not o.SmoothDrag then n.
window.Position=F return end if C then C:
Cancel()C=nil end C=n:_TrackTween(g:Create(
n.window,k,{Position=F}))C:Play()
end))n.title_bar=p task.defer(function()n.collapsed_height=
p.AbsoluteSize.Y end)end function m._CreateCollapseButton(n)if
n.collapse_button then return end if not n.title_bar then return end if
not n.window then return end if not n.content_group then return end local
o=Instance.new'Frame'o.Name='CollapseToggle'o.Parent=n.
title_bar.TitleBar o.Active=true o.AutomaticSize=Enum.AutomaticSize.X
o.BackgroundColor3=Color3.fromRGB(255,255,255)o.BackgroundTransparency
=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.Size
=UDim2.new(0,17,0,0)local p=Instance.new'UIAspectRatioConstraint'
p.Parent=o local q=Instance.new'UIPadding'q.Parent=
o q.PaddingBottom=UDim.new(0,1)q.PaddingLeft=UDim.new(0,1)
q.PaddingRight=UDim.new(0,1)q.PaddingTop=UDim.new(0,1)local r=
Instance.new'ImageButton'r.Name='Icon'r.Parent=o r.AnchorPoint=
Vector2.new(0.5,0.5)r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.Position=UDim2.new(0.5,0,0.5,0)r.Rotation=90
r.Size=UDim2.new(0.8,0,0.8,0)r.ZIndex=1 r.Image=
'rbxassetid://4731371527'local s=Instance.new'Frame's.
Name='HoverCircle's.Parent=o s.AnchorPoint=Vector2.
new(0.5,0.5)s.BackgroundColor3=Color3.fromRGB(255,255,255)
s.BackgroundTransparency=1 s.Position=UDim2.new(0.5,0,0.5,
0)s.Size=UDim2.new(0,0,0,0)s.ZIndex=0 local t=Instance.
new'UIGradient't.Parent=s t.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(200,180,255)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(150,200,255))}t.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(1,0.9)}local u
=Instance.new'UIStroke'u.Parent=s u.Color=Color3.fromRGB(
200,180,255)u.Thickness=1 u.Transparency=0.6 local v=
Instance.new'UICorner'v.Name='FrameRounding'v.Parent=
s v.CornerRadius=UDim.new(1,0)n:_TrackConnection(r.
MouseButton1Click:Connect(function()if n.collapsed then n:Expand()else
n:Collapse()end end))local w n:_TrackConnection(r.MouseEnter:
Connect(function()if w then w:Cancel()end w=n:
_TrackTween(g:Create(s,k,{Size=UDim2.new(
1,0,1,0),BackgroundTransparency=0.75}))w:Play()end))n:
_TrackConnection(r.MouseLeave:Connect(function()if w then
w:Cancel()end w=n:_TrackTween(g:Create(
s,k,{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1
}))w:Play()end))n.collapse_button=r end function m.
_CreateCloseButton(n)if n.close_button then return end if not n.title_bar
then return end if not n.window then return end if not n.content_group
then return end local o=Instance.new'Frame'o.Name='CloseToggle'
o.Parent=n.title_bar.TitleBar o.Active=true o.AutomaticSize=
Enum.AutomaticSize.X o.BackgroundColor3=Color3.fromRGB(255,255,255)o.
BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)o.
BorderSizePixel=0 o.LayoutOrder=2 o.Size=UDim2.new(0,17,0,0)local
p=Instance.new'UIAspectRatioConstraint'p.Parent=o local
q=Instance.new'UIPadding'q.Parent=o q.PaddingBottom=
UDim.new(0,1)q.PaddingLeft=UDim.new(0,1)q.PaddingRight=UDim.new(0,1)
q.PaddingTop=UDim.new(0,1)local r=Instance.new'ImageButton'r.Name=
'Icon'r.Parent=o r.AnchorPoint=Vector2.new(0.5,0.5)r.
BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.
Position=UDim2.new(0.5,0,0.5,0)r.Size=UDim2.new(0.8,0,0.8,0)r.ZIndex=1
r.Image='rbxassetid://90965270530088'local s=Instance.new'Frame'
s.Name='HoverCircle's.Parent=o s.
AnchorPoint=Vector2.new(0.5,0.5)s.BackgroundColor3=Color3.fromRGB(255
,255,255)s.BackgroundTransparency=1 s.Position=UDim2.new(
0.5,0,0.5,0)s.Size=UDim2.new(0,0,0,0)s.ZIndex=0 local t
=Instance.new'UIGradient't.Parent=s t.Color=ColorSequence.new
{ColorSequenceKeypoint.new(0,Color3.fromRGB(200,180,255)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(150,200,255))}t.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(1,0.9)}local u
=Instance.new'UIStroke'u.Parent=s u.Color=Color3.fromRGB(
200,180,255)u.Thickness=1 u.Transparency=0.6 local v=
Instance.new'UICorner'v.Name='FrameRounding'v.Parent=
s v.CornerRadius=UDim.new(1,0)n:_TrackConnection(r.
MouseButton1Click:Connect(function()n:Close()end))local w n:
_TrackConnection(r.MouseEnter:Connect(function()if w then
w:Cancel()end w=n:_TrackTween(g:Create(
s,k,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=
0.75}))w:Play()end))n:_TrackConnection(r.MouseLeave:Connect(
function()if w then w:Cancel()end w=n:
_TrackTween(g:Create(s,k,{Size=UDim2.new(
0,0,0,0),BackgroundTransparency=1}))w:Play()end))n.close_button=
r end end local n=table.create(8)n.__index=n do
function n.SetTitle(o,p)o.content_frame.Title.Text=p return
o end function n.SetBody(o,p)o.content_frame.Body.Text=p
return o end function n.SetIcon(o,p)o.content_frame.Icon.Image=
p return o end function n.SetDuration(o,p)o.duration=
p return o end function n.Push(o)if not o.notif then
return end if not o.duration then return end g:Create(o.notif.
Border,k,{Transparency=0}):Play()g:Create(o.
content_frame.Title,k,{TextTransparency=0}):Play()g:
Create(o.content_frame.Body,k,{TextTransparency=0}):Play()
g:Create(o.content_frame.Icon,k,{
ImageTransparency=0}):Play()g:Create(o.notif,k,{
Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=0.3}):Play()g
:Create(o.notif.Gradient,TweenInfo.new(o.duration,Enum.EasingStyle.Linear,
Enum.EasingDirection.Out),{Offset=Vector2.new(1,0)}):Play()end function
n.Pull(o)if not o.notif then return end local p=
g:Create(o.notif,k,{Position=UDim2.new(0.5,0,0.5,
12),BackgroundTransparency=1})g:Create(o.notif.Border,
k,{Transparency=1}):Play()g:Create(o.
content_frame.Title,k,{TextTransparency=1}):Play()g:
Create(o.content_frame.Body,k,{TextTransparency=1}):Play()
g:Create(o.content_frame.Icon,k,{
ImageTransparency=1}):Play()p:Play()p.Completed:Wait()o:
_Destroy()end function n._Destroy(o)local p=e.
notifs local q=table.find(p,o)if q then table.remove(p,
q)end o.notif.Parent:Destroy()e:NSRepositionNotifs()
end function n._CreateNotif(o,p)if o.notif then return end local
q=Instance.new'Frame'q.Name='NotifHolder'q.
Parent=p q.AnchorPoint=Vector2.new(1,1)q.
BackgroundColor3=Color3.fromRGB(255,255,255)q.BackgroundTransparency=
1 q.BorderColor3=Color3.fromRGB(0,0,0)q.BorderSizePixel=0
q.Position=UDim2.new(1,-20,1,-20)q.Size=UDim2.new(0,256,0,
120)local r=Instance.new'Frame'r.Parent=q r.AnchorPoint
=Vector2.new(0.5,0.5)r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)r.
BorderSizePixel=0 r.ClipsDescendants=true r.Size=UDim2.new(1,-10,1,-10)
r.Position=UDim2.new(0.5,0,0.5,10)local s=Instance.new
'UICorner's.CornerRadius=UDim.new(0,8)s.Parent=r
local t=Instance.new'UIGradient't.Name='Gradient't.Offset
=Vector2.new(-1,0)t.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(38,37,49)),ColorSequenceKeypoint.new(0.04,Color3.fromRGB(26,25,33
)),ColorSequenceKeypoint.new(1,Color3.fromRGB(26,25,33))}t.Parent=r
local u=Instance.new'UIStroke'u.Name='Border'
u.Parent=r u.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border u.Color=Color3.fromRGB(134,134,147)u.Thickness=1
u.Transparency=1 o.notif=r end function n.
_CreateNotifGlow(o)if not o.notif then return end local p=Instance.
new'ImageLabel'p.Name='glowtop1'p.Parent=o.notif p.
AnchorPoint=Vector2.new(0.5,0)p.BackgroundColor3=Color3.fromRGB(255,255,
255)p.BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0
,0)p.BorderSizePixel=0 p.Position=UDim2.new(0.5,0,0,-5)p
.Size=UDim2.new(1,0,0,10)p.ZIndex=4 p.Image=
'rbxassetid://76150694119616'local q=Instance.new'UIGradient'
q.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}q.Transparency
=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(
0.22,1),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(0.74,0.5),
NumberSequenceKeypoint.new(1,1),NumberSequenceKeypoint.new(1,0)}q.
Parent=p local r=Instance.new'ImageLabel'r.Name=
'glowtop2'r.Parent=o.notif r.AnchorPoint=Vector2.new(0.5,0)
r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)r.
BorderSizePixel=0 r.Position=p.Position r.Size=UDim2.
new(1,0,0,10)r.ZIndex=4 r.Image='rbxassetid://76150694119616'
local s=Instance.new'UIGradient's.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.
new(0.5,Color3.fromRGB(223,142,255)),ColorSequenceKeypoint.new(0.74,Color3.
fromRGB(148,189,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}
s.Parent=r local t=Instance.new'ImageLabel'
t.Name='glowbottom1't.Parent=o.notif t.
AnchorPoint=Vector2.new(0.5,1)t.BackgroundColor3=Color3.fromRGB(255,
255,255)t.BackgroundTransparency=1 t.BorderColor3=Color3.
fromRGB(0,0,0)t.BorderSizePixel=0 t.Position=UDim2.new(0.5
,0,1,5)t.Size=UDim2.new(1,0,0,10)t.ZIndex=4 t.
Image='rbxassetid://76150694119616'local u=Instance.new'UIGradient'
u.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}u.Parent=
t local v=Instance.new'ImageLabel'v.Name=
'glowbottom2'v.Parent=o.notif v.AnchorPoint=Vector2.
new(0.5,1)v.BackgroundColor3=Color3.fromRGB(255,255,255)v.
BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0,0)
v.BorderSizePixel=0 v.Position=t.Position
v.Size=UDim2.new(1,0,0,10)v.ZIndex=4 v.Image=
'rbxassetid://76150694119616'local w=Instance.new'UIGradient'
w.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}w.Transparency
=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0
,1),NumberSequenceKeypoint.new(0.32,0),NumberSequenceKeypoint.new(0.52,1),
NumberSequenceKeypoint.new(0.74,0.5),NumberSequenceKeypoint.new(1,1),
NumberSequenceKeypoint.new(1,0)}w.Parent=v end function
n._CreateNotifContent(o)if o.content_frame then return end if not
o.notif then return end local p=Instance.new'Frame'
p.Parent=o.notif p.AnchorPoint=Vector2.new(0.5,0.5)
p.BackgroundColor3=Color3.fromRGB(255,255,255)p.
BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)
p.BorderSizePixel=0 p.ClipsDescendants=true
p.Size=UDim2.new(1,0,1,0)p.Position=UDim2.new(0.5,0,0.5,
0)local q=Instance.new'TextLabel'q.Name='Title'q.Parent=
p q.AnchorPoint=Vector2.new(1,0)q.BackgroundColor3=Color3.
fromRGB(255,255,255)q.BackgroundTransparency=1 q.BorderColor3=Color3.
fromRGB(0,0,0)q.BorderSizePixel=0 q.Position=UDim2.new(1,0,0,10)q.
Size=UDim2.new(1,-40,0,20)q.Font='Montserrat'q.FontFace.Weight=Enum.
FontWeight.Bold q.TextColor3=Color3.fromRGB(185,176,166)q.
TextTransparency=1 q.TextSize=20 q.TextXAlignment=Enum.TextXAlignment.
Left local r=Instance.new'ImageLabel'r.Name='Icon'r.Parent=
p r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.ImageTransparency=1 r.BorderColor3=Color3.
fromRGB(0,0,0)r.BorderSizePixel=0 r.Position=UDim2.new(0,10,0,10)r.Size
=UDim2.new(0,20,0,20)local s=Instance.new'TextLabel's.Name='Body's.
Parent=p s.AnchorPoint=Vector2.new(0.5,1)s.BackgroundColor3=
Color3.fromRGB(255,255,255)s.BackgroundTransparency=1 s.BorderColor3=
Color3.fromRGB(0,0,0)s.BorderSizePixel=0 s.Position=UDim2.new(0.5,0,1,-10)
s.Size=UDim2.new(1,-20,1,-50)s.Font='Montserrat's.FontFace.Weight=Enum.
FontWeight.Medium s.TextWrapped=true s.TextColor3=Color3.fromRGB(185,176,
166)s.TextTransparency=1 s.TextSize=14 s.TextXAlignment=Enum.
TextXAlignment.Left s.TextYAlignment=Enum.TextYAlignment.Top o.
content_frame=p end end local o=table.create(8)o.
__index=o setmetatable(o,{__index=l})do function
o.GetName(p)return p.tab.Name end function o.SetName(p,q)p
.tab.Name=q p.content_frame.Name=q..'Content'return p end function
o.GetContainer(p)return p.content_frame end function o.
SetClickCallback(p,q)p.click_callback=q return p end function
o._TrackConnection(p,q)local r=p.connections r[#r+1]=q return
q end function o._Destroy(p)if not p or p.destroying then return
end p.destroying=true for q,r in ipairs(p.connections)do if r.
Connected then r:Disconnect()end end if p.tab then pcall(function()p.
tab:Destroy()end)end p.connections=nil p.tab=nil end function o.
_CreateTab(p,q,r,s)if p.tab then return end local t=Instance.new
'Frame't.Name=r t.Parent=q t.BackgroundColor3=Color3.fromRGB(26,
25,33)t.BackgroundTransparency=1 t.BorderColor3=Color3.fromRGB(0,0,0)t.
BorderSizePixel=0 t.Position=UDim2.new(0,0,0,0)t.Size=UDim2.new(1,0,0,24)
local u=Instance.new'Frame'u.Name='TabContent'u.
Parent=t u.AnchorPoint=Vector2.new(1,0.5)u.
BackgroundColor3=Color3.fromRGB(255,255,255)u.BackgroundTransparency=1
u.BorderColor3=Color3.fromRGB(0,0,0)u.BorderSizePixel=0
u.Position=UDim2.new(1,0,0.5,0)u.Size=UDim2.new(1,-24,1,0)
u.ClipsDescendants=true local v=Instance.new'TextLabel'
v.Name='NameLabel'v.Parent=u v.
BackgroundColor3=Color3.fromRGB(255,255,255)v.BackgroundTransparency=1
v.BorderColor3=Color3.fromRGB(0,0,0)v.BorderSizePixel=0
v.Position=UDim2.new(0,0,0,0)v.Size=UDim2.new(1,0,1,0)
v.Font='Montserrat'v.FontFace.Weight=Enum.FontWeight.Medium
v.Text=r v.TextColor3=Color3.fromRGB(200,180,200)v
.TextSize=16 v.TextXAlignment=Enum.TextXAlignment.Left local w=
Instance.new'UIPadding'w.Parent=u w.PaddingBottom=UDim.
new(0,8)w.PaddingLeft=UDim.new(0,8)w.PaddingRight=UDim.new(0,8)
w.PaddingTop=UDim.new(0,8)local x=Instance.new'ImageButton'
x.Name='Icon'x.Parent=t x.AnchorPoint=Vector2.
new(0,0.5)x.AutoButtonColor=false x.BackgroundColor3=Color3.
fromRGB(66,150,250)x.BackgroundTransparency=1 x.BorderColor3
=Color3.fromRGB(0,0,0)x.BorderSizePixel=0 x.Position=UDim2.
new(0,0,0.5,0)x.Size=UDim2.new(1,0,1,0)x.ImageTransparency=1
local y=Instance.new'ImageLabel'y.Name='IconImage'y
.Parent=x y.BackgroundTransparency=1 y.Image=s
y.AnchorPoint=Vector2.new(0,0.5)y.Position=UDim2.new(0,0,0.5,0
)y.Size=UDim2.new(0,24,0,24)local z=Instance.new'UICorner'
z.Name='FrameRounding'z.Parent=x
z.CornerRadius=UDim.new(1,0)local A=Instance.new
'UIAspectRatioConstraint'A.Parent=y local B=Instance.
new'ImageLabel'B.Name='glowtop1'B.Parent=t B.
AnchorPoint=Vector2.new(0,0.5)B.BackgroundColor3=Color3.fromRGB(255,255,
255)B.BackgroundTransparency=1 B.BorderColor3=Color3.fromRGB(0,0
,0)B.BorderSizePixel=0 B.Position=UDim2.new(0,0,0.5,0)B.
Size=UDim2.new(1,2,1,2)B.ZIndex=4 B.Image=
'rbxassetid://76150694119616'local C=Instance.new'UICorner'
C.Name='FrameRounding'C.Parent=B
C.CornerRadius=UDim.new(1,0)local D=Instance.new
'UIGradient'D.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,
142,255)),ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}D.Parent=
B local E local F=false p:_TrackConnection(
x.MouseEnter:Connect(function()F=true if E then
E:Cancel()end g:Create(B,k,{
BackgroundTransparency=0.8}):Play()local G=g:Create(D,
TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=90,
Offset=Vector2.new(-1,0)})G:Play()G.Completed:Wait()if not F then
return end E=g:Create(D,k,{Offset
=Vector2.new(1,-0.5)})E:Play()end))p:_TrackConnection(x.
MouseLeave:Connect(function()F=false if E then E:
Cancel()end g:Create(B,k,{
BackgroundTransparency=(p.is_active and 0.6 or 1)}):Play()E=
g:Create(D,k,{Rotation=0,Offset=Vector2.
new(0,0)})E:Play()end))p:_TrackConnection(x.
MouseButton1Click:Connect(function()if p.click_callback then p.
click_callback()end end))p.tab=t end function o._CreateTabContent(p,
q)if p.content_frame then return end if not p.tab then return end
local r=Instance.new'Frame'r.Name=p:GetName()..
'Content'r.Parent=q r.AnchorPoint=Vector2.new(1,0.5
)r.BackgroundColor3=Color3.fromRGB(26,25,33)r.
BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)
r.BorderSizePixel=0 r.Position=UDim2.new(1,0,0.5,0)
r.Size=UDim2.new(1,0,1,0)local s=Instance.new
'UIListLayout's.Parent=r s.Padding=UDim.new(0,8
)s.FillDirection=Enum.FillDirection.Horizontal s.SortOrder=
Enum.SortOrder.LayoutOrder s.HorizontalAlignment=Enum.
HorizontalAlignment.Center s.HorizontalFlex=Enum.UIFlexAlignment.Fill
s.VerticalAlignment=Enum.VerticalAlignment.Center s.
VerticalFlex=Enum.UIFlexAlignment.Fill local t=Instance.new'UIPadding'
t.Parent=r t.PaddingBottom=UDim.new(0,8)t.
PaddingRight=UDim.new(0,8)t.PaddingTop=UDim.new(0,8)p.content_frame=
r end end local p=table.create(8)p.__index=
p do function p.CreateTab(q,r,s)if not q.
tab_frame then return end local t=setmetatable({},o)t.
connections=table.create(8)t:_CreateTab(q.tab_frame.CenterSection,r,
s)t:_CreateTabContent(q.content_frame)t._CreateTab=nil t
._CreateTabContent=nil t.content_frame.Visible=false t.is_active=
false t.tab.LayoutOrder=#q.tabs table.insert(q.tabs,t)local
u=#q.tabs if not q.active_tab then q:_SetActiveTab(u)elseif
q.active_tab==1 and u==2 then q:_SetActiveTab(u)end t:
SetClickCallback(function()q:_SetActiveTab(u)end)return t end
function p.Collapse(q)if q.animating then return end if q.
collapsed then return end if not q.sidebar then return end q.collapsed=not
q.collapsed q.animating=true local r=g:Create(q
.sidebar,k,{Size=UDim2.new(0,34,1,-20),BackgroundTransparency=1}
)r:Play()if r then r.Completed:Wait()end
q.animating=false return q end function p.Expand(q)if q.
animating then return end if not q.collapsed then return end if not q.
sidebar then return end q.collapsed=not q.collapsed q.animating=true
local r=g:Create(q.sidebar,k,{Size=
UDim2.new(0,150,1,-20),BackgroundTransparency=0.4})r:Play()if
r then r.Completed:Wait()end q.animating=false return
q end function p._TrackConnection(q,r)local s=q.connections s
[#s+1]=r return r end function p._SetActiveTab(q,r)local s
=q.tabs[r]if q.active_tab then local t=q.tabs[q.
active_tab]t.is_active=false t.content_frame.Visible=false
g:Create(t.tab.glowtop1,k,{
BackgroundTransparency=1}):Play()end s.is_active=true s.content_frame.
Visible=true g:Create(s.tab.glowtop1,k,{
BackgroundTransparency=0.6}):Play()q.active_tab=r end function
p._Destroy(q)if not q or q.destroying then return end q.
destroying=true for r,s in ipairs(q.tabs)do pcall(function()s:_Destroy()
end)end for r,s in ipairs(q.connections)do if s.Connected then s:
Disconnect()end end if q.menu_toggle then pcall(function()q.menu_toggle:
_Destroy()end)end if q.search_bar then pcall(function()q.search_bar:
_Destroy()end)end if q.sidebar then pcall(function()q.sidebar:Destroy()end
)end q.tabs=nil q.connections=nil q.menu_toggle=nil q.search_bar=nil
q.settings_tab=nil q.sidebar=nil q.tab_frame=nil end function
p._CreateSidebar(q,r)if q.sidebar then return end local
s=Instance.new'Frame's.Parent=r s.AnchorPoint=Vector2.
new(0,0.5)s.BackgroundColor3=Color3.fromRGB(26,25,33)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.
BorderSizePixel=0 s.Position=UDim2.new(0,10,0.5,0)s.Size=UDim2.new(0
,34,1,-20)s.ClipsDescendants=true s.ZIndex=2 local t=Instance.
new'UIStroke't.Parent=s t.ApplyStrokeMode=Enum.ApplyStrokeMode
.Border t.Color=Color3.fromRGB(134,134,147)t.Transparency=0.8 local
u=Instance.new'UICorner'u.CornerRadius=UDim.new(0,5)
u.Parent=s s.Destroying:Once(q._Destroy)local
v=Instance.new'Frame'v.Name='Content'v.Parent=s
v.AnchorPoint=Vector2.new(0,0.5)v.BackgroundColor3=Color3.
fromRGB(26,25,33)v.BackgroundTransparency=1 v.BorderColor3=
Color3.fromRGB(0,0,0)v.BorderSizePixel=0 v.Position=UDim2.new(0,
0,0.5,0)v.Size=UDim2.new(1,0,1,0)local w=Instance.new'Frame'
w.Name='TopSection'w.Parent=v w.
AnchorPoint=Vector2.new(0.5,0)w.BackgroundColor3=Color3.fromRGB(255,
255,255)w.BackgroundTransparency=1 w.BorderColor3=Color3.
fromRGB(0,0,0)w.BorderSizePixel=0 w.Position=UDim2.new(0.5,0
,0,0)w.Size=UDim2.new(1,0,0,80)local x=Instance.new
'UIListLayout'x.Parent=w x.Padding=UDim.new(0,6)
x.SortOrder=Enum.SortOrder.LayoutOrder x.HorizontalAlignment
=Enum.HorizontalAlignment.Center x.HorizontalFlex=Enum.UIFlexAlignment
.Fill local y=Instance.new'UIPadding'y.Parent=w y.
PaddingBottom=UDim.new(0,5)y.PaddingLeft=UDim.new(0,5)y.PaddingRight
=UDim.new(0,5)y.PaddingTop=UDim.new(0,5)local z=Instance.new
'Frame'z.Name='BottomSection'z.Parent=v
z.AnchorPoint=Vector2.new(0.5,1)z.BackgroundColor3=
Color3.fromRGB(255,255,255)z.BackgroundTransparency=1
z.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel=
0 z.Position=UDim2.new(0.5,0,1,0)z.Size=UDim2.new(1,0,
0,40)local A=Instance.new'UIListLayout'A.Parent=
z A.Padding=UDim.new(0,6)A.SortOrder=Enum.
SortOrder.LayoutOrder A.HorizontalAlignment=Enum.HorizontalAlignment
.Center A.HorizontalFlex=Enum.UIFlexAlignment.Fill A.
VerticalAlignment=Enum.VerticalAlignment.Bottom local B=Instance.new
'UIPadding'B.Parent=z B.PaddingBottom=UDim.new(0,5
)B.PaddingLeft=UDim.new(0,5)B.PaddingRight=UDim.new(0,5)
B.PaddingTop=UDim.new(0,5)local C=Instance.new
'ScrollingFrame'C.Name='CenterSection'C.Parent=
v C.AutomaticCanvasSize=Enum.AutomaticSize.Y C
.Active=true C.AnchorPoint=Vector2.new(0.5,1)C.
BackgroundColor3=Color3.fromRGB(255,255,255)C.
BackgroundTransparency=1 C.BorderColor3=Color3.fromRGB(0,0,0)
C.BorderSizePixel=0 C.Position=UDim2.new(0.5,0,1,-45)
C.Size=UDim2.new(1,0,1,-130)C.
ScrollBarImageTransparency=1 C.ScrollBarThickness=0 C.
ScrollingDirection=Enum.ScrollingDirection.Y C.ScrollingEnabled=
true local D=Instance.new'UIListLayout'D.Parent=
C D.Padding=UDim.new(0,8)D.SortOrder=Enum.
SortOrder.LayoutOrder D.HorizontalAlignment=Enum.HorizontalAlignment
.Center D.HorizontalFlex=Enum.UIFlexAlignment.Fill local E=
Instance.new'UIPadding'E.Parent=C E.PaddingBottom
=UDim.new(0,5)E.PaddingLeft=UDim.new(0,5)E.PaddingRight=UDim.
new(0,5)E.PaddingTop=UDim.new(0,5)q.sidebar=s q.tab_frame=
v end function p._CreateSidebarContent(q,r)if q.
content_frame then return end if not q.sidebar then return end local
s=Instance.new'Frame's.Name='ContentFrame'
s.Parent=r s.AnchorPoint=Vector2.new(1,0.5)
s.BackgroundColor3=Color3.fromRGB(26,25,33)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)
s.BorderSizePixel=0 s.Position=UDim2.new(1,0,0.5,0)
s.Size=UDim2.new(1,-55,1,-20)q.content_frame=s end
function p._CreateMenuToggle(q)if q.menu_toggle then return end if
not q.tab_frame then return end local r=setmetatable({},o)
r.connections=table.create(8)r:_CreateTab(q.tab_frame.TopSection,
'',j.icons.Menu)r:SetClickCallback(function()if q.collapsed then q
:Expand()else q:Collapse()end end)r.tab.LayoutOrder=0 r.tab.Icon.
Size=UDim2.new(0,24,0,24)r.tab.glowtop1.Size=UDim2.new(0,24,0,24)r.
tab.TabContent.NameLabel.Text='Menu'r._CreateTab=nil r.
_CreateTabContent=nil q.menu_toggle=r end function p.
_CreateSearchBar(q)if q.search_bar then return end if not q.tab_frame then
return end local r=setmetatable({},o)r.connections=table.
create(8)r:_CreateTab(q.tab_frame.TopSection,'',j.icons.Search)
r.tab.LayoutOrder=1 r.tab.TabContent.NameLabel:Destroy()r.tab.
TabContent.UIPadding.PaddingBottom=UDim.new(0,4)r.tab.TabContent.UIPadding
.PaddingLeft=UDim.new(0,4)r.tab.TabContent.UIPadding.PaddingRight=UDim.
new(0,4)r.tab.TabContent.UIPadding.PaddingTop=UDim.new(0,4)local s
=Instance.new'Frame's.Name='Container's.Parent=r.tab.
TabContent s.AnchorPoint=Vector2.new(0.5,0.5)s.BackgroundColor3=
Color3.fromRGB(255,255,255)s.BackgroundTransparency=0.3 s.
BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0 s.Position
=UDim2.new(0.5,0,0.5,0)s.Size=UDim2.new(1,0,1,0)local t=Instance.
new'UIGradient't.Parent=s t.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(200,180,255)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(150,200,255))}t.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(1,0.9)}local
u=Instance.new'UICorner'u.CornerRadius=UDim.new(1,0)
u.Parent=s local v=Instance.new'UIPadding'v.
Parent=s v.PaddingBottom=UDim.new(0,0)v.PaddingLeft=UDim.
new(0,12)v.PaddingRight=UDim.new(0,12)v.PaddingTop=UDim.new(0,0)
local w=Instance.new'TextBox'w.Parent=s w.
AnchorPoint=Vector2.new(0.5,0.5)w.BackgroundColor3=Color3.fromRGB(255,
255,255)w.BackgroundTransparency=1 w.BorderColor3=Color3.
fromRGB(0,0,0)w.BorderSizePixel=0 w.ClearTextOnFocus=false
w.Position=UDim2.new(0.5,0,0.5,0)w.Size=UDim2.new(1,0,1,0)
w.ClipsDescendants=true w.Font='Montserrat'w.FontFace.
Weight=Enum.FontWeight.Medium w.PlaceholderText='Search'w.
PlaceholderColor3=Color3.fromRGB(200,180,200)w.Text=''w.
TextColor3=Color3.fromRGB(200,180,200)w.TextSize=14 w.
TextXAlignment=Enum.TextXAlignment.Left r:SetClickCallback(function()if
q.collapsed then q:Expand()end w:CaptureFocus()end)q:
_TrackConnection(w:GetPropertyChangedSignal'Text':Connect(function()
local x=w.Text:lower()for y,z in ipairs(q.tabs)do local
A=(z.tab.TabContent.NameLabel and z.tab.TabContent.NameLabel.Text or
''):lower()if A:find(x)then z.tab.Visible=true else z.tab.Visible
=false end end end))r._CreateTab=nil r._CreateTabContent=nil q.
search_bar=r end function p._CreateSettingsTab(q)if q.
settings_tab then return end if not q.tab_frame then return end local r
=q:CreateTab('Settings',j.icons.Settings)r.tab.Parent=q.tab_frame.
BottomSection r.tab.LayoutOrder=0 q.settings_tab=r end end local
q=table.create(8)q.__index=q setmetatable(
q,{__index=l})do function q.GetContainer(r)
return r.content_frame end function q._TrackConnection(r,s)local
t=r.connections t[#t+1]=s return s end function q._Destroy(r)
if not r or r.destroying then return end r.destroying=true for s,t
in ipairs(r.connections)do if t.Connected then t:Disconnect()end end if
r.region then pcall(function()r.region:Destroy()end)end r.connections=
nil r.region=nil end function q._CreateRegion(r,s,t)if
r.region then return end local u=t.Scroll and'ScrollingFrame'or
'Frame'local v=Instance.new(u)v.Name=t.Scroll and
'ScrollingCanvas'or'Canvas'v.Parent=s v.Active=true v.
AutomaticSize=t.AutomaticSize v.BackgroundColor3=Color3.new(255,255,
255)v.BackgroundTransparency=1 v.BorderColor3=Color3.fromRGB(0,0,0)
v.BorderSizePixel=0 v.ClipsDescendants=true v.Destroying:Once(
r._Destroy)if u=='ScrollingFrame'then v.ElasticBehavior=Enum.
ElasticBehavior.Never v.ScrollBarImageColor3=Color3.fromRGB(82,79,104)
v.ScrollBarImageTransparency=0.3 v.ScrollBarThickness=5 end local
w=Instance.new'UICorner'w.Name='CornerRadius'
w.Parent=v w.CornerRadius=t.CornerRadius if
not t.Border then r.region=v return end local x=Instance.new
'UIStroke'x.Parent=v x.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border x.Color=Color3.fromRGB(134,134,147)x.Transparency=0.8 r.
region=v end function q._CreateRegionContent(r)if r.
content_frame then return end if not r.region then return end local
s=Instance.new'Frame's.Name='ContentFrame'
s.Parent=r.region s.AnchorPoint=Vector2.new(0.5,0.5)
s.BackgroundColor3=Color3.fromRGB(26,25,33)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)
s.BorderSizePixel=0 s.Position=UDim2.new(0.5,0,0.5,0)
s.Size=UDim2.new(1,0,1,0)local t=Instance.new
'UIListLayout't.Parent=s t.Padding=UDim.new(0,4
)t.SortOrder=Enum.SortOrder.LayoutOrder local u=Instance.new
'UIPadding'u.Parent=s u.PaddingBottom=UDim.new(0,8)
u.PaddingLeft=UDim.new(0,8)u.PaddingRight=UDim.new(0,8)u.
PaddingTop=UDim.new(0,8)r.content_frame=s end end local
r=table.create(8)r.__index=r do function
r.SetText(s,t)s.label.Text=t return s end function
r._Destroy(s)if not s or s.destroying then return end s.
destroying=true if s.label then pcall(function()s.label:Destroy()end)end
s.label=nil end function r._CreateLabel(s,t,u)if s.label
then return end local v=Instance.new'TextLabel'v.Name='Label'v.
Parent=t v.AutomaticSize=Enum.AutomaticSize.XY v.BackgroundColor3=
Color3.fromRGB(255,255,255)v.BackgroundTransparency=1 v.BorderColor3=
Color3.fromRGB(0,0,0)v.BorderSizePixel=0 v.Font=u.Font v.
FontFace.Weight=u.Weight v.Text=u.Text v.TextSize=u.
TextSize v.TextColor3=Color3.fromRGB(200,180,200)v.TextXAlignment=u
.TextXAlignment v.TextYAlignment=u.TextYAlignment v.Destroying:
Once(s._Destroy)local w=Instance.new'UIPadding'w.Parent=v
w.PaddingBottom=u.Padding w.PaddingLeft=u.Padding w.
PaddingRight=u.Padding w.PaddingTop=u.Padding s.label=v
end end local s=table.create(8)s.__index=s
do function s.SetValue(t,u)local v=t.console.Source v.
Text=u return t end function s.AppendText(t,u)local v=
t.console.Source v.Text=v.Text..(v.Text~=''and'\n'or'')..u
return t end function s.Clear(t)local u=t.console.Source
u.Text=''return t end function s._Destroy(t)if not t or
t.destroying then return end t.destroying=true if t.label then pcall(
function()t.label:Destroy()end)end t.label=nil end function s.
_SourceChanged(t,u)if u~='Text'then return end wait()if t.callback then
t.callback()end if t.auto_scroll then t:_ScrollToBottom()end end
function s._ScrollToBottom(t)if not t.console then return end t
.console.CanvasPosition=Vector2.new(0,t.console.CanvasSize.Y.Offset-t.
console.AbsoluteSize.Y)end function s._CreateConsole(t,u,v)
if t.console then return end local w=Instance.new'ScrollingFrame'
w.Name='Console'w.Parent=u w.Active=true w.
BackgroundColor3=Color3.fromRGB(255,255,255)w.BackgroundTransparency=0.3
w.BorderColor3=Color3.fromRGB(0,0,0)w.BorderSizePixel=0 w.Size
=UDim2.new(1,0,0,150)w.AutomaticCanvasSize=Enum.AutomaticSize.Y w.
CanvasSize=UDim2.new(0,0,0,0)w.ElasticBehavior=Enum.ElasticBehavior.Never
w.ScrollBarImageColor3=Color3.fromRGB(26,25,33)w.
ScrollBarImageTransparency=0.3 w.ScrollBarThickness=1 w.Destroying:
Once(t._Destroy)local x=Instance.new'UIListLayout'x.
Parent=w x.FillDirection=Enum.FillDirection.Horizontal
x.SortOrder=Enum.SortOrder.LayoutOrder x.HorizontalFlex=Enum
.UIFlexAlignment.Fill local y=Instance.new'UICorner'y.
Name='CornerRadius'y.Parent=w y.CornerRadius=
v.CornerRadius local z=Instance.new'UIGradient'z.Color=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(31,30,41)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(31,30,41))}z.Parent=w local A=Instance.
new'TextBox'A.Name='Source'A.Parent=w A.AutomaticSize=
Enum.AutomaticSize.Y A.BackgroundColor3=Color3.fromRGB(255,255,255)A.
BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)A.
BorderSizePixel=0 A.ClearTextOnFocus=false A.LayoutOrder=2 A.
MultiLine=true A.Size=UDim2.new(1,0,0,0)A.TextEditable=not v.
ReadOnly A.ZIndex=13 A.FontFace=Font.fromName'Inconsolata'A.
FontFace.Weight=Enum.FontWeight.Regular A.RichText=v.RichText A.
Text=v.Value A.TextSize=14 A.TextColor3=Color3.fromRGB(200,180,
200)A.TextWrapped=v.TextWrapped A.TextXAlignment=Enum.
TextXAlignment.Left A.TextYAlignment=Enum.TextYAlignment.Top A.Changed
:Once(t._SourceChanged)local B=Instance.new'UIListLayout'
B.Parent=A B.SortOrder=Enum.SortOrder.LayoutOrder
local C=Instance.new'UIPadding'C.Parent=A C.
PaddingBottom=UDim.new(0,5)C.PaddingLeft=UDim.new(0,5)C.PaddingRight
=UDim.new(0,5)C.PaddingTop=UDim.new(0,5)local D=Instance.new
'TextBox'D.Name='Highlight'D.Parent=A D.Active=
false D.AutomaticSize=Enum.AutomaticSize.Y D.BackgroundColor3=
Color3.fromRGB(255,255,255)D.BackgroundTransparency=1 D.
BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.
ClearTextOnFocus=false D.Interactable=false D.LayoutOrder=2
D.MultiLine=true D.Size=UDim2.new(1,0,0,0)D.TextEditable
=false D.ZIndex=13 D.Selectable=false D.FontFace=Font.
fromName'Inconsolata'D.FontFace.Weight=Enum.FontWeight.Regular
D.RichText=v.RichText D.Text=''D.TextColor3=Color3.
fromRGB(255,255,255)D.TextSize=14 D.TextXAlignment=Enum.
TextXAlignment.Left D.TextYAlignment=Enum.TextYAlignment.Top local
E=Instance.new'TextLabel'E.Name='HighlightLine'
E.Parent=A E.AutomaticSize=Enum.AutomaticSize.Y
E.BackgroundColor3=Color3.fromRGB(255,255,255)E.
BackgroundTransparency=1 E.Interactable=false E.
LayoutOrder=2 E.Size=UDim2.new(1,0,0,0)E.ZIndex=13
E.FontFace=Font.fromName'Inconsolata'E.FontFace.
Weight=Enum.FontWeight.Regular E.RichText=v.RichText
E.Text=''E.TextColor3=Color3.fromRGB(255,255,255)
E.TextSize=14 E.TextWrapped=v.TextWrapped
E.TextXAlignment=Enum.TextXAlignment.Left E.
TextYAlignment=Enum.TextYAlignment.Top t.console=w t.callback=v
.Callback t.auto_scroll=v.AutoScroll end function s.
_CreateConsoleBorder(t)if not t.console then return end local u=Instance.
new'UIStroke'u.Parent=t.console u.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border u.Color=Color3.fromRGB(134,134,147)u.
Transparency=0.8 end function s._CreateConsoleLines(t)if not t.
console then return end local u=Instance.new'TextLabel'u.Name='Lines'
u.Parent=t.console u.AutomaticSize=Enum.AutomaticSize.XY u.
BackgroundColor3=Color3.fromRGB(255,255,255)u.BackgroundTransparency=1 u
.BorderColor3=Color3.fromRGB(0,0,0)u.BorderSizePixel=0 u.LayoutOrder=1
u.ZIndex=14 u.FontFace=Font.fromName'Inconsolata'u.FontFace.Weight
=Enum.FontWeight.Regular u.Text='1'u.TextColor3=Color3.fromRGB(255,255,
255)u.TextSize=14 u.TextXAlignment=Enum.TextXAlignment.Left u.
TextYAlignment=Enum.TextYAlignment.Top local v=Instance.new'UIPadding'
v.Parent=u v.PaddingBottom=UDim.new(0,5)v.
PaddingLeft=UDim.new(0,5)v.PaddingRight=UDim.new(0,5)v.
PaddingTop=UDim.new(0,5)local w=Instance.new'UIFlexItem'w.
Parent=u end end local t=table.create(8)t.
__index=t do function t.SetValue(u,v)local
w=tonumber(u.format:match'%%%.(%d)f')local x=10^w
local y=math.floor(v*x+0.5)/x if u.callback and
y~=u.value then u:callback(y)end u.raw_value=y u.
value=tostring(y)u.track.Value.Text=u.value u.grab.Position=UDim2
.new(0,u:_GetSliderOffset(),0.5,0)return u end function t.
_TrackConnection(u,v)local w=u.connections w[#w+1]=v return v end
function t._Destroy(u)if not u or u.destroying then return
end u.destroying=true for v,w in ipairs(u.connections)do if w.
Connected then w:Disconnect()end end if u.sliderfloat then pcall(function(
)u.sliderfloat:Destroy()end)end u.connections=nil u.sliderfloat=nil end
function t._Update(u,v)local w=v.Position.X local
x,y=u:_GetValueFromMouse(w)local z=tonumber(u.
format:match'%%%.(%d)f')local A=10^z local B=math.
floor(x*A+0.5)/A if u.callback and B~=u.value
then u:callback(B)end u.raw_value=B u.value=tostring(
B)u.track.Value.Text=u.value u.grab.Position=UDim2.new(0,y,
0.5,0)end function t._GetValueFromMouse(u,v)local w=u.
min or 0 local x=u.max or 100 local y=u.track.AbsolutePosition.X
local z=u.track.AbsoluteSize.X local A=u.grab.
AbsoluteSize.X local B=u.grab.AnchorPoint.X if z<=0 then
return w,0 end local C=A*B local D=z
-A local E=v-y E=math.clamp(E,
C,D)local F=(E-C)/(D-C)local
G=w+(x-w)*F return G,E end function t.
_GetSliderOffset(u)local v=u.raw_value local w=u.min or 0 local x=
u.max or 100 local y=u.track.AbsoluteSize.X local z=
u.grab.AbsoluteSize.X local A=u.grab.AnchorPoint.X if y<=
0 then return 0 end local B=z*A local C=
y-z/A local D=(v-w)/(x-w)D=math.
clamp(D,0,1)local E=B+(C-B)*D return
E end function t._CreateSliderFloat(u,v,w)if u
.sliderfloat then return end u.min=w.Minimum u.max=w.Maximum
u.format=w.Format u.raw_value=w.Value u.value=string.format(
w.Format,w.Value)u.callback=w.Callback local x=
Instance.new'Frame'x.Name='SliderFloat'x.Parent=v
x.BackgroundColor3=Color3.fromRGB(255,255,255)x.
BackgroundTransparency=1 x.BorderColor3=Color3.fromRGB(0,0,0)
x.BorderSizePixel=0 x.Size=UDim2.new(1,0,0,20)x.
Destroying:Once(u._Destroy)local y=Instance.new'UIListLayout'
y.Parent=x y.Padding=UDim.new(0,4)y.
FillDirection=Enum.FillDirection.Horizontal y.SortOrder=Enum.SortOrder
.LayoutOrder y.HorizontalAlignment=Enum.HorizontalAlignment.Center
y.HorizontalFlex=Enum.UIFlexAlignment.Fill y.
VerticalAlignment=Enum.VerticalAlignment.Center y.VerticalFlex=Enum.
UIFlexAlignment.Fill local z=Instance.new'TextButton'z.Name='Track'
z.Parent=x z.AutoButtonColor=false z.BackgroundColor3=
Color3.fromRGB(255,255,255)z.BackgroundTransparency=0.3 z.BorderColor3=
Color3.fromRGB(0,0,0)z.BorderSizePixel=0 z.Size=UDim2.new(0.5,0,1,0)
z.Font='Montserrat'z.FontFace.Weight=Enum.FontWeight.Medium z.Text=
''z.TextTransparency=1 local A=Instance.new'UICorner'
A.Parent=z A.CornerRadius=UDim.new(0,2)local
B=Instance.new'UIGradient'B.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(
0.5,Color3.fromRGB(25,23,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,
41))}B.Parent=z local C=Instance.new'UIPadding'C.Parent
=z C.PaddingBottom=UDim.new(0,2)C.PaddingLeft=UDim.new(0,2)
C.PaddingRight=UDim.new(0,2)C.PaddingTop=UDim.new(0,2)local D=
Instance.new'UIStroke'D.Parent=z D.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border D.Color=Color3.fromRGB(134,134,147)D.
Transparency=0.8 local E=Instance.new'TextLabel'E.Name='Value'E.
Parent=z E.BackgroundColor3=Color3.fromRGB(255,255,255)E.
BackgroundTransparency=1 E.BorderColor3=Color3.fromRGB(0,0,0)E.
BorderSizePixel=0 E.Size=UDim2.new(1,0,1,0)E.ZIndex=2 E.
ClipsDescendants=true E.Font='Montserrat'E.FontFace.Weight=Enum.
FontWeight.Medium E.Text=u.value E.TextColor3=Color3.fromRGB(200,180,
200)E.TextSize=14 local F=Instance.new'TextLabel'F.Name='Label'
F.Parent=x F.AutomaticSize=Enum.AutomaticSize.XY F.
BackgroundColor3=Color3.fromRGB(255,255,255)F.BackgroundTransparency=1 F
.BorderColor3=Color3.fromRGB(0,0,0)F.BorderSizePixel=0 F.LayoutOrder=1
F.Size=UDim2.new(0,5,0,5)F.Font='Montserrat'F.FontFace.Weight=Enum.
FontWeight.Medium F.Text=w.Label F.TextColor3=Color3.fromRGB(200,
180,200)F.TextSize=14 F.TextXAlignment=Enum.TextXAlignment.Left u:
_TrackConnection(z.InputBegan:Connect(function(G)if G.UserInputType
~=Enum.UserInputType.MouseButton1 then return end u.dragging=true u:
_Update(G)end))u:_TrackConnection(z.MouseEnter:Connect(function()if
not u.grab then return end g:Create(u.grab,k,{
BackgroundTransparency=0}):Play()end))u:_TrackConnection(z.MouseLeave:
Connect(function()if not u.grab then return end g:Create(u.
grab,k,{BackgroundTransparency=0.3}):Play()end))u:
_TrackConnection(h.InputChanged:Connect(function(G)if not
u.dragging or G.UserInputType~=Enum.UserInputType.MouseMovement then
return end u:_Update(G)end))u:_TrackConnection(h.
InputEnded:Connect(function(G)if G.UserInputType~=Enum.UserInputType.
MouseButton1 then return end u.dragging=false end))u.sliderfloat=
x u.track=z end function t._CreateSliderGrab(u)
if u.grab then return end if not u.sliderfloat then return end local
v=Instance.new'Frame'v.Name='Overlay'v.Parent=u.track
v.AnchorPoint=Vector2.new(0.5,0.5)v.BackgroundColor3=Color3.fromRGB(
255,255,255)v.BackgroundTransparency=1 v.BorderColor3=Color3.
fromRGB(0,0,0)v.BorderSizePixel=0 v.Position=UDim2.new(0.5,0,0.5,0)
v.Size=UDim2.new(1,0,1,8)v.ClipsDescendants=true local w=Instance
.new'Frame'w.Name='Grab'w.Parent=v w.AnchorPoint=Vector2.new(
0.5,0.5)w.BackgroundColor3=Color3.fromRGB(255,255,255)w.
BackgroundTransparency=0.3 w.BorderSizePixel=0 w.Position=UDim2.new(0,0,
0.5,0)w.Size=UDim2.new(0,10,1,-8)local x=Instance.new'UIStroke'x.
Parent=w x.ApplyStrokeMode=Enum.ApplyStrokeMode.Border x.Color=
Color3.fromRGB(233,173,234)x.Transparency=0.8 local y=Instance.
new'UICorner'y.Parent=w y.CornerRadius=UDim.new(0,2
)local z=Instance.new'UIGradient'z.Parent=w z.Color=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(233,173,234))}local A=
Instance.new'UISizeConstraint'A.MaxSize=Vector2.new(math.huge,math.
huge)A.MinSize=Vector2.new(10,0)local B=Instance.new
'ImageLabel'B.Name='glowbottom'B.Parent=w B.
AnchorPoint=Vector2.new(0.5,1)B.BackgroundColor3=Color3.fromRGB(255,255
,255)B.BackgroundTransparency=1 B.BorderColor3=Color3.fromRGB(
0,0,0)B.BorderSizePixel=0 B.Position=UDim2.new(0.5,0,1,4)
B.Size=UDim2.new(1,50,0,4)B.ZIndex=4 B.Image=
'rbxassetid://76150694119616'local C=Instance.new'UIGradient'
C.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
144,98,135)),ColorSequenceKeypoint.new(0.28,Color3.fromRGB(189,134,185)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,173,234)),ColorSequenceKeypoint
.new(0.72,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(144,98,135))}C.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.03,0.86),NumberSequenceKeypoint.new(0.06,0.69),
NumberSequenceKeypoint.new(0.11,0.53),NumberSequenceKeypoint.new(0.15,0.43),
NumberSequenceKeypoint.new(0.2,0.31),NumberSequenceKeypoint.new(0.27,0.18),
NumberSequenceKeypoint.new(0.33,0.09),NumberSequenceKeypoint.new(0.39,0.04),
NumberSequenceKeypoint.new(0.45,0.01),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(0.56,0.01),NumberSequenceKeypoint.new(0.61,0.04),
NumberSequenceKeypoint.new(0.67,0.11),NumberSequenceKeypoint.new(0.73,0.21),
NumberSequenceKeypoint.new(0.78,0.34),NumberSequenceKeypoint.new(0.86,0.52),
NumberSequenceKeypoint.new(0.93,0.72),NumberSequenceKeypoint.new(1,1)}C
.Parent=B local D=Instance.new'ImageLabel'D.
Name='glowbottom_2'D.Parent=w D.AnchorPoint=Vector2.
new(0.5,1)D.BackgroundColor3=Color3.fromRGB(255,255,255)D.
BackgroundTransparency=1 D.BorderColor3=Color3.fromRGB(0,0,0)
D.BorderSizePixel=0 D.Position=UDim2.new(0.5,0,1,4)
D.Size=UDim2.new(1,50,0,4)D.ZIndex=4 D.Image=
'rbxassetid://76150694119616'local E=Instance.new'UIGradient'
E.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
144,98,135)),ColorSequenceKeypoint.new(0.28,Color3.fromRGB(189,134,185)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,173,234)),ColorSequenceKeypoint
.new(0.72,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(144,98,135))}E.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.03,0.86),NumberSequenceKeypoint.new(0.06,0.69),
NumberSequenceKeypoint.new(0.11,0.53),NumberSequenceKeypoint.new(0.15,0.43),
NumberSequenceKeypoint.new(0.2,0.31),NumberSequenceKeypoint.new(0.27,0.18),
NumberSequenceKeypoint.new(0.33,0.09),NumberSequenceKeypoint.new(0.39,0.04),
NumberSequenceKeypoint.new(0.45,0.01),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(0.56,0.01),NumberSequenceKeypoint.new(0.61,0.04),
NumberSequenceKeypoint.new(0.67,0.11),NumberSequenceKeypoint.new(0.73,0.21),
NumberSequenceKeypoint.new(0.78,0.34),NumberSequenceKeypoint.new(0.86,0.52),
NumberSequenceKeypoint.new(0.93,0.72),NumberSequenceKeypoint.new(1,1)}E
.Parent=D local F=Instance.new'ImageLabel'F.
Name='glowbottom_3'F.Parent=w F.AnchorPoint=Vector2.
new(0.5,1)F.BackgroundColor3=Color3.fromRGB(255,255,255)F.
BackgroundTransparency=1 F.BorderColor3=Color3.fromRGB(0,0,0)
F.BorderSizePixel=0 F.Position=UDim2.new(0.5,0,1,4)
F.Size=UDim2.new(1,50,0,4)F.ZIndex=4 F.Image=
'rbxassetid://76150694119616'local G=Instance.new'UIGradient'
G.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
144,98,135)),ColorSequenceKeypoint.new(0.28,Color3.fromRGB(189,134,185)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,173,234)),ColorSequenceKeypoint
.new(0.72,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(144,98,135))}G.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(1,1),
NumberSequenceKeypoint.new(1,1)}G.Parent=F local
H=Instance.new'ImageLabel'H.Name='glowbottom_4'
H.Parent=w H.AnchorPoint=Vector2.new(0.5,1)H
.BackgroundColor3=Color3.fromRGB(255,255,255)H.BackgroundTransparency
=1 H.BorderColor3=Color3.fromRGB(0,0,0)H.BorderSizePixel=0
H.Position=UDim2.new(0.5,0,1,4)H.Size=UDim2.new(1,50,0,4)
H.ZIndex=4 H.Image='rbxassetid://76150694119616'local
I=Instance.new'UIGradient'I.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(144,98,135)),ColorSequenceKeypoint.
new(0.28,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(0.5,Color3.
fromRGB(223,173,234)),ColorSequenceKeypoint.new(0.72,Color3.fromRGB(189,134,185)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(144,98,135))}I.
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(1,1),NumberSequenceKeypoint.new(1,1)}I.
Parent=H task.defer(function()w.Position=UDim2.new(0,u:
_GetSliderOffset(),0.5,0)end)u.grab=w end end local u=table.
create(8)u.__index=u do function u.
SetValue(v,w)v:_ChangeValue(w)return v end function u.
Toggle(v)v:_ChangeValue(not v.value)return v end function u.
_TrackConnection(v,w)local x=v.connections x[#x+1]=w return w end
function u._Destroy(v)if not v or v.destroying then return end
v.destroying=true for w,x in ipairs(v.connections)do if x.Connected
then x:Disconnect()end end if v.checkbox then pcall(function()v.
checkbox:Destroy()end)end v.connections=nil v.checkbox=nil end function
u._ChangeValue(v,w)if w==v.value then return end if not
v.tick then return end if w then g:Create(v.tick,
k,{BackgroundTransparency=0.3,Size=UDim2.new(1,0,1,0)}):Play()
g:Create(v.tick.UICorner,k,{CornerRadius=UDim.
new(0,2)}):Play()g:Create(v.tick.UIStroke,k,{
Transparency=0.8}):Play()g:Create(v.tick.glowtop,
k,{ImageTransparency=0}):Play()g:Create(v.tick.
glowtop_2,k,{ImageTransparency=0}):Play()else g:
Create(v.tick,k,{BackgroundTransparency=1,Size=UDim2.new(0,0,
0,0)}):Play()g:Create(v.tick.UICorner,k,{
CornerRadius=UDim.new(1,0)}):Play()g:Create(v.tick.UIStroke,
k,{Transparency=1}):Play()g:Create(v.tick.glowtop
,k,{ImageTransparency=1}):Play()g:Create(v.tick.
glowtop_2,k,{ImageTransparency=1}):Play()end if v.callback
then v:callback(w)end v.value=w end function u.
_CreateCheckbox(v,w,x)if v.checkbox then return end v.value=x
.Value v.callback=x.Callback local y=Instance.new'TextButton'
y.Name='Checkbox'y.Parent=w y.AutoButtonColor=false
y.AutomaticSize=Enum.AutomaticSize.XY y.BackgroundColor3=Color3.
fromRGB(255,255,255)y.BackgroundTransparency=1 y.BorderColor3=
Color3.fromRGB(0,0,0)y.BorderSizePixel=0 y.Size=UDim2.new(0,10,0,0
)y.Text=''y.TextTransparency=1 y.Destroying:Once(v.
_Destroy)local z=Instance.new'UIListLayout'z.Parent=
y z.Padding=UDim.new(0,5)z.FillDirection=Enum.
FillDirection.Horizontal z.SortOrder=Enum.SortOrder.LayoutOrder
z.VerticalAlignment=Enum.VerticalAlignment.Center local A=
Instance.new'ImageButton'A.Name='Tickbox'A.Parent=y A
.AutoButtonColor=false A.BackgroundColor3=Color3.fromRGB(255,255,255)
A.BackgroundTransparency=0.3 A.BorderColor3=Color3.fromRGB(0,0,0)
A.BorderSizePixel=0 A.Size=UDim2.new(0,20,0,20)A.Image=''
A.Selectable=false local B=Instance.new'UICorner'
B.Parent=A B.CornerRadius=UDim.new(0,5)local
C=Instance.new'UIGradient'C.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(
0.5,Color3.fromRGB(25,23,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,
41))}C.Parent=A local D=Instance.new'UIPadding'D.
Parent=A D.PaddingBottom=UDim.new(0,3)D.PaddingLeft=UDim.new(0
,3)D.PaddingRight=UDim.new(0,3)D.PaddingTop=UDim.new(0,3)local
E=Instance.new'UIStroke'E.Parent=A E.ApplyStrokeMode=Enum
.ApplyStrokeMode.Border E.Color=Color3.fromRGB(134,134,147)E.
Transparency=0.8 local F=Instance.new'TextLabel'F.Name='Label'F.
Parent=y F.AutomaticSize=Enum.AutomaticSize.XY F.BackgroundColor3
=Color3.fromRGB(255,255,255)F.BackgroundTransparency=1 F.BorderColor3=
Color3.fromRGB(0,0,0)F.BorderSizePixel=0 F.LayoutOrder=1 F.Size=
UDim2.new(0,5,0,5)F.Font='Montserrat'F.FontFace.Weight=Enum.FontWeight.
Medium F.Text=x.Label F.TextColor3=Color3.fromRGB(200,180,200)F
.TextSize=14 F.TextXAlignment=Enum.TextXAlignment.Left v:
_TrackConnection(A.MouseEnter:Connect(function()if not v.tick then
return end g:Create(v.tick,k,{
BackgroundTransparency=0}):Play()end))v:_TrackConnection(A.MouseLeave:
Connect(function()if not v.tick then return end g:Create(v.
tick,k,{BackgroundTransparency=0.3}):Play()end))v:
_TrackConnection(A.MouseButton1Click:Connect(function()if not v.tick
then return end v:Toggle()end))v.checkbox=y end function
u._CreateTick(v)if v.tick then return end if not v.checkbox
then return end local w=Instance.new'Frame'w.Name='Tick'w
.Parent=v.checkbox.Tickbox w.AnchorPoint=Vector2.new(0.5,0.5)w.
BackgroundColor3=Color3.fromRGB(255,255,255)w.BackgroundTransparency=0.3
w.BorderColor3=Color3.fromRGB(0,0,0)w.BorderSizePixel=0 w.
Interactable=false w.LayoutOrder=1 w.Position=UDim2.new(0.5,0,0.5,
0)w.Size=UDim2.new(1,0,1,0)local x=Instance.new'UIStroke'x.
Parent=w x.ApplyStrokeMode=Enum.ApplyStrokeMode.Border x.Color=
Color3.fromRGB(233,173,234)x.Transparency=0.8 local y=Instance.
new'UICorner'y.Parent=w y.CornerRadius=UDim.
new(0,2)local z=Instance.new'UIGradient'z.Parent=w
z.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(223,
142,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(233,173,234))}local A
=Instance.new'ImageLabel'A.Name='glowtop'A.Parent=w A
.AnchorPoint=Vector2.new(0.5,0.5)A.BackgroundColor3=Color3.fromRGB(255,255
,255)A.BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)
A.BorderSizePixel=0 A.Position=UDim2.new(0.5,0,0.5,0)A.Size=
UDim2.new(1,10,1,10)A.ZIndex=4 A.Image='rbxassetid://76150694119616'
local B=Instance.new'UIGradient'B.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.
new(0.5,Color3.fromRGB(223,142,255)),ColorSequenceKeypoint.new(0.74,Color3.
fromRGB(148,189,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}
B.Parent=A local C=Instance.new'UICorner'
C.Parent=A local D=Instance.new'ImageLabel'
D.Name='glowtop_2'D.Parent=w D.AnchorPoint=
Vector2.new(0.5,0.5)D.BackgroundColor3=Color3.fromRGB(255,255,255)
D.BackgroundTransparency=1 D.BorderColor3=Color3.fromRGB(0,0,0)
D.BorderSizePixel=0 D.Position=UDim2.new(0.5,0,0.5,0)D.
Size=UDim2.new(1,10,1,10)D.ZIndex=4 D.Image=
'rbxassetid://76150694119616'local E=Instance.new'UIGradient'
E.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}E.Parent=
D local F=Instance.new'UICorner'F.Parent=
D v.tick=w end end local v=table.create(8)
v.__index=v do function v.SetClickCallback(w,
x)w.callback=x return w end function v.
_TrackConnection(w,x)local y=w.connections y[#y+1]=x return x end
function v._Destroy(w)if not w or w.destroying then return end
w.destroying=true for x,y in ipairs(w.connections)do if y.Connected
then y:Disconnect()end end if w.button then pcall(function()w.button:
Destroy()end)end w.connections=nil w.button=nil end function v.
_SetButtonStyle(w,x)if not w.button then return end w.style=string.
lower(x)local y=w.button.UIGradient if w.style=='primary'then
y.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(144,
98,135)),ColorSequenceKeypoint.new(0.2,Color3.fromRGB(189,134,185)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,173,234)),ColorSequenceKeypoint
.new(0.8,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(144,98,135))}y.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.3),NumberSequenceKeypoint.new(1,0.3)}elseif w.
style=='secondary'then y.Color=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(223,173,234)),ColorSequenceKeypoint.new(0.2,Color3.fromRGB(
189,134,185)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(125,99,134)),
ColorSequenceKeypoint.new(0.8,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint
.new(1,Color3.fromRGB(223,173,234))}y.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.8),NumberSequenceKeypoint.new(0.5,0.6),
NumberSequenceKeypoint.new(1,0.8)}end end function v._CreateButton(w
,x,y)if w.button then return end w.callback=y.Callback local
z=Instance.new'TextButton'z.Name='Button'z.Parent=x z
.AutoButtonColor=false z.AutomaticSize=Enum.AutomaticSize.XY z.
BackgroundColor3=Color3.fromRGB(255,255,255)z.BackgroundTransparency=0
z.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel=0 z.Size=
UDim2.new(1,0,0,20)z.Text=''z.TextTransparency=1 z.Destroying:
Once(w._Destroy)local A=Instance.new'UIStroke'A.Parent=z
A.ApplyStrokeMode=Enum.ApplyStrokeMode.Border A.Color=Color3.fromRGB(
123,92,126)local B=Instance.new'UICorner'B.Parent=
z B.CornerRadius=UDim.new(0,2)local C=Instance.new
'UIGradient'C.Parent=z C.Rotation=90 local D=
Instance.new'UIListLayout'D.Parent=z D.SortOrder=Enum
.SortOrder.LayoutOrder D.HorizontalAlignment=Enum.HorizontalAlignment.
Center D.VerticalAlignment=Enum.VerticalAlignment.Center local E
=Instance.new'UIPadding'E.Parent=z E.PaddingBottom=UDim.new(0
,3)E.PaddingLeft=UDim.new(0,4)E.PaddingRight=UDim.new(0,4)E.
PaddingTop=UDim.new(0,3)local F=Instance.new'TextLabel'F.Name='Label'
F.Parent=z F.AutomaticSize=Enum.AutomaticSize.XY F.
BackgroundColor3=Color3.fromRGB(255,255,255)F.BackgroundTransparency=1 F
.BorderColor3=Color3.fromRGB(0,0,0)F.BorderSizePixel=0 F.LayoutOrder=1
F.Size=UDim2.new(0,5,0,5)F.Font='Montserrat'F.FontFace.Weight=Enum.
FontWeight.Medium F.Text=y.Text F.TextColor3=Color3.fromRGB(255,255
,255)F.TextSize=12 F.TextXAlignment=Enum.TextXAlignment.Left w:
_TrackConnection(z.MouseEnter:Connect(function()if not w.button then
return end g:Create(w.button.UIStroke,k,{Color=
Color3.fromRGB(184,138,189)}):Play()end))w:_TrackConnection(z.MouseLeave
:Connect(function()if not w.button then return end g:Create(w.
button.UIStroke,k,{Color=Color3.fromRGB(123,92,126)}):Play()end)
)w:_TrackConnection(z.MouseButton1Down:Connect(function()if not w.
button then return end g:Create(w.button,k,{
BackgroundTransparency=0.3}):Play()end))w:_TrackConnection(z.
MouseButton1Up:Connect(function()if not w.button then return end
g:Create(w.button,k,{BackgroundTransparency=0}):
Play()end))w:_TrackConnection(z.MouseButton1Click:Connect(function()if
not w.button then return end if w.callback then w:callback()end end))
w.button=z end end local w=table.create(8)w.
__index=w do function w.SetValue(x,y)x.value=y
x.keybind.Display.Value.Text=x:_GetStringForKeyCode(y)if x.callback
then x:callback(y)end return x end function w.
_TrackConnection(x,y)local z=x.connections z[#z+1]=y return y end
function w._Destroy(x)if not x or x.destroying then return end
x.destroying=true for y,z in ipairs(x.connections)do if z.Connected
then z:Disconnect()end end if x.keybind then pcall(function()x.keybind:
Destroy()end)end x.connections=nil x.keybind=nil end function
w._GetStringForKeyCode(x,y)local z=y.Name z=z:
gsub('Left','L'):gsub('Right','R'):gsub('Control','Ctrl')return z end
function w._CreateKeybind(x,y,z)if x.keybind then return
end x.value=z.Value x.callback=z.Callback local A=Instance
.new'Frame'A.Name='Keybind'A.Parent=y A.
BackgroundColor3=Color3.fromRGB(255,255,255)A.BackgroundTransparency=1
A.BorderColor3=Color3.fromRGB(0,0,0)A.BorderSizePixel=0 A.Size
=UDim2.new(1,0,0,20)A.Destroying:Once(x._Destroy)local B=
Instance.new'UIListLayout'B.Parent=A B.Padding=UDim.
new(0,4)B.FillDirection=Enum.FillDirection.Horizontal B.
SortOrder=Enum.SortOrder.LayoutOrder B.HorizontalAlignment=Enum.
HorizontalAlignment.Left B.HorizontalFlex=Enum.UIFlexAlignment.None
B.VerticalAlignment=Enum.VerticalAlignment.Center B.
VerticalFlex=Enum.UIFlexAlignment.Fill local C=Instance.new'TextLabel'
C.Name='Label'C.Parent=A C.AutomaticSize=Enum.AutomaticSize.XY
C.BackgroundColor3=Color3.fromRGB(255,255,255)C.BackgroundTransparency=1
C.BorderColor3=Color3.fromRGB(0,0,0)C.BorderSizePixel=0 C.Size=UDim2
.new(0,5,0,5)C.Font='Montserrat'C.FontFace.Weight=Enum.FontWeight.Medium
C.Text=z.Label C.TextColor3=Color3.fromRGB(200,180,200)C.
TextSize=14 C.TextXAlignment=Enum.TextXAlignment.Left local D=Instance
.new'TextButton'D.Name='Display'D.Parent=A D.
AutoButtonColor=false D.AutomaticSize=Enum.AutomaticSize.X D.
BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=0.3
D.BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.
LayoutOrder=1 D.Size=UDim2.new(0,0,1,0)D.Text=''D.
TextTransparency=1 local E=Instance.new'UICorner'E.
Parent=D E.CornerRadius=UDim.new(0,2)local F=Instance.
new'UIGradient'F.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,41))}F.Parent=D
local G=Instance.new'UIPadding'G.Parent=D G.
PaddingBottom=UDim.new(0,2)G.PaddingLeft=UDim.new(0,8)G.PaddingRight
=UDim.new(0,8)G.PaddingTop=UDim.new(0,2)local H=Instance.new
'UIStroke'H.Parent=D H.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border H.Color=Color3.fromRGB(134,134,147)H.Transparency=0.8 local
I=Instance.new'TextLabel'I.Name='Value'I.Parent=D I.
AutomaticSize=Enum.AutomaticSize.X I.BackgroundColor3=Color3.fromRGB(255,255
,255)I.BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0,0)
I.BorderSizePixel=0 I.Size=UDim2.new(0,0,1,0)I.ZIndex=2 I.
ClipsDescendants=true I.Font='Montserrat'I.FontFace.Weight=Enum.
FontWeight.Medium I.Text=x:_GetStringForKeyCode(x.value)I.
TextColor3=Color3.fromRGB(200,180,200)I.TextSize=14 x:_TrackConnection(
D.MouseButton1Click:Connect(function()if x.listening then return end
x.listening=true x.new_value=nil I.Text='_'while x.listening do
I.Text=I.Text==' 'and'_'or' 'task.wait(0.5)end end))x:
_TrackConnection(h.InputBegan:Connect(function(J,K)
if K or J.UserInputType~=Enum.UserInputType.Keyboard then return end
if x.listening then x.new_value=J.KeyCode x.listening=false if not
x.new_value then return end x.value=x.new_value I.Text=x:
_GetStringForKeyCode(x.new_value)end if J.KeyCode==x.value and x.
callback then x:callback(x.value)end end))x.keybind=A end end
local x=table.create(8)x.__index=x do function
x.GetItems(y)return y.items end function x.Clear(y)table.
clear(y.items)y:_RefreshItems()end function x.AddItem(y,z)table
.insert(y.items,z)y:_RefreshItems()end function x.Expand(y)if
not y.collapsed then return end g:Create(y.combo.Display.Arrow
,k,{Rotation=90}):Play()y.dropdown.Visible=true y.
collapsed=false end function x.Collapse(y)if y.collapsed then return
end g:Create(y.combo.Display.Arrow,k,{Rotation=
180}):Play()y.dropdown.Visible=false y.collapsed=true end function
x.SetValue(y,z)y:_ChangeValue(z)return y end function
x.GetValue(y)return y.value end function x.
_TrackConnection(y,z)local A=y.connections A[#A+1]=z return z end
function x._Destroy(y)if not y or y.destroying then return end
y.destroying=true for z,A in ipairs(y.connections)do if A.Connected
then A:Disconnect()end end if y.combo then pcall(function()y.combo:
Destroy()end)end y.connections=nil y.combo=nil end function x.
_ClearDropdown(y)if not y.dropdown then return end for z,A in ipairs(y.
dropdown:GetChildren())do if not A:IsA'TextButton'then continue end A:Destroy(
)end end function x._ChangeValue(y,z)if not y.combo then return
end y.combo.Display.Value.Text=z y.value=z if y.callback then
y:callback(z)end end function x._RefreshItems(y)if not y.
dropdown then return end y:_ClearDropdown()for z,A in ipairs(y.items)do
local B=Instance.new'TextButton'B.Name=A B.Parent=y.dropdown B.
AutoButtonColor=false B.BackgroundColor3=Color3.fromRGB(255,255,255)B.
BackgroundTransparency=1 B.BorderColor3=Color3.fromRGB(0,0,0)B.
BorderSizePixel=0 B.LayoutOrder=z B.Size=UDim2.new(1,0,0,20)B.
ClipsDescendants=true B.Text=''B.TextTransparency=1 local C=Instance.
new'TextLabel'C.Name='Value'C.Parent=B C.BackgroundColor3=
Color3.fromRGB(255,255,255)C.BackgroundTransparency=1 C.BorderColor3=
Color3.fromRGB(0,0,0)C.BorderSizePixel=0 C.Size=UDim2.new(1,0,1,0)C.
ClipsDescendants=true C.Font='Montserrat'C.FontFace.Weight=Enum.
FontWeight.Medium C.TextXAlignment=Enum.TextXAlignment.Left C.Text=A
C.TextTruncate=Enum.TextTruncate.SplitWord C.TextColor3=Color3.fromRGB(
200,180,200)C.TextSize=14 B.MouseButton1Click:Once(function()y:
Collapse()y:_ChangeValue(C.Text)end)end end function x.
_CreateCombo(y,z,A)if y.combo then return end y.value=A.
Placeholder y.items=A.Items y.callback=A.Callback local B=
Instance.new'Frame'B.Name='Combo'B.Parent=z B.
BackgroundColor3=Color3.fromRGB(255,255,255)B.BackgroundTransparency=1 B
.BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.Size=UDim2.new(
1,0,0,20)B.ZIndex=99 B.Destroying:Once(y._Destroy)local C=
Instance.new'UIListLayout'C.Parent=B C.Padding=UDim.
new(0,4)C.FillDirection=Enum.FillDirection.Horizontal C.
SortOrder=Enum.SortOrder.LayoutOrder C.HorizontalAlignment=Enum.
HorizontalAlignment.Center C.HorizontalFlex=Enum.UIFlexAlignment.Fill
C.VerticalAlignment=Enum.VerticalAlignment.Center C.
VerticalFlex=Enum.UIFlexAlignment.Fill local D=Instance.new'TextButton'
D.Name='Display'D.Parent=B D.AutoButtonColor=false D
.BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=0.3
D.BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.Size
=UDim2.new(0.5,0,1,0)D.Text=''D.TextTransparency=1 local
E=Instance.new'UICorner'E.Parent=D E
.CornerRadius=UDim.new(0,2)local F=Instance.new'UIGradient'F.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(31,30,41)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(31,30,41))}F.Parent=D local G=Instance.
new'UIPadding'G.Parent=D G.PaddingBottom=UDim.new(0,2)
G.PaddingLeft=UDim.new(0,4)G.PaddingRight=UDim.new(0,2)G.
PaddingTop=UDim.new(0,2)local H=Instance.new'UIStroke'H.Parent=
D H.ApplyStrokeMode=Enum.ApplyStrokeMode.Border H.Color=Color3.
fromRGB(134,134,147)H.Transparency=0.8 local I=Instance.new'TextLabel'
I.Name='Value'I.Parent=D I.BackgroundColor3=Color3.fromRGB(
255,255,255)I.BackgroundTransparency=1 I.BorderColor3=Color3.fromRGB(0,0
,0)I.BorderSizePixel=0 I.Size=UDim2.new(1,-15,1,0)I.ZIndex=2 I.
ClipsDescendants=true I.Font='Montserrat'I.FontFace.Weight=Enum.
FontWeight.Medium I.TextXAlignment=Enum.TextXAlignment.Left I.Text=y.
value I.TextTruncate=Enum.TextTruncate.SplitWord I.TextColor3=Color3.
fromRGB(200,180,200)I.TextSize=14 local J=Instance.new'ImageLabel'
J.Name='Arrow'J.Parent=D J.AnchorPoint=Vector2.new(1,0.5)J
.BackgroundColor3=Color3.fromRGB(255,255,255)J.BackgroundTransparency=1
J.Position=UDim2.new(1,0,0.5,0)J.Rotation=180 J.Size=UDim2.new(0,15,
0,15)J.ZIndex=1 J.Image='rbxassetid://4731371527'local K=Instance.
new'TextLabel'K.Name='Label'K.Parent=B K.AutomaticSize=Enum.
AutomaticSize.XY K.BackgroundColor3=Color3.fromRGB(255,255,255)K.
BackgroundTransparency=1 K.BorderColor3=Color3.fromRGB(0,0,0)K.
BorderSizePixel=0 K.LayoutOrder=1 K.Size=UDim2.new(0,5,0,5)K.Font=
'Montserrat'K.FontFace.Weight=Enum.FontWeight.Medium K.Text=A.Label
K.TextColor3=Color3.fromRGB(200,180,200)K.TextSize=14 K.
TextXAlignment=Enum.TextXAlignment.Left y:_TrackConnection(D.
MouseButton1Click:Connect(function()if not y.dropdown then return end if y
.collapsed then y:Expand()else y:Collapse()end y:_RefreshItems()end))
y.combo=B y.collapsed=true end function x.
_CreateDropdownMenu(y)if y.dropdown then return end if not y.combo then
return end local z=Instance.new'Frame'z.Name='Dropdown'z.
Parent=y.combo.Display z.AnchorPoint=Vector2.new(0.5,0)z.
AutomaticSize=Enum.AutomaticSize.Y z.BackgroundColor3=Color3.fromRGB(255,
255,255)z.BackgroundTransparency=0.3 z.BorderColor3=Color3.
fromRGB(0,0,0)z.BorderSizePixel=0 z.Visible=false z.
Position=UDim2.new(0.5,0,1,4)z.Size=UDim2.new(1,0,0,0)local A=
Instance.new'UIListLayout'A.Parent=z A.
FillDirection=Enum.FillDirection.Vertical A.SortOrder=Enum.SortOrder.
LayoutOrder A.HorizontalAlignment=Enum.HorizontalAlignment.Left
A.HorizontalFlex=Enum.UIFlexAlignment.Fill A.
VerticalAlignment=Enum.VerticalAlignment.Top A.VerticalFlex=Enum.
UIFlexAlignment.None local B=Instance.new'UICorner'B.
Parent=z B.CornerRadius=UDim.new(0,2)local C=Instance.
new'UIGradient'C.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,41))}C.Parent=z
local D=Instance.new'UIPadding'D.Parent=z D.
PaddingBottom=UDim.new(0,2)D.PaddingLeft=UDim.new(0,4)D.PaddingRight
=UDim.new(0,2)D.PaddingTop=UDim.new(0,2)local E=Instance.new
'UIStroke'E.Parent=z E.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border E.Color=Color3.fromRGB(134,134,147)E.Transparency=0.8 y.
dropdown=z end end local y=table.create(8)y.
__index=y do function y._CreateSeparator(z,A)if
z.separator then return end local B=Instance.new'Frame'B.
Name='Separator'B.Parent=A B.AutomaticSize=Enum.
AutomaticSize.Y B.BackgroundColor3=Color3.fromRGB(255,255,255)B.
BackgroundTransparency=1 B.BorderColor3=Color3.fromRGB(0,0,0)B.
BorderSizePixel=0 B.Size=UDim2.new(1,0,0,0)local C=Instance.new
'UIPadding'C.Parent=B C.PaddingBottom=UDim.new(0,4)C.
PaddingLeft=UDim.new(0,2)C.PaddingRight=UDim.new(0,2)C.PaddingTop=
UDim.new(0,4)local D=Instance.new'Frame'D.Name='Bar'D.Parent=B
D.AnchorPoint=Vector2.new(0.5,0.5)D.BackgroundColor3=Color3.fromRGB(110,110,
128)D.BackgroundTransparency=0.5 D.BorderColor3=Color3.fromRGB(0,0,0)D.
BorderSizePixel=0 D.Position=UDim2.new(0.5,0,0.5,0)D.Size=UDim2.new(1,0,0,2)
z.separator=B end end local z=table.create(8)
z.__index=z do function z.Clear(A)if
not A.input then return end A.input.Text=''return A end function
z.SetValue(A,B)A:_ChangeValue(B)return A end function
z._TrackConnection(A,B)local C=A.connections C[#C+1]=B
return B end function z._Destroy(A)if not A or A.
destroying then return end A.destroying=true for B,C in ipairs(A.
connections)do if C.Connected then C:Disconnect()end end if A.input.
Parent then pcall(function()A.input.Parent:Destroy()end)end A.connections=
nil A.input=nil end function z._ChangeValue(A,B)if not A.
input then return end A.input.Text=B A.value=B end function
z._CreateInputText(A,B,C)if A.input then return end
A.value=C.Value A.callback=C.Callback local D=Instance.
new'Frame'D.Name='InputText'D.Parent=B D.
BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=1
D.BorderColor3=Color3.fromRGB(0,0,0)D.BorderSizePixel=0
D.Size=UDim2.new(1,0,0,20)D.Destroying:Once(A._Destroy)local
E=Instance.new'UIListLayout'E.Parent=D E
.Padding=UDim.new(0,4)E.FillDirection=Enum.FillDirection.Horizontal
E.SortOrder=Enum.SortOrder.LayoutOrder E.HorizontalAlignment
=Enum.HorizontalAlignment.Center E.HorizontalFlex=Enum.UIFlexAlignment
.Fill E.VerticalAlignment=Enum.VerticalAlignment.Center E.
VerticalFlex=Enum.UIFlexAlignment.Fill local F=Instance.new'Frame'
F.Name='Display'F.Parent=D F.BackgroundColor3=Color3.
fromRGB(255,255,255)F.BackgroundTransparency=0.3 F.BorderColor3=
Color3.fromRGB(0,0,0)F.BorderSizePixel=0 F.Size=UDim2.new(0.5,0,1,0)
local G=Instance.new'UICorner'G.Parent=F
G.CornerRadius=UDim.new(0,2)local H=Instance.new'UIGradient'
H.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(31,
30,41)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,41))}H.Parent=F
local I=Instance.new'UIPadding'I.Parent=F I.
PaddingBottom=UDim.new(0,2)I.PaddingLeft=UDim.new(0,2)I.PaddingRight
=UDim.new(0,2)I.PaddingTop=UDim.new(0,2)local J=Instance.new
'UIStroke'J.Parent=F J.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border J.Color=Color3.fromRGB(134,134,147)J.Transparency=0.8 local
K=Instance.new'TextBox'K.Name='Input'K.Parent=F K.
BackgroundColor3=Color3.fromRGB(255,255,255)K.BackgroundTransparency=1 K
.BorderColor3=Color3.fromRGB(0,0,0)K.BorderSizePixel=0 K.
ClearTextOnFocus=false K.Size=UDim2.new(1,0,1,0)K.ClipsDescendants=true
K.AutoLocalize=false K.PlaceholderColor3=Color3.fromRGB(141,127,141)
K.PlaceholderText=C.Placeholder K.Font='Montserrat'K.FontFace.
Weight=Enum.FontWeight.Medium K.Text=C.Value K.TextColor3=Color3.
fromRGB(200,180,200)K.TextSize=14 K.TextTruncate=Enum.TextTruncate.AtEnd
K.TextXAlignment=Enum.TextXAlignment.Left local L=Instance.new
'TextLabel'L.Name='Label'L.Parent=D L.AutomaticSize=Enum.
AutomaticSize.XY L.BackgroundColor3=Color3.fromRGB(255,255,255)L.
BackgroundTransparency=1 L.BorderColor3=Color3.fromRGB(0,0,0)L.
BorderSizePixel=0 L.LayoutOrder=1 L.Size=UDim2.new(0,5,0,5)L.Font=
'Montserrat'L.FontFace.Weight=Enum.FontWeight.Medium L.Text=C.Label
L.TextColor3=Color3.fromRGB(200,180,200)L.TextSize=14 L.
TextXAlignment=Enum.TextXAlignment.Left A:_TrackConnection(K:
GetPropertyChangedSignal'Text':Connect(function()A.value=K.Text if A
.callback then A:callback(A.value)end end))A.input=K end end
c={}do function c.HSMerge(A,B,C)C=
C or{}for D,E in pairs(B)do if C[D]==nil then C[D]=E end
end return C end function c.HSGetGuiRoot(A)return gethui and
gethui()or get_hidden_gui and get_hidden_gui()or c:HSNewRef(game:
GetService'CoreGui').RobloxGui end function c.HSNewRef(A,B)
if cloneref then return cloneref(B)end return B end function
c.HSRandomString(A,B)local C=''if not A.rng then A.
rng=Random.new()end for D=1,B do C=C..string.char(A.rng:
NextInteger(1,255))end return C end end d={}do function
d.CSGetSafeGui(A)if d.safe_gui then return
d.safe_gui end local B=Instance.new'ScreenGui'B.
Name=c:HSRandomString(20)B.IgnoreGuiInset=true B.
ResetOnSpawn=false B.ZIndexBehavior=Enum.ZIndexBehavior.Sibling B.
DisplayOrder=2147483647 B.Parent=c:HSGetGuiRoot()
d.safe_gui=B return B end function d.
CSNotifCreate(A,B)local C=setmetatable({},n)
C:_CreateNotif(d:CSGetSafeGui())C:
_CreateNotifGlow()C:_CreateNotifContent()if B.Title then
C:SetTitle(B.Title)end if B.Body then C:
SetBody(B.Body)end if B.Icon then C:SetIcon(B.Icon)
end if B.Duration then C:SetDuration(B.Duration)end return
C end function d.CSWindowCreate(A,B)local
C=setmetatable({},m)C.destroyed=false
C.tweens=table.create(8)C.connections=table.create(8)
C:_CreateWindow(d:CSGetSafeGui(),B)C
:_CreateWindowGlow()C:_CreateWindowContent()C:
_CreateTitleBar(B)if not B.NoCollapse then C:
_CreateCollapseButton()end if not B.NoClose then C:
_CreateCloseButton()end if B.Collapsed then C:Collapse()else
C:Expand()end return C end function d.
CSSidebarCreate(A,B)local C=setmetatable({},p)
C.collapsed=true C.tabs=table.create(8)
C.connections=table.create(8)C:_CreateSidebar(B
)C:_CreateSidebarContent(B)C:_CreateMenuToggle(
)C:_CreateSearchBar()C:_CreateSettingsTab()return
C,C.settings_tab end function d.
CSRegionCreate(A,B,C)local D=setmetatable({},q)
D.connections=table.create(8)D:_CreateRegion(B,
C)D:_CreateRegionContent()return D end function
d.CSLabelCreate(A,B,C)local D=setmetatable({},
r)D:_CreateLabel(B,C)return D end
function d.CSConsoleCreate(A,B,C)local D=
setmetatable({},s)D:_CreateConsole(B,C)if
C.Border then D:_CreateConsoleBorder()end if C.
LineNumbers then D:_CreateConsoleLines()end return D
end function d.CSSliderFloatCreate(A,B,C)local
D=setmetatable({},t)D.
dragging=false D.connections=table.create(8)
D:_CreateSliderFloat(B,C)D:
_CreateSliderGrab()return D end function d.
CSCheckboxCreate(A,B,C)local D=setmetatable({},
u)D.connections=table.create(8)D:
_CreateCheckbox(B,C)D:_CreateTick()if C.Value then
D.tick.BackgroundTransparency=0.3 D.tick.Size=
UDim2.new(1,0,1,0)D.tick.UICorner.CornerRadius=UDim.new(0,2)
D.tick.UIStroke.Transparency=0.8 D.tick.glowtop.
ImageTransparency=0 D.tick.glowtop_2.ImageTransparency=0 else
D.tick.BackgroundTransparency=1 D.tick.Size=UDim2.
new(0,0,0,0)D.tick.UICorner.CornerRadius=UDim.new(1,0)
D.tick.UIStroke.Transparency=1 D.tick.glowtop.
ImageTransparency=1 D.tick.glowtop_2.ImageTransparency=1 end
return D end function d.CSButtonCreate(A,B,C
)local D=setmetatable({},v)D.connections=
table.create(8)D:_CreateButton(B,C)D:
_SetButtonStyle(C.Style)return D end function d.
CSKeybindCreate(A,B,C)local D=setmetatable({},
w)D.connections=table.create(8)D:
_CreateKeybind(B,C)return D end function d.
CSComboCreate(A,B,C)local D=setmetatable({},x)
D.items=table.create(8)D.connections=table.create(8)
D:_CreateCombo(B,C)D:_CreateDropdownMenu()
return D end function d.CSSeparatorCreate(A,B)local
C=setmetatable({},y)C:
_CreateSeparator(B)return C end function d.
CSInputTextCreate(A,B,C)local D=setmetatable({},
z)D.connections=table.create(8)D:
_CreateInputText(B,C)return D end end
e={notifs=table.create(8)}do setmetatable(
e.notifs,{__mode='v'})function e.
NSRepositionNotifs(A)for B,C in ipairs(A.notifs)do local D=-20-
((B-1)*(130))g:Create(C.notif.Parent,TweenInfo.new(0.35,
Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(1,-20,1,
D)}):Play()end end function e.NSPushNotification(A,
B)local C=d:CSNotifCreate(B)table.insert(A.notifs,
1,C)A:NSRepositionNotifs()C:Push()task.wait(C.duration)C:
Pull()end end f={ini_to_save={'value'},ini_settings=table.create(8)}do
function f.ISGetIniData(A,B)local C=A.ini_to_save local
D={}for E,F in next,C do D[F]=B[F]end return D end
function f.ISDumpIni(A,B)local C=A.ini_settings
local D={}for E,F in next,C do D[E]=
A:ISGetIniData(F)end if B then return i:
JSONEncode(D)end return D end function f.
ISLoadIniIntoElement(A,B,C)local D={value=function(D)
B:SetValue(D)end}for E,F in next,C do local G=
D[E]if G then G(F)continue end B[E]=
F end end function f.ISLoadIni(A,B,C)local
D=A.ini_settings assert(B,
'No Ini configuration was passed')if C then B=i
:JSONDecode(B)end for E,F in next,B do local
G=D[E]A:ISLoadIniIntoElement(G,F)end end
function f.ISAddIniFlag(A,B,C)local D=A.
ini_settings D[B]=C end end function j.RegisterElement(A
,B,C)A.elements[B]=C l[B]=function(
D,E)return C(D,E)end end function j.Window(A,B)
B=c:HSMerge({Title='Window',Size=UDim2.fromOffset(600,400),
Position=UDim2.new(0.5,0,0.5,-200),Collapsed=false,SmoothDrag=false},B)
local C=d:CSWindowCreate(B)C._CreateWindow=nil
C._CreateWindowGlow=nil C._CreateWindowContent=nil C.
_CreateTitleBar=nil C._CreateCollapseButton=nil C._CreateCloseButton=
nil table.insert(A.windows,C)return C end function j.
PushNotification(A,B)B=c:HSMerge({Title='Notification',Body
='This is a notification.',Icon=j.icons.Send,Duration=3},B)
e:NSPushNotification(B)end function j.DumpIni(A,
B)return f:ISDumpIni(B)end function j.LoadIni(A
,B,C)return f:ISLoadIni(B,C
)end function j.AddIniFlag(A,B,C)return f:ISAddIniFlag(B,
C)end j:RegisterElement('Sidebar',function(A,B)local C,
D=d:CSSidebarCreate(A:GetContainer())C.
_CreateSidebar=nil C._CreateSidebarContent=nil C._CreateMenuToggle=nil
C._CreateSearchBar=nil C._CreateSettingsTab=nil C.
_TrackConnection=nil return C,D end)j:RegisterElement('Region'
,function(A,B)B=c:HSMerge({Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y,Border=true,BorderThickness=1,CornerRadius=
UDim.new(0,8)},B)local C=d:CSRegionCreate(A:
GetContainer(),B)C._CreateRegion=nil C._CreateRegionContent=nil
C._TrackConnection=nil return C end)j:RegisterElement('Label',
function(A,B)B=c:HSMerge({Font='Montserrat',Weight=
Enum.FontWeight.Medium,Text='Label',Padding=UDim.new(0,4),TextSize=13,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Center},B)local C=d:CSLabelCreate(A:GetContainer(),
B)C._CreateLabel=nil return C end)j:RegisterElement('Console',
function(A,B)B=c:HSMerge({Enabled=true,Value='',
TextWrapped=false,CornerRadius=UDim.new(0,2),Border=true,MaxLines=300,ReadOnly=
true,RichText=true,LineNumbers=false,AutoScroll=true,Callback=nil},B)local
C=d:CSConsoleCreate(A:GetContainer(),B)C.
_CreateConsole=nil C._CreateConsoleBorder=nil C._CreateConsoleLines=
nil return C end)j:RegisterElement('SliderFloat',function(A,B)
B=c:HSMerge({Label='SliderFloat',Minimum=0,Maximum=1,Value=0.5
,Format='%.2f',Callback=nil},B)local C=d:
CSSliderFloatCreate(A:GetContainer(),B)C._CreateSliderFloat=nil
C._CreateSliderGrab=nil C._TrackConnection=nil return C end)j:
RegisterElement('Checkbox',function(A,B)B=c:HSMerge(
{Label='Checkbox',Value=false,Callback=nil},B)local C=d:
CSCheckboxCreate(A:GetContainer(),B)C._CreateCheckbox=nil C.
_CreateTick=nil C._TrackConnection=nil return C end)j:
RegisterElement('Button',function(A,B)B=c:HSMerge({
Text='Button',Style='Primary',Callback=nil},B)local C=d:
CSButtonCreate(A:GetContainer(),B)C._CreateButton=nil C.
_SetButtonStyle=nil C._TrackConnection=nil return C end)j:
RegisterElement('Keybind',function(A,B)B=c:HSMerge({
Label='Keybind',Value=Enum.KeyCode.K,Callback=nil},B)local C=
d:CSKeybindCreate(A:GetContainer(),B)C.
_CreateKeybind=nil C._TrackConnection=nil return C end)j:
RegisterElement('Combo',function(A,B)B=c:HSMerge({
Label='Combo',Placeholder='Select...',Items=nil,Callback=nil},B)local
C=d:CSComboCreate(A:GetContainer(),B)C.
_CreateCombo=nil C._CreateDropdownMenu=nil C._TrackConnection=nil
return C end)j:RegisterElement('Separator',function(A,B)local
C=d:CSSeparatorCreate(A:GetContainer())C.
_CreateSeparator=nil return C end)j:RegisterElement('PopupModal',function
(A,B)B=c:HSMerge({Title='PopupModal',Size=UDim2.
fromOffset(372,38),AutomaticSize=Enum.AutomaticSize.XY,NoCollapse=true,NoClose=
true,Collapsed=false,SmoothDrag=false},B)local C=j:Window(B)
local D=Instance.new'TextButton'D.Name='ModalEffect'
D.Parent=A:GetContainer()D.AnchorPoint=Vector2.new(
0.5,0.5)D.AutoButtonColor=false D.Position=UDim2.new(0.5,0
,0.5,0)D.Size=UDim2.new(1,0,1,0)D.BackgroundColor3=Color3.
fromRGB(26,25,33)D.BackgroundTransparency=1 D.BorderColor3
=Color3.fromRGB(0,0,0)D.BorderSizePixel=0 D.Selectable=
false D.Text=''D.TextTransparency=1 D.ZIndex=99
C.window.Parent=D C.window.AnchorPoint=Vector2.new(0.5,0.5)
C.window.AutomaticSize=B.AutomaticSize C.modal_effect=
D local E=Instance.new'UIListLayout'E.Parent=
C:GetContainer()E.Padding=UDim.new(0,4)E.SortOrder=Enum
.SortOrder.LayoutOrder local F=Instance.new'UIPadding'F.Parent=
C:GetContainer()F.PaddingBottom=UDim.new(0,8)F.PaddingLeft=UDim
.new(0,8)F.PaddingRight=UDim.new(0,8)F.PaddingTop=UDim.new(0,8)local
G=C._Destroy function C._Destroy(H)G(H)if H.
modal_effect then H.modal_effect:Destroy()H.modal_effect=nil end end
C:AddTween(D,{BackgroundTransparency=0.3}):Play()function C.
ClosePopup(H)if H.destroyed then return end local I=H:AddTween(
D,{BackgroundTransparency=1})if I then I:Play()I.
Completed:Wait()end H:Close()end return C:Center()end)j:
RegisterElement('InputText',function(A,B)B=c:
HSMerge({Value='',Placeholder='Type here...',Label='InputText',Callback=nil},
B)local C=d:CSInputTextCreate(A:GetContainer(),
B)C._CreateInputText=nil C._TrackConnection=nil return C end
)g=b.TweenService h=b.
UserInputService i=b.HttpService if a then a.
__FUI_ENV=j end return j
