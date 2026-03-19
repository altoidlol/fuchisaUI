local a=getgenv and getgenv()if a and a.__FUI_ENV then return a.
__FUI_ENV end local b local c local d
local e local f local g={windows={},elements={}}
g.icons={Dot='rbxasset://textures/whiteCircle.png',Arrow=
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
setmetatable({},{__index=function(h,i:string)local j=game:
GetService(i)return c:HSNewRef(j)end})local
h=TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.
Out)local i={}local j={window=nil,destroyed=false,tweens
={},connections={}}j.__index=j setmetatable(j,{
__index=i})do function j.GetTitle(k)return k.TitleBar.
Text end function j.SetTitle(k,l)k.TitleBar.Text=l return k
end function j.SetVisible(k,l)k.window.Visible=l return k
end function j.GetContainer(k)return k.content_group.Frame end
function j.Center(k)k.window.Position=UDim2.new(0.5,0,0.5,-k.
window.Size.Y.Offset/2)return k end function j.AddTween(k,l,m)
if not l then return end local n=b.TweenService:Create(l,
h,m)return j:_TrackTween(n)end function
j.Collapse(k)if k.animating then return end if k.collapsed then
return end if not k.window then return end k.collapsed=not k.collapsed
k.expanded_window_pos=k.window.Position k.expanded_content_height=k.
content_group.Frame.AbsoluteSize.Y k.animating=true local l=UDim2.new(
k.expanded_window_size.X.Scale,k.expanded_window_size.X.Offset,0,k.
collapsed_height)local m=k:AddTween(k.window,{Size=l,
Position=k.expanded_window_pos})k:AddTween(k.content_group and k.
content_group.Frame,{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1})k:
AddTween(k.collapse_button,{Rotation=0})k:AddTween(k.window.glowbottom1
,{ImageTransparency=1})k:AddTween(k.window.glowbottom2,{ImageTransparency=
1})for n,o in ipairs(k.tweens)do o:Play()end if m then
m.Completed:Wait()end table.clear(k.tweens)k.animating=false
return k end function j.Expand(k)if k.animating then return end
if not k.collapsed then return end if not k.window then return end k.
collapsed=not k.collapsed k.expanded_window_pos=k.window.Position k.
animating=true local l=k:AddTween(k.window,{Size=k.
expanded_window_size,Position=k.expanded_window_pos})k:AddTween(k.
content_group.Frame,{Size=UDim2.new(1,0,0,k.expanded_content_height),
BackgroundTransparency=0.3})k:AddTween(k.collapse_button,{Rotation=90})
k:AddTween(k.window.glowbottom1,{ImageTransparency=0})k:AddTween(k.
window.glowbottom2,{ImageTransparency=0})for m,n in ipairs(k.tweens)do n:
Play()end if l then l.Completed:Wait()end table.clear(k
.tweens)k.animating=false return k end function j.Close(k)if
k.destroyed then return end k.destroyed=true local l=k.window if
not l then return end local m=TweenInfo.new(0.22,Enum.
EasingStyle.Quad,Enum.EasingDirection.In)local n=k:_TrackTween(
b.TweenService:Create(l,m,{Size=UDim2.new(l
.Size.X.Scale,l.Size.X.Offset*0.85,l.Size.Y.Scale,l.Size.Y.Offset
*0.85),Position=UDim2.new(l.Position.X.Scale,l.Position.X.Offset,
l.Position.Y.Scale,l.Position.Y.Offset+8),BackgroundTransparency=1}))
local o={}for p,q in ipairs(l:GetDescendants())do if q:IsA
'GuiObject'then local r=k:_TrackTween(b.TweenService:Create(
q,m,{BackgroundTransparency=1}))table.insert(o,r)
r:Play()elseif q:IsA'TextLabel'or q:IsA'TextButton'then local r=
k:_TrackTween(b.TweenService:Create(q,m,{
TextTransparency=1}))table.insert(o,r)r:Play()elseif q:IsA
'ImageLabel'or q:IsA'ImageButton'then local r=k:_TrackTween(
b.TweenService:Create(q,m,{ImageTransparency=1}))
table.insert(o,r)r:Play()end end n:Play()n
.Completed:Wait()k:_Destroy()end function j._TrackConnection(k,l)
table.insert(k.connections,l)return l end function j.
_TrackTween(k,l)local m=k.tweens m[#m+1]=l l.
Completed:Once(function()for n=1,#m do if m[n]~=l then continue
end m[n]=m[#m]m[#m]=nil break end end)return l end
function j._Destroy(k)for l,m in ipairs(k.tweens)do pcall(
function()m:Cancel()end)end for l,m in ipairs(k.connections)do pcall(
function()m:Disconnect()end)end if k.window then local l=k.window:
FindFirstAncestorOfClass'ScreenGui'if l then l:Destroy()else k.window
:Destroy()end end k.connections=nil k.tweens=nil k.window=nil k.
title_bar=nil k.content_group=nil k.collapse_button=nil end function
j._CreateWindow(k,l,m)if k.window then return end local
n=Instance.new'Frame'n.Name='Window'n.Parent=l n.
Active=true n.AnchorPoint=Vector2.new(0.5,0)n.BackgroundColor3=Color3.
fromRGB(255,114,114)n.BackgroundTransparency=1 n.BorderColor3=Color3.
fromRGB(0,0,0)n.BorderSizePixel=0 n.Position=m.Position n.
Size=m.Size local o=Instance.new'UIPadding'o.
Parent=n o.PaddingBottom=UDim.new(0,1)o.
PaddingLeft=UDim.new(0,1)o.PaddingRight=UDim.new(0,1)o
.PaddingTop=UDim.new(0,1)k.window=n k.expanded_window_size=n.
Size k.expanded_window_pos=n.Position end function j.
_CreateWindowGlow(k)if not k.window then return end local l=Instance.
new'ImageLabel'l.Name='glowtop1'l.Parent=k.window l
.AnchorPoint=Vector2.new(0.5,0)l.BackgroundColor3=Color3.fromRGB(255,255
,255)l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,
0,0)l.BorderSizePixel=0 l.Position=UDim2.new(0.5,0,0,-5)
l.Size=UDim2.new(1,0,0,10)l.ZIndex=4 l.Image=
'rbxassetid://76150694119616'local m=Instance.new'UIGradient'
m.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}m.Transparency
=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(
0.22,1),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(0.74,0.5),
NumberSequenceKeypoint.new(1,1),NumberSequenceKeypoint.new(1,0)}m.
Parent=l local n=Instance.new'ImageLabel'n.Name=
'glowtop2'n.Parent=k.window n.AnchorPoint=Vector2.new(0.5,0)
n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.
BorderSizePixel=0 n.Position=l.Position n.Size=UDim2.
new(1,0,0,10)n.ZIndex=4 n.Image='rbxassetid://76150694119616'
local o=Instance.new'UIGradient'o.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.
new(0.5,Color3.fromRGB(223,142,255)),ColorSequenceKeypoint.new(0.74,Color3.
fromRGB(148,189,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}
o.Parent=n local p=Instance.new'ImageLabel'
p.Name='glowbottom1'p.Parent=k.window p.
AnchorPoint=Vector2.new(0.5,1)p.BackgroundColor3=Color3.fromRGB(255,
255,255)p.BackgroundTransparency=1 p.BorderColor3=Color3.
fromRGB(0,0,0)p.BorderSizePixel=0 p.Position=UDim2.new(0.5
,0,1,5)p.Size=UDim2.new(1,0,0,10)p.ZIndex=4 p.
Image='rbxassetid://76150694119616'local q=Instance.new'UIGradient'
q.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}q.Parent=
p local r=Instance.new'ImageLabel'r.Name=
'glowbottom2'r.Parent=k.window r.AnchorPoint=Vector2.
new(0.5,1)r.BackgroundColor3=Color3.fromRGB(255,255,255)r.
BackgroundTransparency=1 r.BorderColor3=Color3.fromRGB(0,0,0)
r.BorderSizePixel=0 r.Position=p.Position
r.Size=UDim2.new(1,0,0,10)r.ZIndex=4 r.Image=
'rbxassetid://76150694119616'local s=Instance.new'UIGradient'
s.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}s.Transparency
=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0
,1),NumberSequenceKeypoint.new(0.32,0),NumberSequenceKeypoint.new(0.52,1),
NumberSequenceKeypoint.new(0.74,0.5),NumberSequenceKeypoint.new(1,1),
NumberSequenceKeypoint.new(1,0)}s.Parent=r end function
j._CreateWindowContent(k)if k.content_group then return end if not
k.window then return end local l=Instance.new'CanvasGroup'
l.Name='Content'l.Parent=k.window l.
Active=true l.AutomaticSize=Enum.AutomaticSize.Y l.
BackgroundColor3=Color3.fromRGB(255,255,255)l.BackgroundTransparency
=1 l.BorderColor3=Color3.fromRGB(0,0,0)l.BorderSizePixel
=0 l.Position=UDim2.new(0,0,0,0)l.Size=UDim2.new(1,0,1,0
)local m=Instance.new'UIStroke'm.Name='Border'
m.Parent=l m.ApplyStrokeMode=Enum.
ApplyStrokeMode.Border m.Color=Color3.fromRGB(134,134,147)
m.Thickness=1 local n=Instance.new'UICorner'
n.CornerRadius=UDim.new(0,8)n.Parent=l local
o=Instance.new'UIListLayout'o.Parent=l
o.Padding=UDim.new(0,0)o.SortOrder=Enum.SortOrder.
LayoutOrder o.VerticalFlex=Enum.UIFlexAlignment.Fill local
p=Instance.new'Frame'p.Parent=l
p.ClipsDescendants=true p.BackgroundColor3=Color3.
fromRGB(26,25,33)p.BackgroundTransparency=0.3 p.
BorderColor3=Color3.fromRGB(0,0,0)p.BorderSizePixel=0 p.
Position=UDim2.new(0,0,0,0)p.Size=UDim2.new(1,0,1,0)k.
content_group=l end function j._CreateTitleBar(k,l)if
k.title_bar then return end if not k.window then return end if not k.
content_group then return end local m=Instance.new'Frame'm.
Name='TitleBar'm.Parent=k.content_group m.AutomaticSize=Enum.
AutomaticSize.Y m.BackgroundColor3=Color3.fromRGB(35,30,35)m.
BackgroundTransparency=0.3 m.BorderColor3=Color3.fromRGB(0,0,0)m
.BorderSizePixel=0 m.ClipsDescendants=true m.LayoutOrder=-1
m.Position=UDim2.new(0,0,0,0)m.Size=UDim2.new(1,0,0,19)local
n=Instance.new'UIGradient'n.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(170,170,170))}n.Parent=m n.Enabled=
false local o=Instance.new'UIListLayout'o.Parent=m
o.FillDirection=Enum.FillDirection.Horizontal o.SortOrder=
Enum.SortOrder.LayoutOrder o.VerticalAlignment=Enum.VerticalAlignment.
Center o.VerticalFlex=Enum.UIFlexAlignment.Fill o.Padding=
UDim.new(0,4)local p=Instance.new'UIPadding'p.Parent=m
p.PaddingBottom=UDim.new(0,1)p.PaddingLeft=UDim.new(0,4)p.
PaddingRight=UDim.new(0,4)p.PaddingTop=UDim.new(0,1)local q=
Instance.new'UIFlexItem'q.Parent=m local r=Instance.
new'TextButton'r.Name='TitleBar'r.Parent=m
r.AutomaticSize=Enum.AutomaticSize.Y r.BackgroundColor3=
Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r.
BorderColor3=Color3.fromRGB(110,110,125)r.BorderSizePixel=0
r.ClipsDescendants=true r.LayoutOrder=1 r.Size=
UDim2.new(1,0,0,19)r.AutoButtonColor=false r.Font=
'Montserrat'r.FontFace.Weight=Enum.FontWeight.Medium r.Text=
l.Title r.TextColor3=Color3.fromRGB(200,180,200)r.
TextSize=14 local s=Instance.new'UICorner's.
CornerRadius=UDim.new(0,0)s.Name='FrameRounding's.Parent
=r local t=Instance.new'UIGradient't.Color=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(139,189,186))}t.Parent=
r t.Enabled=false local u=Instance.new
'UIListLayout'u.Parent=r u.FillDirection=Enum
.FillDirection.Horizontal u.SortOrder=Enum.SortOrder.LayoutOrder
u.VerticalAlignment=Enum.VerticalAlignment.Center u.
VerticalFlex=Enum.UIFlexAlignment.Fill u.Padding=UDim.new(0,4)local
v=Instance.new'UIPadding'v.Parent=r v.
PaddingLeft=UDim.new(0,2)local w=false local x,y,
z k:_TrackConnection(r.InputBegan:Connect(function(A
)if A.UserInputType~=Enum.UserInputType.MouseButton1 then return end
w=true x=A.Position y=k.window.Position end))k
:_TrackConnection(r.InputEnded:Connect(function(A)if A.
UserInputType==Enum.UserInputType.MouseButton1 then w=false z=
nil end end))k:_TrackConnection(b.UserInputService.InputChanged:
Connect(function(A)if not w then return end if A.UserInputType~=
Enum.UserInputType.MouseMovement and A.UserInputType~=Enum.UserInputType.
Touch then return end local B=A.Position-x local
C=UDim2.new(y.X.Scale,y.X.Offset+B.X,
y.Y.Scale,y.Y.Offset+B.Y)if not l.SmoothDrag then k.
window.Position=C return end if z then z:
Cancel()z=nil end z=k:_TrackTween(b.
TweenService:Create(k.window,h,{Position=C}))
z:Play()end))k.title_bar=m task.defer(function()k.
collapsed_height=m.AbsoluteSize.Y end)end function j.
_CreateCollapseButton(k)if k.collapse_button then return end if not k.
title_bar then return end if not k.window then return end if not k.
content_group then return end local l=Instance.new'Frame'l.Name=
'CollapseToggle'l.Parent=k.title_bar.TitleBar l.Active=true l.
AutomaticSize=Enum.AutomaticSize.X l.BackgroundColor3=Color3.fromRGB(255,
255,255)l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0
)l.BorderSizePixel=0 l.Size=UDim2.new(0,17,0,0)local m=
Instance.new'UIAspectRatioConstraint'm.Parent=l local n=
Instance.new'UIPadding'n.Parent=l n.PaddingBottom=UDim.new(0,
1)n.PaddingLeft=UDim.new(0,1)n.PaddingRight=UDim.new(0,1)n.
PaddingTop=UDim.new(0,1)local o=Instance.new'ImageButton'o.Name='Icon'
o.Parent=l o.AnchorPoint=Vector2.new(0.5,0.5)o.BackgroundColor3=
Color3.fromRGB(255,255,255)o.BackgroundTransparency=1 o.Position=UDim2.
new(0.5,0,0.5,0)o.Rotation=90 o.Size=UDim2.new(0.8,0,0.8,0)o.ZIndex=1
o.Image='rbxassetid://4731371527'local p=Instance.new'Frame'
p.Name='HoverCircle'p.Parent=l p.
AnchorPoint=Vector2.new(0.5,0.5)p.BackgroundColor3=Color3.fromRGB(255
,255,255)p.BackgroundTransparency=1 p.Position=UDim2.new(
0.5,0,0.5,0)p.Size=UDim2.new(0,0,0,0)p.ZIndex=0 local q
=Instance.new'UIGradient'q.Parent=p q.Color=ColorSequence.new
{ColorSequenceKeypoint.new(0,Color3.fromRGB(200,180,255)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(150,200,255))}q.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.7),NumberSequenceKeypoint.new(1,0.9)}local r
=Instance.new'UIStroke'r.Parent=p r.Color=Color3.fromRGB(
200,180,255)r.Thickness=1 r.Transparency=0.6 local s=
Instance.new'UICorner's.Name='FrameRounding's.Parent=
p s.CornerRadius=UDim.new(1,0)k:_TrackConnection(o.
MouseButton1Click:Connect(function()if k.collapsed then k:Expand()else
k:Collapse()end end))local t k:_TrackConnection(o.MouseEnter:
Connect(function()if t then t:Cancel()end t=k:
_TrackTween(b.TweenService:Create(p,h,{
Size=UDim2.new(1,0,1,0),BackgroundTransparency=0.75}))t:Play()end))
k:_TrackConnection(o.MouseLeave:Connect(function()if t then
t:Cancel()end t=k:_TrackTween(b.TweenService:
Create(p,h,{Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1}))t:Play()end))k.collapse_button=o end
function j._CreateCloseButton(k)if k.close_button then return end
if not k.title_bar then return end if not k.window then return end if not
k.content_group then return end local l=Instance.new'Frame'l.Name
='CloseToggle'l.Parent=k.title_bar.TitleBar l.Active=true l.
AutomaticSize=Enum.AutomaticSize.X l.BackgroundColor3=Color3.fromRGB(255,
255,255)l.BackgroundTransparency=1 l.BorderColor3=Color3.fromRGB(0,0,0
)l.BorderSizePixel=0 l.LayoutOrder=2 l.Size=UDim2.new(0,17,0,0)
local m=Instance.new'UIAspectRatioConstraint'm.Parent=l
local n=Instance.new'UIPadding'n.Parent=l n.
PaddingBottom=UDim.new(0,1)n.PaddingLeft=UDim.new(0,1)n.PaddingRight
=UDim.new(0,1)n.PaddingTop=UDim.new(0,1)local o=Instance.new
'ImageButton'o.Name='Icon'o.Parent=l o.AnchorPoint=Vector2.new(
0.5,0.5)o.BackgroundColor3=Color3.fromRGB(255,255,255)o.
BackgroundTransparency=1 o.Position=UDim2.new(0.5,0,0.5,0)o.Size=UDim2.
new(0.8,0,0.8,0)o.ZIndex=1 o.Image='rbxassetid://90965270530088'local
p=Instance.new'Frame'p.Name='HoverCircle'p.
Parent=l p.AnchorPoint=Vector2.new(0.5,0.5)p.
BackgroundColor3=Color3.fromRGB(255,255,255)p.BackgroundTransparency=
1 p.Position=UDim2.new(0.5,0,0.5,0)p.Size=UDim2.new(0,0,0,
0)p.ZIndex=0 local q=Instance.new'UIGradient'q.Parent=
p q.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(200,180,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(150,200,255))}
q.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0.7),
NumberSequenceKeypoint.new(1,0.9)}local r=Instance.new'UIStroke'r.
Parent=p r.Color=Color3.fromRGB(200,180,255)r.Thickness=1
r.Transparency=0.6 local s=Instance.new'UICorner'
s.Name='FrameRounding's.Parent=p
s.CornerRadius=UDim.new(1,0)k:_TrackConnection(o.
MouseButton1Click:Connect(function()k:Close()end))local t k:
_TrackConnection(o.MouseEnter:Connect(function()if t then
t:Cancel()end t=k:_TrackTween(b.TweenService:
Create(p,h,{Size=UDim2.new(1,0,1,0),
BackgroundTransparency=0.75}))t:Play()end))k:_TrackConnection(o.
MouseLeave:Connect(function()if t then t:Cancel()end
t=k:_TrackTween(b.TweenService:Create(p,
h,{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}))
t:Play()end))k.close_button=o end end local k={notif=
nil,content_frame=nil}k.__index=k do function k.
SetTitle(l,m)l.content_frame.Title.Text=m return l end function
k.SetBody(l,m)l.content_frame.Body.Text=m return l end
function k.SetIcon(l,m)l.content_frame.Icon.Image=m return l
end function k.SetDuration(l,m)l.duration=m return l
end function k.Push(l)if not l.notif then return end if not l.
duration then return end b.TweenService:Create(l.notif.Border,
h,{Transparency=0}):Play()b.TweenService:Create(l
.content_frame.Title,h,{TextTransparency=0}):Play()b
.TweenService:Create(l.content_frame.Body,h,{TextTransparency
=0}):Play()b.TweenService:Create(l.content_frame.Icon,
h,{ImageTransparency=0}):Play()b.TweenService:
Create(l.notif,h,{Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=0.3}):Play()b.TweenService:Create(l.notif.
Gradient,TweenInfo.new(l.duration,Enum.EasingStyle.Linear,Enum.
EasingDirection.Out),{Offset=Vector2.new(1,0)}):Play()end function k.
Pull(l)if not l.notif then return end local m=b.
TweenService:Create(l.notif,h,{Position=UDim2.new(0.5,0,0.5,
12),BackgroundTransparency=1})b.TweenService:Create(l.notif.
Border,h,{Transparency=1}):Play()b.TweenService:
Create(l.content_frame.Title,h,{TextTransparency=1}):Play()
b.TweenService:Create(l.content_frame.Body,h,{
TextTransparency=1}):Play()b.TweenService:Create(l.content_frame.
Icon,h,{ImageTransparency=1}):Play()m:Play()m.
Completed:Wait()l:_Destroy()end function k._Destroy(l)local m=
e.notifs local n=table.find(m,l)if n then
table.remove(m,n)end l.notif.Parent:Destroy()e:
NSRepositionNotifs()end function k._CreateNotif(l,m)if l.notif
then return end local n=Instance.new'Frame'n.Name=
'NotifHolder'n.Parent=m n.AnchorPoint=Vector2.new(1,1
)n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)
n.BorderSizePixel=0 n.Position=UDim2.new(1,-20,1,-20)
n.Size=UDim2.new(0,256,0,120)local o=Instance.new'Frame'o.
Parent=n o.AnchorPoint=Vector2.new(0.5,0.5)o.BackgroundColor3
=Color3.fromRGB(255,255,255)o.BackgroundTransparency=1 o.BorderColor3=
Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.ClipsDescendants=true o.
Size=UDim2.new(1,-10,1,-10)o.Position=UDim2.new(0.5,0,0.5,10)local
p=Instance.new'UICorner'p.CornerRadius=UDim.new(0,8)
p.Parent=o local q=Instance.new'UIGradient'q.
Name='Gradient'q.Offset=Vector2.new(-1,0)q.Color=ColorSequence.new
{ColorSequenceKeypoint.new(0,Color3.fromRGB(38,37,49)),ColorSequenceKeypoint.
new(0.04,Color3.fromRGB(26,25,33)),ColorSequenceKeypoint.new(1,Color3.fromRGB(26
,25,33))}q.Parent=o local r=Instance.new'UIStroke'
r.Name='Border'r.Parent=o r.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border r.Color=Color3.fromRGB(
134,134,147)r.Thickness=1 r.Transparency=1 l.notif=
o end function k._CreateNotifGlow(l)if not l.notif then return
end local m=Instance.new'ImageLabel'm.Name='glowtop1'm
.Parent=l.notif m.AnchorPoint=Vector2.new(0.5,0)m.
BackgroundColor3=Color3.fromRGB(255,255,255)m.BackgroundTransparency=1
m.BorderColor3=Color3.fromRGB(0,0,0)m.BorderSizePixel=0
m.Position=UDim2.new(0.5,0,0,-5)m.Size=UDim2.new(1,0,0,10)
m.ZIndex=4 m.Image='rbxassetid://76150694119616'local n
=Instance.new'UIGradient'n.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.
new(0.5,Color3.fromRGB(223,142,255)),ColorSequenceKeypoint.new(0.74,Color3.
fromRGB(148,189,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}
n.Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.22,1),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(0.74,0.5),NumberSequenceKeypoint.new(1,1),
NumberSequenceKeypoint.new(1,0)}n.Parent=m local o=
Instance.new'ImageLabel'o.Name='glowtop2'o.Parent=l.notif
o.AnchorPoint=Vector2.new(0.5,0)o.BackgroundColor3=Color3.
fromRGB(255,255,255)o.BackgroundTransparency=1 o.BorderColor3=
Color3.fromRGB(0,0,0)o.BorderSizePixel=0 o.Position=m.
Position o.Size=UDim2.new(1,0,0,10)o.ZIndex=4 o.Image=
'rbxassetid://76150694119616'local p=Instance.new'UIGradient'
p.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}p.Parent=
o local q=Instance.new'ImageLabel'q.Name=
'glowbottom1'q.Parent=l.notif q.AnchorPoint=Vector2.
new(0.5,1)q.BackgroundColor3=Color3.fromRGB(255,255,255)q.
BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)
q.BorderSizePixel=0 q.Position=UDim2.new(0.5,0,1,5)
q.Size=UDim2.new(1,0,0,10)q.ZIndex=4 q.Image=
'rbxassetid://76150694119616'local r=Instance.new'UIGradient'
r.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}r.Parent=
q local s=Instance.new'ImageLabel's.Name=
'glowbottom2's.Parent=l.notif s.AnchorPoint=Vector2.
new(0.5,1)s.BackgroundColor3=Color3.fromRGB(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)
s.BorderSizePixel=0 s.Position=q.Position
s.Size=UDim2.new(1,0,0,10)s.ZIndex=4 s.Image=
'rbxassetid://76150694119616'local t=Instance.new'UIGradient'
t.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.32,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.52,Color3.fromRGB(134,134,147)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}t.Transparency
=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0
,1),NumberSequenceKeypoint.new(0.32,0),NumberSequenceKeypoint.new(0.52,1),
NumberSequenceKeypoint.new(0.74,0.5),NumberSequenceKeypoint.new(1,1),
NumberSequenceKeypoint.new(1,0)}t.Parent=s end function
k._CreateNotifContent(l)if l.content_frame then return end if not
l.notif then return end local m=Instance.new'Frame'
m.Parent=l.notif m.AnchorPoint=Vector2.new(0.5,0.5)
m.BackgroundColor3=Color3.fromRGB(255,255,255)m.
BackgroundTransparency=1 m.BorderColor3=Color3.fromRGB(0,0,0)
m.BorderSizePixel=0 m.ClipsDescendants=true
m.Size=UDim2.new(1,0,1,0)m.Position=UDim2.new(0.5,0,0.5,
0)local n=Instance.new'TextLabel'n.Name='Title'n.Parent=
m n.AnchorPoint=Vector2.new(1,0)n.BackgroundColor3=Color3.
fromRGB(255,255,255)n.BackgroundTransparency=1 n.BorderColor3=Color3.
fromRGB(0,0,0)n.BorderSizePixel=0 n.Position=UDim2.new(1,0,0,10)n.
Size=UDim2.new(1,-40,0,20)n.Font='Montserrat'n.FontFace.Weight=Enum.
FontWeight.Bold n.TextColor3=Color3.fromRGB(185,176,166)n.
TextTransparency=1 n.TextSize=20 n.TextXAlignment=Enum.TextXAlignment.
Left local o=Instance.new'ImageLabel'o.Name='Icon'o.Parent=
m o.BackgroundColor3=Color3.fromRGB(255,255,255)o.
BackgroundTransparency=1 o.ImageTransparency=1 o.BorderColor3=Color3.
fromRGB(0,0,0)o.BorderSizePixel=0 o.Position=UDim2.new(0,10,0,10)o.Size
=UDim2.new(0,20,0,20)local p=Instance.new'TextLabel'p.Name='Body'p.
Parent=m p.AnchorPoint=Vector2.new(0.5,1)p.BackgroundColor3=
Color3.fromRGB(255,255,255)p.BackgroundTransparency=1 p.BorderColor3=
Color3.fromRGB(0,0,0)p.BorderSizePixel=0 p.Position=UDim2.new(0.5,0,1,-10)
p.Size=UDim2.new(1,-20,1,-50)p.Font='Montserrat'p.FontFace.Weight=Enum.
FontWeight.Medium p.TextWrapped=true p.TextColor3=Color3.fromRGB(185,176,
166)p.TextTransparency=1 p.TextSize=14 p.TextXAlignment=Enum.
TextXAlignment.Left p.TextYAlignment=Enum.TextYAlignment.Top l.
content_frame=m end end local l={tab=nil,content_frame=nil,
click_callback=nil,connections={}}l.__index=l setmetatable(
l,{__index=i})do function l.GetName(m)return m.
tab.Name end function l.SetName(m,n)m.tab.Name=n m.
content_frame.Name=n..'Content'return m end function l.
GetContainer(m)return m.content_frame end function l.SetClickCallback(m,
n)m.click_callback=n return m end function l.
_TrackConnection(m,n)table.insert(m.connections,n)return n end
function l._Destroy(m)for n,o in ipairs(m.connections)do pcall(
function()o:Disconnect()end)end if m.tab then pcall(function()m.tab:
Destroy()end)end m.connections=nil m.tab=nil end function l.
_CreateTab(m,n,o,p)if m.tab then return end local q=Instance.new
'Frame'q.Name=o q.Parent=n q.BackgroundColor3=Color3.fromRGB(26,
25,33)q.BackgroundTransparency=1 q.BorderColor3=Color3.fromRGB(0,0,0)q.
BorderSizePixel=0 q.Position=UDim2.new(0,0,0,0)q.Size=UDim2.new(1,0,0,24)
local r=Instance.new'Frame'r.Name='TabContent'r.
Parent=q r.AnchorPoint=Vector2.new(1,0.5)r.
BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1
r.BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0
r.Position=UDim2.new(1,0,0.5,0)r.Size=UDim2.new(1,-24,1,0)
r.ClipsDescendants=true local s=Instance.new'TextLabel'
s.Name='NameLabel's.Parent=r s.
BackgroundColor3=Color3.fromRGB(255,255,255)s.BackgroundTransparency=1
s.BorderColor3=Color3.fromRGB(0,0,0)s.BorderSizePixel=0
s.Position=UDim2.new(0,0,0,0)s.Size=UDim2.new(1,0,1,0)
s.Font='Montserrat's.FontFace.Weight=Enum.FontWeight.Medium
s.Text=o s.TextColor3=Color3.fromRGB(200,180,200)s
.TextSize=16 s.TextXAlignment=Enum.TextXAlignment.Left local t=
Instance.new'UIPadding't.Parent=r t.PaddingBottom=UDim.
new(0,8)t.PaddingLeft=UDim.new(0,8)t.PaddingRight=UDim.new(0,8)
t.PaddingTop=UDim.new(0,8)local u=Instance.new'ImageButton'
u.Name='Icon'u.Parent=q u.AnchorPoint=Vector2.
new(0,0.5)u.AutoButtonColor=false u.BackgroundColor3=Color3.
fromRGB(66,150,250)u.BackgroundTransparency=1 u.BorderColor3
=Color3.fromRGB(0,0,0)u.BorderSizePixel=0 u.Position=UDim2.
new(0,0,0.5,0)u.Size=UDim2.new(1,0,1,0)u.ImageTransparency=1
local v=Instance.new'ImageLabel'v.Name='IconImage'v
.Parent=u v.BackgroundTransparency=1 v.Image=p
v.AnchorPoint=Vector2.new(0,0.5)v.Position=UDim2.new(0,0,0.5,0
)v.Size=UDim2.new(0,24,0,24)local w=Instance.new'UICorner'
w.Name='FrameRounding'w.Parent=u
w.CornerRadius=UDim.new(1,0)local x=Instance.new
'UIAspectRatioConstraint'x.Parent=v local y=Instance.
new'ImageLabel'y.Name='glowtop1'y.Parent=q y.
AnchorPoint=Vector2.new(0,0.5)y.BackgroundColor3=Color3.fromRGB(255,255,
255)y.BackgroundTransparency=1 y.BorderColor3=Color3.fromRGB(0,0
,0)y.BorderSizePixel=0 y.Position=UDim2.new(0,0,0.5,0)y.
Size=UDim2.new(1,2,1,2)y.ZIndex=4 y.Image=
'rbxassetid://76150694119616'local z=Instance.new'UICorner'
z.Name='FrameRounding'z.Parent=y
z.CornerRadius=UDim.new(1,0)local A=Instance.new
'UIGradient'A.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,
142,255)),ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}A.Parent=
y local B local C=false m:_TrackConnection(
u.MouseEnter:Connect(function()C=true if B then
B:Cancel()end b.TweenService:Create(y,
h,{BackgroundTransparency=0.8}):Play()local D=b.
TweenService:Create(A,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.
EasingDirection.Out),{Rotation=90,Offset=Vector2.new(-1,0)})D:Play()D.
Completed:Wait()if not C then return end B=b.
TweenService:Create(A,h,{Offset=Vector2.new(1,-0.5)})
B:Play()end))m:_TrackConnection(u.MouseLeave:Connect(
function()C=false if B then B:Cancel()end
b.TweenService:Create(y,h,{
BackgroundTransparency=(m.is_active and 0.6 or 1)}):Play()B=
b.TweenService:Create(A,h,{Rotation=0,
Offset=Vector2.new(0,0)})B:Play()end))m:_TrackConnection(
u.MouseButton1Click:Connect(function()if m.click_callback then m
.click_callback()end end))m.tab=q end function l._CreateTabContent(m,
n)if m.content_frame then return end if not m.tab then return end
local o=Instance.new'Frame'o.Name=m:GetName()..
'Content'o.Parent=n o.AnchorPoint=Vector2.new(1,0.5
)o.BackgroundColor3=Color3.fromRGB(26,25,33)o.
BackgroundTransparency=1 o.BorderColor3=Color3.fromRGB(0,0,0)
o.BorderSizePixel=0 o.Position=UDim2.new(1,0,0.5,0)
o.Size=UDim2.new(1,0,1,0)local p=Instance.new
'UIListLayout'p.Parent=o p.Padding=UDim.new(0,8
)p.FillDirection=Enum.FillDirection.Horizontal p.SortOrder=
Enum.SortOrder.LayoutOrder p.HorizontalAlignment=Enum.
HorizontalAlignment.Center p.HorizontalFlex=Enum.UIFlexAlignment.Fill
p.VerticalAlignment=Enum.VerticalAlignment.Center p.
VerticalFlex=Enum.UIFlexAlignment.Fill local q=Instance.new'UIPadding'
q.Parent=o q.PaddingBottom=UDim.new(0,8)q.
PaddingRight=UDim.new(0,8)q.PaddingTop=UDim.new(0,8)m.content_frame=
o end end local m={sidebar=nil,active_tab=nil,collapsed=
true,tabs={},connections={}}m.__index=m do function
m.CreateTab(n,o,p)if not n.tab_frame then return end local
q=setmetatable({},l)q:_CreateTab(n.tab_frame.
CenterSection,o,p)q:_CreateTabContent(n.content_frame)q.
_CreateTab=nil q._CreateTabContent=nil q.tab.LayoutOrder=#n.tabs-
1 table.insert(n.tabs,q)local r=#n.tabs if not n.active_tab
and r>1 then n:_SetActiveTab(r)end q:SetClickCallback(
function()n:_SetActiveTab(r)end)return q end function
m.Collapse(n)if n.animating then return end if n.collapsed then
return end if not n.sidebar then return end n.collapsed=not n.collapsed
n.animating=true local o=b.TweenService:Create(n.
sidebar,h,{Size=UDim2.new(0,34,1,-20),BackgroundTransparency=1})
o:Play()if o then o.Completed:Wait()end n
.animating=false return n end function m.Expand(n)if n.
animating then return end if not n.collapsed then return end if not n.
sidebar then return end n.collapsed=not n.collapsed n.animating=true
local o=b.TweenService:Create(n.sidebar,
h,{Size=UDim2.new(0,150,1,-20),BackgroundTransparency=0.4})
o:Play()if o then o.Completed:Wait()end n
.animating=false return n end function m._TrackConnection(n,o)
table.insert(n.connections,o)return o end function m.
_SetActiveTab(n,o)local p=n.tabs[o]if n.active_tab then local
q=n.tabs[n.active_tab]q.is_active=false q.
content_frame.Visible=false b.TweenService:Create(q.tab.
glowtop1,h,{BackgroundTransparency=1}):Play()end p.is_active=
true p.content_frame.Visible=true b.TweenService:Create(p.tab.
glowtop1,h,{BackgroundTransparency=0.6}):Play()n.active_tab=
o end function m._Destroy(n)for o,p in ipairs(n.tabs)do
pcall(function()p:_Destroy()end)end for o,p in ipairs(n.connections)do
pcall(function()p:Disconnect()end)end if n.menu_toggle then pcall(function
()n.menu_toggle:_Destroy()end)end if n.search_bar then pcall(function()
n.search_bar:_Destroy()end)end if n.sidebar then pcall(function()n.
sidebar:Destroy()end)end n.tabs=nil n.connections=nil n.menu_toggle=nil
n.search_bar=nil n.settings_tab=nil n.sidebar=nil n.tab_frame=nil
end function m._CreateSidebar(n,o)if n.sidebar then return end
local p=Instance.new'Frame'p.Parent=o p.AnchorPoint=
Vector2.new(0,0.5)p.BackgroundColor3=Color3.fromRGB(26,25,33)p.
BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)p.
BorderSizePixel=0 p.Position=UDim2.new(0,10,0.5,0)p.Size=UDim2.new(0
,34,1,-20)p.ClipsDescendants=true p.ZIndex=2 local q=Instance.
new'UIStroke'q.Parent=p q.ApplyStrokeMode=Enum.ApplyStrokeMode
.Border q.Color=Color3.fromRGB(134,134,147)q.Transparency=0.8 local
r=Instance.new'UICorner'r.CornerRadius=UDim.new(0,5)
r.Parent=p p.Destroying:Once(n._Destroy)local
s=Instance.new'Frame's.Name='Content's.Parent=p
s.AnchorPoint=Vector2.new(0,0.5)s.BackgroundColor3=Color3.
fromRGB(26,25,33)s.BackgroundTransparency=1 s.BorderColor3=
Color3.fromRGB(0,0,0)s.BorderSizePixel=0 s.Position=UDim2.new(0,
0,0.5,0)s.Size=UDim2.new(1,0,1,0)local t=Instance.new'Frame'
t.Name='TopSection't.Parent=s t.
AnchorPoint=Vector2.new(0.5,0)t.BackgroundColor3=Color3.fromRGB(255,
255,255)t.BackgroundTransparency=1 t.BorderColor3=Color3.
fromRGB(0,0,0)t.BorderSizePixel=0 t.Position=UDim2.new(0.5,0
,0,0)t.Size=UDim2.new(1,0,0,80)local u=Instance.new
'UIListLayout'u.Parent=t u.Padding=UDim.new(0,6)
u.SortOrder=Enum.SortOrder.LayoutOrder u.HorizontalAlignment
=Enum.HorizontalAlignment.Center u.HorizontalFlex=Enum.UIFlexAlignment
.Fill local v=Instance.new'UIPadding'v.Parent=t v.
PaddingBottom=UDim.new(0,5)v.PaddingLeft=UDim.new(0,5)v.PaddingRight
=UDim.new(0,5)v.PaddingTop=UDim.new(0,5)local w=Instance.new
'Frame'w.Name='BottomSection'w.Parent=s
w.AnchorPoint=Vector2.new(0.5,1)w.BackgroundColor3=
Color3.fromRGB(255,255,255)w.BackgroundTransparency=1
w.BorderColor3=Color3.fromRGB(0,0,0)w.BorderSizePixel=
0 w.Position=UDim2.new(0.5,0,1,0)w.Size=UDim2.new(1,0,
0,40)local x=Instance.new'UIListLayout'x.Parent=
w x.Padding=UDim.new(0,6)x.SortOrder=Enum.
SortOrder.LayoutOrder x.HorizontalAlignment=Enum.HorizontalAlignment
.Center x.HorizontalFlex=Enum.UIFlexAlignment.Fill x.
VerticalAlignment=Enum.VerticalAlignment.Bottom local y=Instance.new
'UIPadding'y.Parent=w y.PaddingBottom=UDim.new(0,5
)y.PaddingLeft=UDim.new(0,5)y.PaddingRight=UDim.new(0,5)
y.PaddingTop=UDim.new(0,5)local z=Instance.new
'ScrollingFrame'z.Name='CenterSection'z.Parent=
s z.AutomaticCanvasSize=Enum.AutomaticSize.Y z
.Active=true z.AnchorPoint=Vector2.new(0.5,1)z.
BackgroundColor3=Color3.fromRGB(255,255,255)z.
BackgroundTransparency=1 z.BorderColor3=Color3.fromRGB(0,0,0)
z.BorderSizePixel=0 z.Position=UDim2.new(0.5,0,1,-45)
z.Size=UDim2.new(1,0,1,-130)z.
ScrollBarImageTransparency=1 z.ScrollBarThickness=0 z.
ScrollingDirection=Enum.ScrollingDirection.Y z.ScrollingEnabled=
true local A=Instance.new'UIListLayout'A.Parent=
z A.Padding=UDim.new(0,8)A.SortOrder=Enum.
SortOrder.LayoutOrder A.HorizontalAlignment=Enum.HorizontalAlignment
.Center A.HorizontalFlex=Enum.UIFlexAlignment.Fill local B=
Instance.new'UIPadding'B.Parent=z B.PaddingBottom
=UDim.new(0,5)B.PaddingLeft=UDim.new(0,5)B.PaddingRight=UDim.
new(0,5)B.PaddingTop=UDim.new(0,5)n.sidebar=p n.tab_frame=
s end function m._CreateSidebarContent(n,o)if n.
content_frame then return end if not n.sidebar then return end local
p=Instance.new'Frame'p.Name='ContentFrame'
p.Parent=o p.AnchorPoint=Vector2.new(1,0.5)
p.BackgroundColor3=Color3.fromRGB(26,25,33)p.
BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)
p.BorderSizePixel=0 p.Position=UDim2.new(1,0,0.5,0)
p.Size=UDim2.new(1,-55,1,-20)n.content_frame=p end
function m._CreateMenuToggle(n)if n.menu_toggle then return end if
not n.tab_frame then return end local o=setmetatable({},l)
o:_CreateTab(n.tab_frame.TopSection,'',g.icons.Menu)o:
SetClickCallback(function()if n.collapsed then n:Expand()else n:
Collapse()end end)o.tab.LayoutOrder=0 o.tab.Icon.Size=UDim2.new(0,24
,0,24)o.tab.glowtop1.Size=UDim2.new(0,24,0,24)o.tab.TabContent.
NameLabel.Text='Menu'o._CreateTab=nil o._CreateTabContent=nil n.
menu_toggle=o end function m._CreateSearchBar(n)if n.
search_bar then return end if not n.tab_frame then return end local o=
setmetatable({},l)o:_CreateTab(n.tab_frame.TopSection,'',g.
icons.Search)o.tab.LayoutOrder=1 o.tab.TabContent.NameLabel:Destroy(
)o.tab.TabContent.UIPadding.PaddingBottom=UDim.new(0,4)o.tab.
TabContent.UIPadding.PaddingLeft=UDim.new(0,4)o.tab.TabContent.UIPadding.
PaddingRight=UDim.new(0,4)o.tab.TabContent.UIPadding.PaddingTop=UDim.new(0
,4)local p=Instance.new'Frame'p.Name='Container'p.
Parent=o.tab.TabContent p.AnchorPoint=Vector2.new(0.5,0.5)
p.BackgroundColor3=Color3.fromRGB(255,255,255)p.
BackgroundTransparency=0.3 p.BorderColor3=Color3.fromRGB(0,0,0)p
.BorderSizePixel=0 p.Position=UDim2.new(0.5,0,0.5,0)p.Size=UDim2
.new(1,0,1,0)local q=Instance.new'UIGradient'q.Parent=p
q.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(200,
180,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(150,200,255))}q.
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0.7),
NumberSequenceKeypoint.new(1,0.9)}local r=Instance.new'UICorner'
r.CornerRadius=UDim.new(1,0)r.Parent=p local
s=Instance.new'UIPadding's.Parent=p s.PaddingBottom=
UDim.new(0,0)s.PaddingLeft=UDim.new(0,12)s.PaddingRight=UDim.new(0,
12)s.PaddingTop=UDim.new(0,0)local t=Instance.new'TextBox'
t.Parent=p t.AnchorPoint=Vector2.new(0.5,0.5)t.
BackgroundColor3=Color3.fromRGB(255,255,255)t.BackgroundTransparency=1
t.BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0
t.ClearTextOnFocus=false t.Position=UDim2.new(0.5,0,0.5,0)
t.Size=UDim2.new(1,0,1,0)t.ClipsDescendants=true t.Font=
'Montserrat't.FontFace.Weight=Enum.FontWeight.Medium t.
PlaceholderText='Search't.PlaceholderColor3=Color3.fromRGB(200,180,200)
t.Text=''t.TextColor3=Color3.fromRGB(200,180,200)t.
TextSize=14 t.TextXAlignment=Enum.TextXAlignment.Left o:
SetClickCallback(function()if n.collapsed then n:Expand()end t:
CaptureFocus()end)n:_TrackConnection(t:GetPropertyChangedSignal
'Text':Connect(function()local u=t.Text:lower()for v,w in
ipairs(n.tabs)do local x=(w.tab.TabContent.NameLabel and w.tab.
TabContent.NameLabel.Text or''):lower()if x:find(u)then w.tab.
Visible=true else w.tab.Visible=false end end end))o._CreateTab=nil
o._CreateTabContent=nil n.search_bar=o end function m.
_CreateSettingsTab(n)if n.settings_tab then return end if not n.tab_frame
then return end local o=n:CreateTab('Settings',g.icons.Settings)
o.tab.Parent=n.tab_frame.BottomSection o.tab.LayoutOrder=0 n.
settings_tab=o end end local n={region=nil,content_frame=nil,
connections={}}n.__index=n setmetatable(n,{
__index=i})do function n.GetContainer(o)return o.
content_frame end function n._TrackConnection(o,p)table.insert(o.
connections,p)return p end function n._Destroy(o)for p,q in
ipairs(o.connections)do pcall(function()q:Disconnect()end)end if o.
region then pcall(function()o.region:Destroy()end)end o.connections=nil
o.region=nil end function n._CreateRegion(o,p,q)if o.
region then return end local r=q.Scroll and'ScrollingFrame'or'Frame'
local s=Instance.new(r)s.Name=q.Scroll and'ScrollingCanvas'or
'Canvas's.Parent=p s.Active=true s.AutomaticSize=q.
AutomaticSize s.BackgroundColor3=Color3.new(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.
BorderSizePixel=0 s.ClipsDescendants=true s.Destroying:Once(o.
_Destroy)if r=='ScrollingFrame'then s.ElasticBehavior=Enum.
ElasticBehavior.Never s.ScrollBarImageColor3=Color3.fromRGB(82,79,104)
s.ScrollBarImageTransparency=0.3 s.ScrollBarThickness=5 end local
t=Instance.new'UICorner't.Name='CornerRadius'
t.Parent=s t.CornerRadius=q.CornerRadius if
not q.Border then o.region=s return end local u=Instance.new
'UIStroke'u.Parent=s u.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border u.Color=Color3.fromRGB(134,134,147)u.Transparency=0.8 o.
region=s end function n._CreateRegionContent(o)if o.
content_frame then return end if not o.region then return end local
p=Instance.new'Frame'p.Name='ContentFrame'
p.Parent=o.region p.AnchorPoint=Vector2.new(0.5,0.5)
p.BackgroundColor3=Color3.fromRGB(26,25,33)p.
BackgroundTransparency=1 p.BorderColor3=Color3.fromRGB(0,0,0)
p.BorderSizePixel=0 p.Position=UDim2.new(0.5,0,0.5,0)
p.Size=UDim2.new(1,0,1,0)local q=Instance.new
'UIListLayout'q.Parent=p q.Padding=UDim.new(0,4
)q.SortOrder=Enum.SortOrder.LayoutOrder local r=Instance.new
'UIPadding'r.Parent=p r.PaddingBottom=UDim.new(0,8)
r.PaddingLeft=UDim.new(0,8)r.PaddingRight=UDim.new(0,8)r.
PaddingTop=UDim.new(0,8)o.content_frame=p end end local
o={label=nil}o.__index=o do function o.
SetText(p,q)p.label.Text=q return p end function o._Destroy(p
)if p.label then pcall(function()p.label:Destroy()end)end p.label=nil
end function o._CreateLabel(p,q,r)if p.label then return
end local s=Instance.new'TextLabel's.Name='Label's.Parent=q
s.AutomaticSize=Enum.AutomaticSize.XY s.BackgroundColor3=Color3.fromRGB(
255,255,255)s.BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0
,0)s.BorderSizePixel=0 s.Font=r.Font s.FontFace.Weight=r.
Weight s.Text=r.Text s.TextSize=r.TextSize s.TextColor3=
Color3.fromRGB(200,180,200)s.TextXAlignment=r.TextXAlignment s.
TextYAlignment=r.TextYAlignment s.Destroying:Once(p._Destroy)local
t=Instance.new'UIPadding't.Parent=s t.PaddingBottom=
r.Padding t.PaddingLeft=r.Padding t.PaddingRight=r.
Padding t.PaddingTop=r.Padding p.label=s end end local
p={console=nil,callback=nil}p.__index=p do
function p.SetValue(q,r)local s=q.console.Source s.
Text=r return q end function p.AppendText(q,r)local s=
q.console.Source s.Text=s.Text..(s.Text~=''and'\n'or'')..r
return q end function p.Clear(q)local r=q.console.Source
r.Text=''return q end function p._Destroy(q)if q.label
then pcall(function()q.label:Destroy()end)end q.label=nil end function
p._SourceChanged(q,r)if r~='Text'then return end wait()if q.
callback then q.callback()end if q.auto_scroll then q:_ScrollToBottom()
end end function p._ScrollToBottom(q)if not q.console then return
end q.console.CanvasPosition=Vector2.new(0,q.console.CanvasSize.Y.Offset-
q.console.AbsoluteSize.Y)end function p._CreateConsole(q,r,
s)if q.console then return end local t=Instance.new
'ScrollingFrame't.Name='Console't.Parent=r t.Active=true
t.BackgroundColor3=Color3.fromRGB(255,255,255)t.
BackgroundTransparency=0.3 t.BorderColor3=Color3.fromRGB(0,0,0)t.
BorderSizePixel=0 t.Size=UDim2.new(1,0,0,150)t.AutomaticCanvasSize=
Enum.AutomaticSize.Y t.CanvasSize=UDim2.new(0,0,0,0)t.
ElasticBehavior=Enum.ElasticBehavior.Never t.ScrollBarImageColor3=Color3.
fromRGB(26,25,33)t.ScrollBarImageTransparency=0.3 t.
ScrollBarThickness=1 t.Destroying:Once(q._Destroy)local u=
Instance.new'UIListLayout'u.Parent=t u.FillDirection
=Enum.FillDirection.Horizontal u.SortOrder=Enum.SortOrder.LayoutOrder
u.HorizontalFlex=Enum.UIFlexAlignment.Fill local v=
Instance.new'UICorner'v.Name='CornerRadius'v.Parent=
t v.CornerRadius=s.CornerRadius local w=Instance.
new'UIGradient'w.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,41))}w.Parent=t
local x=Instance.new'TextBox'x.Name='Source'x.Parent=t
x.AutomaticSize=Enum.AutomaticSize.Y x.BackgroundColor3=Color3.
fromRGB(255,255,255)x.BackgroundTransparency=1 x.BorderColor3=Color3.
fromRGB(0,0,0)x.BorderSizePixel=0 x.ClearTextOnFocus=false x.
LayoutOrder=2 x.MultiLine=true x.Size=UDim2.new(1,0,0,0)x.
TextEditable=not s.ReadOnly x.ZIndex=13 x.FontFace=Font.fromName
'Inconsolata'x.FontFace.Weight=Enum.FontWeight.Regular x.RichText=
s.RichText x.Text=s.Value x.TextSize=14 x.TextColor3=
Color3.fromRGB(200,180,200)x.TextWrapped=s.TextWrapped x.
TextXAlignment=Enum.TextXAlignment.Left x.TextYAlignment=Enum.
TextYAlignment.Top x.Changed:Once(q._SourceChanged)local y=
Instance.new'UIListLayout'y.Parent=x y.SortOrder=
Enum.SortOrder.LayoutOrder local z=Instance.new'UIPadding'z.Parent
=x z.PaddingBottom=UDim.new(0,5)z.PaddingLeft=UDim.new(0,5)
z.PaddingRight=UDim.new(0,5)z.PaddingTop=UDim.new(0,5)local
A=Instance.new'TextBox'A.Name='Highlight'A.Parent=
x A.Active=false A.AutomaticSize=Enum.AutomaticSize.Y
A.BackgroundColor3=Color3.fromRGB(255,255,255)A.
BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)A.
BorderSizePixel=0 A.ClearTextOnFocus=false A.Interactable=false
A.LayoutOrder=2 A.MultiLine=true A.Size=UDim2.new(1,0,0,
0)A.TextEditable=false A.ZIndex=13 A.Selectable=false
A.FontFace=Font.fromName'Inconsolata'A.FontFace.Weight=Enum.
FontWeight.Regular A.RichText=s.RichText A.Text=''A
.TextColor3=Color3.fromRGB(255,255,255)A.TextSize=14 A.
TextXAlignment=Enum.TextXAlignment.Left A.TextYAlignment=Enum.
TextYAlignment.Top local B=Instance.new'TextLabel'B.
Name='HighlightLine'B.Parent=x B.AutomaticSize=
Enum.AutomaticSize.Y B.BackgroundColor3=Color3.fromRGB(255,255,255)
B.BackgroundTransparency=1 B.Interactable=false
B.LayoutOrder=2 B.Size=UDim2.new(1,0,0,0)
B.ZIndex=13 B.FontFace=Font.fromName'Inconsolata'
B.FontFace.Weight=Enum.FontWeight.Regular B.RichText=
s.RichText B.Text=''B.TextColor3=Color3.fromRGB(
255,255,255)B.TextSize=14 B.TextWrapped=s.
TextWrapped B.TextXAlignment=Enum.TextXAlignment.Left
B.TextYAlignment=Enum.TextYAlignment.Top q.console=t q.
callback=s.Callback q.auto_scroll=s.AutoScroll end function
p._CreateConsoleBorder(q)if not q.console then return end local
r=Instance.new'UIStroke'r.Parent=q.console r.ApplyStrokeMode
=Enum.ApplyStrokeMode.Border r.Color=Color3.fromRGB(134,134,147)r.
Transparency=0.8 end function p._CreateConsoleLines(q)if not q.
console then return end local r=Instance.new'TextLabel'r.Name='Lines'
r.Parent=q.console r.AutomaticSize=Enum.AutomaticSize.XY r.
BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1 r
.BorderColor3=Color3.fromRGB(0,0,0)r.BorderSizePixel=0 r.LayoutOrder=1
r.ZIndex=14 r.FontFace=Font.fromName'Inconsolata'r.FontFace.Weight
=Enum.FontWeight.Regular r.Text='1'r.TextColor3=Color3.fromRGB(255,255,
255)r.TextSize=14 r.TextXAlignment=Enum.TextXAlignment.Left r.
TextYAlignment=Enum.TextYAlignment.Top local s=Instance.new'UIPadding'
s.Parent=r s.PaddingBottom=UDim.new(0,5)s.
PaddingLeft=UDim.new(0,5)s.PaddingRight=UDim.new(0,5)s.
PaddingTop=UDim.new(0,5)local t=Instance.new'UIFlexItem't.
Parent=r end end local q={sliderfloat=nil,value=nil,dragging
=false,callback=nil,connections={}}q.__index=q
do function q.SetValue(r,s)r.raw_value=s r.value=
string.format(r.format,s)r.track.Value.Text=r.value r.grab.
Position=UDim2.new(0,r:_GetSliderOffset(),0.5,0)if r.callback then r:
callback(s)end return r end function q._TrackConnection(r,
s)table.insert(r.connections,s)return s end function
q._Destroy(r)for s,t in ipairs(r.connections)do pcall(
function()t:Disconnect()end)end if r.sliderfloat then pcall(function()r
.sliderfloat:Destroy()end)end r.connections=nil r.sliderfloat=nil end
function q._Update(r,s)local t=s.Position.X local
u,v=r:_GetValueFromMouse(t)r.raw_value=u r.value=
string.format(r.format,u)r.track.Value.Text=r.value r.grab.
Position=UDim2.new(0,v,0.5,0)if r.callback then r:callback(u)end
end function q._GetValueFromMouse(r,s)local t=r.min or
0 local u=r.max or 100 local v=r.track.AbsolutePosition.X local
w=r.track.AbsoluteSize.X local x=r.grab.AbsoluteSize.X
local y=r.grab.AnchorPoint.X if w<=0 then return t,0 end
local z=x*y local A=w-x local
B=s-v B=math.clamp(B,z,A)
local C=(B-z)/(A-z)local D=t+(u-t)*
C return D,B end function q._GetSliderOffset(r)
local s=r.raw_value local t=r.min or 0 local u=r.max or 100
local v=r.track.AbsoluteSize.X local w=r.grab.
AbsoluteSize.X local x=r.grab.AnchorPoint.X if v<=0 then
return 0 end local y=w*x local z=v-
w/x local A=(s-t)/(u-t)A=math.clamp(A,0,1)
local B=y+(z-y)*A return B end
function q._CreateSliderFloat(r,s,t)if r.sliderfloat
then return end r.min=t.Minimum r.max=t.Maximum r.format=
t.Format r.raw_value=t.Value r.value=string.format(t.Format
,t.Value)r.callback=t.Callback local u=Instance.new
'Frame'u.Name='SliderFloat'u.Parent=s u.
BackgroundColor3=Color3.fromRGB(255,255,255)u.BackgroundTransparency=1
u.BorderColor3=Color3.fromRGB(0,0,0)u.BorderSizePixel=0
u.Size=UDim2.new(1,0,0,20)u.Destroying:Once(r._Destroy)
local v=Instance.new'UIListLayout'v.Parent=u
v.Padding=UDim.new(0,4)v.FillDirection=Enum.FillDirection.
Horizontal v.SortOrder=Enum.SortOrder.LayoutOrder v.
HorizontalAlignment=Enum.HorizontalAlignment.Center v.HorizontalFlex=
Enum.UIFlexAlignment.Fill v.VerticalAlignment=Enum.VerticalAlignment.
Center v.VerticalFlex=Enum.UIFlexAlignment.Fill local w=Instance.
new'TextButton'w.Name='Track'w.Parent=u w.
AutoButtonColor=false w.BackgroundColor3=Color3.fromRGB(255,255,255)w.
BackgroundTransparency=0.3 w.BorderColor3=Color3.fromRGB(0,0,0)w.
BorderSizePixel=0 w.Size=UDim2.new(0.5,0,1,0)w.Font='Montserrat'w.
FontFace.Weight=Enum.FontWeight.Medium w.Text=''w.TextTransparency=1
local x=Instance.new'UICorner'x.Parent=w
x.CornerRadius=UDim.new(0,2)local y=Instance.new'UIGradient'
y.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(31,
30,41)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,41))}y.Parent=w
local z=Instance.new'UIPadding'z.Parent=w z.
PaddingBottom=UDim.new(0,2)z.PaddingLeft=UDim.new(0,2)z.PaddingRight
=UDim.new(0,2)z.PaddingTop=UDim.new(0,2)local A=Instance.new
'UIStroke'A.Parent=w A.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border A.Color=Color3.fromRGB(134,134,147)A.Transparency=0.8 local
B=Instance.new'TextLabel'B.Name='Value'B.Parent=w B.
BackgroundColor3=Color3.fromRGB(255,255,255)B.BackgroundTransparency=1 B
.BorderColor3=Color3.fromRGB(0,0,0)B.BorderSizePixel=0 B.Size=UDim2.new(
1,0,1,0)B.ZIndex=2 B.ClipsDescendants=true B.Font='Montserrat'B.
FontFace.Weight=Enum.FontWeight.Medium B.Text=r.value B.TextColor3=
Color3.fromRGB(200,180,200)B.TextSize=14 local C=Instance.new
'TextLabel'C.Name='Label'C.Parent=u C.AutomaticSize=Enum.
AutomaticSize.XY C.BackgroundColor3=Color3.fromRGB(255,255,255)C.
BackgroundTransparency=1 C.BorderColor3=Color3.fromRGB(0,0,0)C.
BorderSizePixel=0 C.LayoutOrder=1 C.Size=UDim2.new(0,5,0,5)C.Font=
'Montserrat'C.FontFace.Weight=Enum.FontWeight.Medium C.Text=t.Label
C.TextColor3=Color3.fromRGB(200,180,200)C.TextSize=14 C.
TextXAlignment=Enum.TextXAlignment.Left r:_TrackConnection(w.InputBegan:
Connect(function(D)if D.UserInputType~=Enum.UserInputType.MouseButton1
then return end r.dragging=true r:_Update(D)end))r:
_TrackConnection(w.MouseEnter:Connect(function()if not r.grab then return
end b.TweenService:Create(r.grab,h,{
BackgroundTransparency=0}):Play()end))r:_TrackConnection(w.MouseLeave:
Connect(function()if not r.grab then return end b.TweenService:
Create(r.grab,h,{BackgroundTransparency=0.3}):Play()end))r
:_TrackConnection(b.UserInputService.InputChanged:Connect(function(
D)if not r.dragging or D.UserInputType~=Enum.UserInputType.
MouseMovement then return end r:_Update(D)end))r:_TrackConnection(
b.UserInputService.InputEnded:Connect(function(D)if D.
UserInputType~=Enum.UserInputType.MouseButton1 then return end r.dragging=
false end))r.sliderfloat=u r.track=w end function
q._CreateSliderGrab(r)if r.grab then return end if not r.
sliderfloat then return end local s=Instance.new'Frame's.Name=
'Overlay's.Parent=r.track s.AnchorPoint=Vector2.new(0.5,0.5)
s.BackgroundColor3=Color3.fromRGB(255,255,255)s.
BackgroundTransparency=1 s.BorderColor3=Color3.fromRGB(0,0,0)s.
BorderSizePixel=0 s.Position=UDim2.new(0.5,0,0.5,0)s.Size=UDim2.new(
1,0,1,8)s.ClipsDescendants=true local t=Instance.new'Frame't.Name=
'Grab't.Parent=s t.AnchorPoint=Vector2.new(0.5,0.5)t.
BackgroundColor3=Color3.fromRGB(255,255,255)t.BackgroundTransparency=0.3 t
.BorderSizePixel=0 t.Position=UDim2.new(0,0,0.5,0)t.Size=UDim2.new(0,10,1,-8
)local u=Instance.new'UIStroke'u.Parent=t u.
ApplyStrokeMode=Enum.ApplyStrokeMode.Border u.Color=Color3.fromRGB(233,173,
234)u.Transparency=0.8 local v=Instance.new'UICorner'
v.Parent=t v.CornerRadius=UDim.new(0,2)local w
=Instance.new'UIGradient'w.Parent=t w.Color=ColorSequence.new
{ColorSequenceKeypoint.new(0,Color3.fromRGB(223,142,255)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(233,173,234))}local x=Instance.new
'UISizeConstraint'x.MaxSize=Vector2.new(math.huge,math.huge)x
.MinSize=Vector2.new(10,0)local y=Instance.new'ImageLabel'y.
Name='glowbottom'y.Parent=t y.AnchorPoint=Vector2.new(0.5,1
)y.BackgroundColor3=Color3.fromRGB(255,255,255)y.
BackgroundTransparency=1 y.BorderColor3=Color3.fromRGB(0,0,0)y
.BorderSizePixel=0 y.Position=UDim2.new(0.5,0,1,4)y.Size=UDim2
.new(1,50,0,4)y.ZIndex=4 y.Image='rbxassetid://76150694119616'
local z=Instance.new'UIGradient'z.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(144,98,135)),ColorSequenceKeypoint.
new(0.28,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(0.5,Color3.
fromRGB(223,173,234)),ColorSequenceKeypoint.new(0.72,Color3.fromRGB(189,134,185)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(144,98,135))}z.
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.03,0.86),
NumberSequenceKeypoint.new(0.06,0.69),NumberSequenceKeypoint.new(0.11,0.53),
NumberSequenceKeypoint.new(0.15,0.43),NumberSequenceKeypoint.new(0.2,0.31),
NumberSequenceKeypoint.new(0.27,0.18),NumberSequenceKeypoint.new(0.33,0.09),
NumberSequenceKeypoint.new(0.39,0.04),NumberSequenceKeypoint.new(0.45,0.01),
NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(0.56,0.01),
NumberSequenceKeypoint.new(0.61,0.04),NumberSequenceKeypoint.new(0.67,0.11),
NumberSequenceKeypoint.new(0.73,0.21),NumberSequenceKeypoint.new(0.78,0.34),
NumberSequenceKeypoint.new(0.86,0.52),NumberSequenceKeypoint.new(0.93,0.72),
NumberSequenceKeypoint.new(1,1)}z.Parent=y local A=
Instance.new'ImageLabel'A.Name='glowbottom_2'A.Parent=
t A.AnchorPoint=Vector2.new(0.5,1)A.BackgroundColor3=
Color3.fromRGB(255,255,255)A.BackgroundTransparency=1 A.
BorderColor3=Color3.fromRGB(0,0,0)A.BorderSizePixel=0 A.
Position=UDim2.new(0.5,0,1,4)A.Size=UDim2.new(1,50,0,4)A.
ZIndex=4 A.Image='rbxassetid://76150694119616'local B=
Instance.new'UIGradient'B.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(144,98,135)),ColorSequenceKeypoint.
new(0.28,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(0.5,Color3.
fromRGB(223,173,234)),ColorSequenceKeypoint.new(0.72,Color3.fromRGB(189,134,185)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(144,98,135))}B.
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.03,0.86),
NumberSequenceKeypoint.new(0.06,0.69),NumberSequenceKeypoint.new(0.11,0.53),
NumberSequenceKeypoint.new(0.15,0.43),NumberSequenceKeypoint.new(0.2,0.31),
NumberSequenceKeypoint.new(0.27,0.18),NumberSequenceKeypoint.new(0.33,0.09),
NumberSequenceKeypoint.new(0.39,0.04),NumberSequenceKeypoint.new(0.45,0.01),
NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(0.56,0.01),
NumberSequenceKeypoint.new(0.61,0.04),NumberSequenceKeypoint.new(0.67,0.11),
NumberSequenceKeypoint.new(0.73,0.21),NumberSequenceKeypoint.new(0.78,0.34),
NumberSequenceKeypoint.new(0.86,0.52),NumberSequenceKeypoint.new(0.93,0.72),
NumberSequenceKeypoint.new(1,1)}B.Parent=A local
C=Instance.new'ImageLabel'C.Name='glowbottom_3'
C.Parent=t C.AnchorPoint=Vector2.new(0.5,1)C
.BackgroundColor3=Color3.fromRGB(255,255,255)C.BackgroundTransparency
=1 C.BorderColor3=Color3.fromRGB(0,0,0)C.BorderSizePixel=0
C.Position=UDim2.new(0.5,0,1,4)C.Size=UDim2.new(1,50,0,4)
C.ZIndex=4 C.Image='rbxassetid://76150694119616'local
D=Instance.new'UIGradient'D.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(144,98,135)),ColorSequenceKeypoint.
new(0.28,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(0.5,Color3.
fromRGB(223,173,234)),ColorSequenceKeypoint.new(0.72,Color3.fromRGB(189,134,185)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(144,98,135))}D.
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),
NumberSequenceKeypoint.new(1,1),NumberSequenceKeypoint.new(1,1)}D.
Parent=C local E=Instance.new'ImageLabel'E.
Name='glowbottom_4'E.Parent=t E.AnchorPoint=Vector2.
new(0.5,1)E.BackgroundColor3=Color3.fromRGB(255,255,255)E.
BackgroundTransparency=1 E.BorderColor3=Color3.fromRGB(0,0,0)
E.BorderSizePixel=0 E.Position=UDim2.new(0.5,0,1,4)
E.Size=UDim2.new(1,50,0,4)E.ZIndex=4 E.Image=
'rbxassetid://76150694119616'local F=Instance.new'UIGradient'
F.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
144,98,135)),ColorSequenceKeypoint.new(0.28,Color3.fromRGB(189,134,185)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,173,234)),ColorSequenceKeypoint
.new(0.72,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(144,98,135))}F.Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(1,1),
NumberSequenceKeypoint.new(1,1)}F.Parent=E task.defer(
function()t.Position=UDim2.new(0,r:_GetSliderOffset(),0.5,0)end)r.grab=
t end end local r={checkbox=nil,value=nil,callback=nil,
connections={}}r.__index=r do function r.
SetValue(s,t)s:_ChangeValue(t)return s end function r.
Toggle(s)s:_ChangeValue(not s.value)return s end function r.
_TrackConnection(s,t)table.insert(s.connections,t)return t end
function r._Destroy(s)for t,u in ipairs(s.connections)do
pcall(function()u:Disconnect()end)end if s.checkbox then pcall(function()
s.checkbox:Destroy()end)end s.connections=nil s.checkbox=nil end
function r._ChangeValue(s,t)if t==s.value then return end
if not s.tick then return end if t then b.TweenService:
Create(s.tick,h,{BackgroundTransparency=0.3,Size=UDim2.new(1,
0,1,0)}):Play()b.TweenService:Create(s.tick.UICorner,
h,{CornerRadius=UDim.new(0,2)}):Play()b.TweenService
:Create(s.tick.UIStroke,h,{Transparency=0.8}):Play()
b.TweenService:Create(s.tick.glowtop,h,{
ImageTransparency=0}):Play()b.TweenService:Create(s.tick.
glowtop_2,h,{ImageTransparency=0}):Play()else b.
TweenService:Create(s.tick,h,{BackgroundTransparency=1,Size=
UDim2.new(0,0,0,0)}):Play()b.TweenService:Create(s.tick.UICorner,
h,{CornerRadius=UDim.new(1,0)}):Play()b.TweenService
:Create(s.tick.UIStroke,h,{Transparency=1}):Play()
b.TweenService:Create(s.tick.glowtop,h,{
ImageTransparency=1}):Play()b.TweenService:Create(s.tick.
glowtop_2,h,{ImageTransparency=1}):Play()end if s.callback
then s:callback(t)end s.value=t end function r.
_CreateCheckbox(s,t,u)if s.checkbox then return end s.value=u
.Value s.callback=u.Callback local v=Instance.new'TextButton'
v.Name='Checkbox'v.Parent=t v.AutoButtonColor=false
v.AutomaticSize=Enum.AutomaticSize.XY v.BackgroundColor3=Color3.
fromRGB(255,255,255)v.BackgroundTransparency=1 v.BorderColor3=
Color3.fromRGB(0,0,0)v.BorderSizePixel=0 v.Size=UDim2.new(0,10,0,0
)v.Text=''v.TextTransparency=1 v.Destroying:Once(s.
_Destroy)local w=Instance.new'UIListLayout'w.Parent=
v w.Padding=UDim.new(0,5)w.FillDirection=Enum.
FillDirection.Horizontal w.SortOrder=Enum.SortOrder.LayoutOrder
w.VerticalAlignment=Enum.VerticalAlignment.Center local x=
Instance.new'ImageButton'x.Name='Tickbox'x.Parent=v x
.AutoButtonColor=false x.BackgroundColor3=Color3.fromRGB(255,255,255)
x.BackgroundTransparency=0.3 x.BorderColor3=Color3.fromRGB(0,0,0)
x.BorderSizePixel=0 x.Size=UDim2.new(0,20,0,20)x.Image=''
x.Selectable=false local y=Instance.new'UICorner'
y.Parent=x y.CornerRadius=UDim.new(0,5)local
z=Instance.new'UIGradient'z.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(
0.5,Color3.fromRGB(25,23,32)),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,
41))}z.Parent=x local A=Instance.new'UIPadding'A.
Parent=x A.PaddingBottom=UDim.new(0,3)A.PaddingLeft=UDim.new(0
,3)A.PaddingRight=UDim.new(0,3)A.PaddingTop=UDim.new(0,3)local
B=Instance.new'UIStroke'B.Parent=x B.ApplyStrokeMode=Enum
.ApplyStrokeMode.Border B.Color=Color3.fromRGB(134,134,147)B.
Transparency=0.8 local C=Instance.new'TextLabel'C.Name='Label'C.
Parent=v C.AutomaticSize=Enum.AutomaticSize.XY C.BackgroundColor3
=Color3.fromRGB(255,255,255)C.BackgroundTransparency=1 C.BorderColor3=
Color3.fromRGB(0,0,0)C.BorderSizePixel=0 C.LayoutOrder=1 C.Size=
UDim2.new(0,5,0,5)C.Font='Montserrat'C.FontFace.Weight=Enum.FontWeight.
Medium C.Text=u.Label C.TextColor3=Color3.fromRGB(200,180,200)C
.TextSize=14 C.TextXAlignment=Enum.TextXAlignment.Left s:
_TrackConnection(x.MouseEnter:Connect(function()if not s.tick then
return end b.TweenService:Create(s.tick,h,{
BackgroundTransparency=0}):Play()end))s:_TrackConnection(x.MouseLeave:
Connect(function()if not s.tick then return end b.TweenService:
Create(s.tick,h,{BackgroundTransparency=0.3}):Play()end))s
:_TrackConnection(x.MouseButton1Click:Connect(function()if not s.tick
then return end s:Toggle()end))s.checkbox=v end function
r._CreateTick(s)if s.tick then return end if not s.checkbox
then return end local t=Instance.new'Frame't.Name='Tick't
.Parent=s.checkbox.Tickbox t.AnchorPoint=Vector2.new(0.5,0.5)t.
BackgroundColor3=Color3.fromRGB(255,255,255)t.BackgroundTransparency=0.3
t.BorderColor3=Color3.fromRGB(0,0,0)t.BorderSizePixel=0 t.
Interactable=false t.LayoutOrder=1 t.Position=UDim2.new(0.5,0,0.5,
0)t.Size=UDim2.new(1,0,1,0)local u=Instance.new'UIStroke'u.
Parent=t u.ApplyStrokeMode=Enum.ApplyStrokeMode.Border u.Color=
Color3.fromRGB(233,173,234)u.Transparency=0.8 local v=Instance.
new'UICorner'v.Parent=t v.CornerRadius=UDim.
new(0,2)local w=Instance.new'UIGradient'w.Parent=t
w.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(223,
142,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(233,173,234))}local x
=Instance.new'ImageLabel'x.Name='glowtop'x.Parent=t x
.AnchorPoint=Vector2.new(0.5,0.5)x.BackgroundColor3=Color3.fromRGB(255,255
,255)x.BackgroundTransparency=1 x.BorderColor3=Color3.fromRGB(0,0,0)
x.BorderSizePixel=0 x.Position=UDim2.new(0.5,0,0.5,0)x.Size=
UDim2.new(1,10,1,10)x.ZIndex=4 x.Image='rbxassetid://76150694119616'
local y=Instance.new'UIGradient'y.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(134,134,147)),ColorSequenceKeypoint.
new(0.5,Color3.fromRGB(223,142,255)),ColorSequenceKeypoint.new(0.74,Color3.
fromRGB(148,189,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}
y.Parent=x local z=Instance.new'UICorner'
z.Parent=x local A=Instance.new'ImageLabel'
A.Name='glowtop_2'A.Parent=t A.AnchorPoint=
Vector2.new(0.5,0.5)A.BackgroundColor3=Color3.fromRGB(255,255,255)
A.BackgroundTransparency=1 A.BorderColor3=Color3.fromRGB(0,0,0)
A.BorderSizePixel=0 A.Position=UDim2.new(0.5,0,0.5,0)A.
Size=UDim2.new(1,10,1,10)A.ZIndex=4 A.Image=
'rbxassetid://76150694119616'local B=Instance.new'UIGradient'
B.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(
134,134,147)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(223,142,255)),
ColorSequenceKeypoint.new(0.74,Color3.fromRGB(148,189,255)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(134,134,147))}B.Parent=
A local C=Instance.new'UICorner'C.Parent=
A s.tick=t end end local s={button=nil,style=nil,
callback=nil,connections={}}s.__index=s do function
s.SetClickCallback(t,u)t.callback=u return t end
function s._TrackConnection(t,u)table.insert(t.connections,u)
return u end function s._Destroy(t)for u,v in ipairs(t.
connections)do pcall(function()v:Disconnect()end)end if t.button then
pcall(function()t.button:Destroy()end)end t.connections=nil t.button=
nil end function s._SetButtonStyle(t,u)if not t.button then
return end t.style=string.lower(u)local v=t.button.UIGradient
if t.style=='primary'then v.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(144,98,135)),ColorSequenceKeypoint.
new(0.2,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(0.5,Color3.
fromRGB(223,173,234)),ColorSequenceKeypoint.new(0.8,Color3.fromRGB(189,134,185))
,ColorSequenceKeypoint.new(1,Color3.fromRGB(144,98,135))}v.Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.3),NumberSequenceKeypoint.new(
1,0.3)}elseif t.style=='secondary'then v.Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(223,173,234)),ColorSequenceKeypoint.
new(0.2,Color3.fromRGB(189,134,185)),ColorSequenceKeypoint.new(0.5,Color3.
fromRGB(125,99,134)),ColorSequenceKeypoint.new(0.8,Color3.fromRGB(189,134,185)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(223,173,234))}v.Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.8),NumberSequenceKeypoint.new(
0.5,0.6),NumberSequenceKeypoint.new(1,0.8)}end end function s.
_CreateButton(t,u,v)if t.button then return end t.callback=v.
Callback local w=Instance.new'TextButton'w.Name='Button'w.
Parent=u w.AutoButtonColor=false w.AutomaticSize=Enum.
AutomaticSize.XY w.BackgroundColor3=Color3.fromRGB(255,255,255)w.
BackgroundTransparency=0 w.BorderColor3=Color3.fromRGB(0,0,0)w.
BorderSizePixel=0 w.Size=UDim2.new(1,0,0,20)w.Text=''w.
TextTransparency=1 w.Destroying:Once(t._Destroy)local x=Instance.
new'UIStroke'x.Parent=w x.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border x.Color=Color3.fromRGB(123,92,126)local y=Instance.new
'UICorner'y.Parent=w y.CornerRadius=UDim.new(0,2)
local z=Instance.new'UIGradient'z.Parent=w z.
Rotation=90 local A=Instance.new'UIListLayout'A.Parent=
w A.SortOrder=Enum.SortOrder.LayoutOrder A.
HorizontalAlignment=Enum.HorizontalAlignment.Center A.
VerticalAlignment=Enum.VerticalAlignment.Center local B=Instance.new
'UIPadding'B.Parent=w B.PaddingBottom=UDim.new(0,3)B.
PaddingLeft=UDim.new(0,4)B.PaddingRight=UDim.new(0,4)B.PaddingTop=
UDim.new(0,3)local C=Instance.new'TextLabel'C.Name='Label'C.Parent
=w C.AutomaticSize=Enum.AutomaticSize.XY C.BackgroundColor3=Color3.
fromRGB(255,255,255)C.BackgroundTransparency=1 C.BorderColor3=Color3.
fromRGB(0,0,0)C.BorderSizePixel=0 C.LayoutOrder=1 C.Size=UDim2.new(0
,5,0,5)C.Font='Montserrat'C.FontFace.Weight=Enum.FontWeight.Medium C
.Text=v.Text C.TextColor3=Color3.fromRGB(255,255,255)C.TextSize=12
C.TextXAlignment=Enum.TextXAlignment.Left t:_TrackConnection(w.
MouseEnter:Connect(function()if not t.button then return end b.
TweenService:Create(t.button.UIStroke,h,{Color=Color3.
fromRGB(184,138,189)}):Play()end))t:_TrackConnection(w.MouseLeave:
Connect(function()if not t.button then return end b.TweenService:
Create(t.button.UIStroke,h,{Color=Color3.fromRGB(123,92,126)}
):Play()end))t:_TrackConnection(w.MouseButton1Down:Connect(function()if
not t.button then return end b.TweenService:Create(t.button,
h,{BackgroundTransparency=0.3}):Play()end))t:
_TrackConnection(w.MouseButton1Up:Connect(function()if not t.button then
return end b.TweenService:Create(t.button,h,{
BackgroundTransparency=0}):Play()end))t:_TrackConnection(w.
MouseButton1Click:Connect(function()if not t.button then return end if t.
callback then t:callback()end end))t.button=w end end local
t={keybind=nil,value=nil,callback=nil,connections={}}t.
__index=t do function t.SetValue(u,v)u.value=v
u.keybind.Display.Value.Text=u:_GetStringForKeyCode(v)if u.callback
then u:callback(v)end return u end function t.
_TrackConnection(u,v)table.insert(u.connections,v)return v end
function t._Destroy(u)for v,w in ipairs(u.connections)do pcall(
function()w:Disconnect()end)end if u.keybind then pcall(function()u.
keybind:Destroy()end)end u.connections=nil u.keybind=nil end function
t._GetStringForKeyCode(u,v)local w=v.Name w=w:
gsub('Left','L'):gsub('Right','R'):gsub('Control','Ctrl')return w end
function t._CreateKeybind(u,v,w)if u.keybind then return
end u.value=w.Value u.callback=w.Callback local x=Instance
.new'Frame'x.Name='Keybind'x.Parent=v x.
BackgroundColor3=Color3.fromRGB(255,255,255)x.BackgroundTransparency=1
x.BorderColor3=Color3.fromRGB(0,0,0)x.BorderSizePixel=0 x.Size
=UDim2.new(1,0,0,20)x.Destroying:Once(u._Destroy)local y=
Instance.new'UIListLayout'y.Parent=x y.Padding=UDim.
new(0,4)y.FillDirection=Enum.FillDirection.Horizontal y.
SortOrder=Enum.SortOrder.LayoutOrder y.HorizontalAlignment=Enum.
HorizontalAlignment.Left y.HorizontalFlex=Enum.UIFlexAlignment.None
y.VerticalAlignment=Enum.VerticalAlignment.Center y.
VerticalFlex=Enum.UIFlexAlignment.Fill local z=Instance.new'TextLabel'
z.Name='Label'z.Parent=x z.AutomaticSize=Enum.AutomaticSize.XY
z.BackgroundColor3=Color3.fromRGB(255,255,255)z.BackgroundTransparency=1
z.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel=0 z.Size=UDim2
.new(0,5,0,5)z.Font='Montserrat'z.FontFace.Weight=Enum.FontWeight.Medium
z.Text=w.Label z.TextColor3=Color3.fromRGB(200,180,200)z.
TextSize=14 z.TextXAlignment=Enum.TextXAlignment.Left local A=Instance
.new'TextButton'A.Name='Display'A.Parent=x A.
AutoButtonColor=false A.AutomaticSize=Enum.AutomaticSize.X A.
BackgroundColor3=Color3.fromRGB(255,255,255)A.BackgroundTransparency=0.3
A.BorderColor3=Color3.fromRGB(0,0,0)A.BorderSizePixel=0 A.
LayoutOrder=1 A.Size=UDim2.new(0,0,1,0)A.Text=''A.
TextTransparency=1 local B=Instance.new'UICorner'B.
Parent=A B.CornerRadius=UDim.new(0,2)local C=Instance.
new'UIGradient'C.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,41))}C.Parent=A
local D=Instance.new'UIPadding'D.Parent=A D.
PaddingBottom=UDim.new(0,2)D.PaddingLeft=UDim.new(0,8)D.PaddingRight
=UDim.new(0,8)D.PaddingTop=UDim.new(0,2)local E=Instance.new
'UIStroke'E.Parent=A E.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border E.Color=Color3.fromRGB(134,134,147)E.Transparency=0.8 local
F=Instance.new'TextLabel'F.Name='Value'F.Parent=A F.
AutomaticSize=Enum.AutomaticSize.X F.BackgroundColor3=Color3.fromRGB(255,255
,255)F.BackgroundTransparency=1 F.BorderColor3=Color3.fromRGB(0,0,0)
F.BorderSizePixel=0 F.Size=UDim2.new(0,0,1,0)F.ZIndex=2 F.
ClipsDescendants=true F.Font='Montserrat'F.FontFace.Weight=Enum.
FontWeight.Medium F.Text=u:_GetStringForKeyCode(u.value)F.
TextColor3=Color3.fromRGB(200,180,200)F.TextSize=14 u:_TrackConnection(
A.MouseButton1Click:Connect(function()if u.listening then return end
u.listening=true u.new_value=nil F.Text='_'while u.listening do
F.Text=F.Text==' 'and'_'or' 'task.wait(0.5)end end))u:
_TrackConnection(b.UserInputService.InputBegan:Connect(function(
G,H)if H or G.UserInputType~=Enum.UserInputType.Keyboard
then return end if u.listening then u.new_value=G.KeyCode u.
listening=false if not u.new_value then return end u.value=u.new_value
F.Text=u:_GetStringForKeyCode(u.new_value)end if G.KeyCode==u.
value and u.callback then u:callback(u.value)end end))u.keybind=
x end end local u={combo=nil,callback=nil,value=nil,items={},
connections={}}u.__index=u do function u.GetItems(v
)return v.items end function u.AddItem(v,w)table.insert(v.items
,w)v:_RefreshItems()end function u.Expand(v)if not v.collapsed
then return end b.TweenService:Create(v.combo.Display.Arrow,
h,{Rotation=90}):Play()v.dropdown.Visible=true v.collapsed
=false end function u.Collapse(v)if v.collapsed then return end
b.TweenService:Create(v.combo.Display.Arrow,h,{
Rotation=180}):Play()v.dropdown.Visible=false v.collapsed=true end
function u.SetValue(v,w)v:_ChangeValue(w)return v end
function u._TrackConnection(v,w)table.insert(v.connections,w)
return w end function u._Destroy(v)for w,x in ipairs(v.
connections)do pcall(function()x:Disconnect()end)end if v.combo then
pcall(function()v.combo:Destroy()end)end v.connections=nil v.combo=nil
end function u._ClearDropdown(v)if not v.dropdown then return end
for w,x in ipairs(v.dropdown:GetChildren())do if not x:IsA'TextButton'then
continue end x:Destroy()end end function u._ChangeValue(v,w)if not
v.combo then return end v.combo.Display.Value.Text=w v.value=w
if v.callback then v:callback(w)end end function u.
_RefreshItems(v)if not v.dropdown then return end v:_ClearDropdown()for w,x
in ipairs(v.items)do local y=Instance.new'TextButton'y.Name=x y.
Parent=v.dropdown y.AutoButtonColor=false y.BackgroundColor3=Color3.
fromRGB(255,255,255)y.BackgroundTransparency=1 y.BorderColor3=Color3.
fromRGB(0,0,0)y.BorderSizePixel=0 y.LayoutOrder=w y.Size=UDim2.new(1,0,
0,20)y.ClipsDescendants=true y.Text=''y.TextTransparency=1 local z=
Instance.new'TextLabel'z.Name='Value'z.Parent=y z.
BackgroundColor3=Color3.fromRGB(255,255,255)z.BackgroundTransparency=1 z
.BorderColor3=Color3.fromRGB(0,0,0)z.BorderSizePixel=0 z.Size=UDim2.new(
1,0,1,0)z.ClipsDescendants=true z.Font='Montserrat'z.FontFace.Weight
=Enum.FontWeight.Medium z.TextXAlignment=Enum.TextXAlignment.Left z.Text
=x z.TextTruncate=Enum.TextTruncate.SplitWord z.TextColor3=Color3.
fromRGB(200,180,200)z.TextSize=14 y.MouseButton1Click:Once(function()v
:Collapse()v:_ChangeValue(z.Text)end)end end function u.
_CreateCombo(v,w,x)if v.combo then return end v.value=x.
Placeholder v.items=x.Items v.callback=x.Callback local y=
Instance.new'Frame'y.Name='Combo'y.Parent=w y.
BackgroundColor3=Color3.fromRGB(255,255,255)y.BackgroundTransparency=1 y
.BorderColor3=Color3.fromRGB(0,0,0)y.BorderSizePixel=0 y.Size=UDim2.new(
1,0,0,20)y.Destroying:Once(v._Destroy)local z=Instance.new
'UIListLayout'z.Parent=y z.Padding=UDim.new(0,4)
z.FillDirection=Enum.FillDirection.Horizontal z.SortOrder=
Enum.SortOrder.LayoutOrder z.HorizontalAlignment=Enum.
HorizontalAlignment.Center z.HorizontalFlex=Enum.UIFlexAlignment.Fill
z.VerticalAlignment=Enum.VerticalAlignment.Center z.
VerticalFlex=Enum.UIFlexAlignment.Fill local A=Instance.new'TextButton'
A.Name='Display'A.Parent=y A.AutoButtonColor=false A
.BackgroundColor3=Color3.fromRGB(255,255,255)A.BackgroundTransparency=0.3
A.BorderColor3=Color3.fromRGB(0,0,0)A.BorderSizePixel=0 A.Size
=UDim2.new(0.5,0,1,0)A.Text=''A.TextTransparency=1 local
B=Instance.new'UICorner'B.Parent=A B
.CornerRadius=UDim.new(0,2)local C=Instance.new'UIGradient'C.
Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(31,30,41)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(31,30,41))}C.Parent=A local D=Instance.
new'UIPadding'D.Parent=A D.PaddingBottom=UDim.new(0,2)
D.PaddingLeft=UDim.new(0,4)D.PaddingRight=UDim.new(0,2)D.
PaddingTop=UDim.new(0,2)local E=Instance.new'UIStroke'E.Parent=
A E.ApplyStrokeMode=Enum.ApplyStrokeMode.Border E.Color=Color3.
fromRGB(134,134,147)E.Transparency=0.8 local F=Instance.new'TextLabel'
F.Name='Value'F.Parent=A F.BackgroundColor3=Color3.fromRGB(
255,255,255)F.BackgroundTransparency=1 F.BorderColor3=Color3.fromRGB(0,0
,0)F.BorderSizePixel=0 F.Size=UDim2.new(1,-15,1,0)F.ZIndex=2 F.
ClipsDescendants=true F.Font='Montserrat'F.FontFace.Weight=Enum.
FontWeight.Medium F.TextXAlignment=Enum.TextXAlignment.Left F.Text=v.
value F.TextTruncate=Enum.TextTruncate.SplitWord F.TextColor3=Color3.
fromRGB(200,180,200)F.TextSize=14 local G=Instance.new'ImageLabel'
G.Name='Arrow'G.Parent=A G.AnchorPoint=Vector2.new(1,0.5)G
.BackgroundColor3=Color3.fromRGB(255,255,255)G.BackgroundTransparency=1
G.Position=UDim2.new(1,0,0.5,0)G.Rotation=180 G.Size=UDim2.new(0,15,
0,15)G.ZIndex=1 G.Image='rbxassetid://4731371527'local H=Instance.
new'TextLabel'H.Name='Label'H.Parent=y H.AutomaticSize=Enum.
AutomaticSize.XY H.BackgroundColor3=Color3.fromRGB(255,255,255)H.
BackgroundTransparency=1 H.BorderColor3=Color3.fromRGB(0,0,0)H.
BorderSizePixel=0 H.LayoutOrder=1 H.Size=UDim2.new(0,5,0,5)H.Font=
'Montserrat'H.FontFace.Weight=Enum.FontWeight.Medium H.Text=x.Label
H.TextColor3=Color3.fromRGB(200,180,200)H.TextSize=14 H.
TextXAlignment=Enum.TextXAlignment.Left v:_TrackConnection(A.
MouseButton1Click:Connect(function()if not v.dropdown then return end if v
.collapsed then v:Expand()else v:Collapse()end v:_RefreshItems()end))
v.combo=y v.collapsed=true end function u.
_CreateDropdownMenu(v)if v.dropdown then return end if not v.combo then
return end local w=Instance.new'Frame'w.Name='Dropdown'w.
Parent=v.combo.Display w.AnchorPoint=Vector2.new(0.5,0)w.
AutomaticSize=Enum.AutomaticSize.Y w.BackgroundColor3=Color3.fromRGB(255,
255,255)w.BackgroundTransparency=0.3 w.BorderColor3=Color3.
fromRGB(0,0,0)w.BorderSizePixel=0 w.Visible=false w.
Position=UDim2.new(0.5,0,1,4)w.Size=UDim2.new(1,0,0,0)local x=
Instance.new'UIListLayout'x.Parent=w x.
FillDirection=Enum.FillDirection.Vertical x.SortOrder=Enum.SortOrder.
LayoutOrder x.HorizontalAlignment=Enum.HorizontalAlignment.Left
x.HorizontalFlex=Enum.UIFlexAlignment.Fill x.
VerticalAlignment=Enum.VerticalAlignment.Top x.VerticalFlex=Enum.
UIFlexAlignment.None local y=Instance.new'UICorner'y.
Parent=w y.CornerRadius=UDim.new(0,2)local z=Instance.
new'UIGradient'z.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,
Color3.fromRGB(31,30,41)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(25,23,32)
),ColorSequenceKeypoint.new(1,Color3.fromRGB(31,30,41))}z.Parent=w
local A=Instance.new'UIPadding'A.Parent=w A.
PaddingBottom=UDim.new(0,2)A.PaddingLeft=UDim.new(0,4)A.PaddingRight
=UDim.new(0,2)A.PaddingTop=UDim.new(0,2)local B=Instance.new
'UIStroke'B.Parent=w B.ApplyStrokeMode=Enum.ApplyStrokeMode.
Border B.Color=Color3.fromRGB(134,134,147)B.Transparency=0.8 v.
dropdown=w end end local v={separator=nil}v.
__index=v do function v._CreateSeparator(w,x)if
w.separator then return end local y=Instance.new'Frame'y.
Name='Separator'y.Parent=x y.AutomaticSize=Enum.
AutomaticSize.Y y.BackgroundColor3=Color3.fromRGB(255,255,255)y.
BackgroundTransparency=1 y.BorderColor3=Color3.fromRGB(0,0,0)y.
BorderSizePixel=0 y.Size=UDim2.new(1,0,0,0)local z=Instance.new
'UIPadding'z.Parent=y z.PaddingBottom=UDim.new(0,4)z.
PaddingLeft=UDim.new(0,2)z.PaddingRight=UDim.new(0,2)z.PaddingTop=
UDim.new(0,4)local A=Instance.new'Frame'A.Name='Bar'A.Parent=y
A.AnchorPoint=Vector2.new(0.5,0.5)A.BackgroundColor3=Color3.fromRGB(110,110,
128)A.BackgroundTransparency=0.5 A.BorderColor3=Color3.fromRGB(0,0,0)A.
BorderSizePixel=0 A.Position=UDim2.new(0.5,0,0.5,0)A.Size=UDim2.new(1,0,0,2)
w.separator=y end end c={}do function c.
HSMerge(w,x,y)y=y or{}for z,A in pairs(x)do if y
[z]==nil then y[z]=A end end return y end function c.
HSGetGuiRoot(w)return gethui and gethui()or get_hidden_gui and get_hidden_gui()or
c:HSNewRef(game:GetService'CoreGui').RobloxGui end function
c.HSNewRef(w,x)if cloneref then return cloneref(x)end
return x end function c.HSRandomString(w,x)local y=
''for z=1,x do y=y..string.char(Random.new():NextInteger(1,255))
end return y end end d={}do function d.
CSGetSafeGui(w)if d.safe_gui then return d.safe_gui end
local x=Instance.new'ScreenGui'x.Name=c:
HSRandomString(20)x.IgnoreGuiInset=true x.ResetOnSpawn=false
x.ZIndexBehavior=Enum.ZIndexBehavior.Sibling x.DisplayOrder=
2147483647 x.Parent=c:HSGetGuiRoot()d.safe_gui=
x return x end function d.CSNotifCreate(w,x)local
y=setmetatable({},k)y:_CreateNotif(
d:CSGetSafeGui())y:_CreateNotifGlow()y:
_CreateNotifContent()if x.Title then y:SetTitle(x.Title)
end if x.Body then y:SetBody(x.Body)end if x.Icon
then y:SetIcon(x.Icon)end if x.Duration then y
:SetDuration(x.Duration)end return y end function
d.CSWindowCreate(w,x)local y=setmetatable({},
j)y:_CreateWindow(d:CSGetSafeGui(),x)
y:_CreateWindowGlow()y:_CreateWindowContent()
y:_CreateTitleBar(x)if not x.NoCollapse then
y:_CreateCollapseButton()end if not x.NoClose then
y:_CreateCloseButton()end if x.Collapsed then y:
Collapse()else y:Expand()end return y end function
d.CSSidebarCreate(w,x)local y=setmetatable({},
m)y:_CreateSidebar(x)y:
_CreateSidebarContent(x)y:_CreateMenuToggle()y:
_CreateSearchBar()y:_CreateSettingsTab()return y,
y.settings_tab end function d.CSRegionCreate(w,x,
y)local z=setmetatable({},n)z:
_CreateRegion(x,y)z:_CreateRegionContent()return
z end function d.CSLabelCreate(w,x,y)local
z=setmetatable({},o)z:_CreateLabel(x,
y)return z end function d.CSConsoleCreate(w,x,
y)local z=setmetatable({},p)z:
_CreateConsole(x,y)if y.Border then z:
_CreateConsoleBorder()end if y.LineNumbers then z:
_CreateConsoleLines()end return z end function d.
CSSliderFloatCreate(w,x,y)local z=setmetatable({},
q)z:_CreateSliderFloat(x,y)
z:_CreateSliderGrab()return z end function
d.CSCheckboxCreate(w,x,y)local z=
setmetatable({},r)z:_CreateCheckbox(x,y)
z:_CreateTick()if y.Value then z.tick.
BackgroundTransparency=0.3 z.tick.Size=UDim2.new(1,0,1,0)
z.tick.UICorner.CornerRadius=UDim.new(0,2)z.tick.
UIStroke.Transparency=0.8 z.tick.glowtop.ImageTransparency=0
z.tick.glowtop_2.ImageTransparency=0 else z.tick.
BackgroundTransparency=1 z.tick.Size=UDim2.new(0,0,0,0)
z.tick.UICorner.CornerRadius=UDim.new(1,0)z.tick.
UIStroke.Transparency=1 z.tick.glowtop.ImageTransparency=1
z.tick.glowtop_2.ImageTransparency=1 end return z
end function d.CSButtonCreate(w,x,y)local z=
setmetatable({},s)z:_CreateButton(x,y)
z:_SetButtonStyle(y.Style)return z end function
d.CSKeybindCreate(w,x,y)local z=setmetatable(
{},t)z:_CreateKeybind(x,y)return
z end function d.CSComboCreate(w,x,y)local
z=setmetatable({},u)z:_CreateCombo(x,
y)z:_CreateDropdownMenu()return z end function
d.CSSeparatorCreate(w,x)local y=setmetatable({},
v)y:_CreateSeparator(x)return
y end end e={notifs={}}do function
e.NSRepositionNotifs(w)for x,y in ipairs(w.notifs)
do local z=-20-((x-1)*(130))b.TweenService:Create(
y.notif.Parent,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection
.Out),{Position=UDim2.new(1,-20,1,z)}):Play()end end function
e.NSPushNotification(w,x)local y=d:
CSNotifCreate(x)table.insert(w.notifs,1,y)w:NSRepositionNotifs()
y:Push()task.wait(y.duration)y:Pull()end end f={
ini_to_save={'Value'},ini_settings={}}do function f.ISGetIniData(w,x
)local y=w.ini_to_save local z={}for A,B in next,y
do z[B]=x[B]end return z end function f.ISDumpIni(w,
x)local y=w.ini_settings local z={}for A,
B in next,y do z[A]=w:GetIniData(B)end if
x then return b.HttpService:JSONEncode(z)end
return z end function f.ISLoadIniIntoElement(w,x,y)
local z={Value=function(z)x:SetValue(z)end}for A,
B in next,y do local C=z[A]if C then
C(B)continue end x[A]=B end end function f.
ISLoadIni(w,x,y)local z=w.ini_settings assert(
x,'No Ini configuration was passed')if y then x
=b.HttpService:JSONDecode(x)end for A,B in next,
x do local C=z[A]w:LoadIniIntoElement(C,
B)end end function f.ISAddIniFlag(w,x,y)local z=
w.ini_settings z[x]=y end end function g.
RegisterElement(w,x,y)w.elements[x]=y i[
x]=function(z,A)return y(z,A)end end function g.
Window(w,x)x=c:HSMerge({Title='Window',Size=UDim2.
fromOffset(600,400),Position=UDim2.new(0.5,0,0.5,-200),Collapsed=false,
SmoothDrag=false},x)local y=d:CSWindowCreate(x)
y._CreateWindow=nil y._CreateWindowGlow=nil y.
_CreateWindowContent=nil y._CreateTitleBar=nil y._CreateCollapseButton
=nil y._CreateCloseButton=nil table.insert(w.windows,y)return
y end function g.PushNotification(w,x)x=c:HSMerge({
Title='Notification',Body='This is a notification.',Icon=g.icons.Send,Duration
=3},x)e:NSPushNotification(x)end function g.
DumpIni(w,x)return f:ISDumpIni(x)end function g.
LoadIni(w,x,y)return f:ISLoadIni(x,
y)end function g.AddIniFlag(w,x,y)return f:
ISAddIniFlag(x,y)end g:RegisterElement('Sidebar',function(w,
x)local y,z=d:CSSidebarCreate(w:
GetContainer())y._CreateSidebar=nil y._CreateSidebarContent=nil y
._CreateMenuToggle=nil y._CreateSearchBar=nil y._CreateSettingsTab=nil
y._TrackConnection=nil return y,z end)g:RegisterElement(
'Region',function(w,x)x=c:HSMerge({Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y,Border=true,BorderThickness=1,CornerRadius=
UDim.new(0,8)},x)local y=d:CSRegionCreate(w:
GetContainer(),x)y._CreateRegion=nil y._CreateRegionContent=nil
y._TrackConnection=nil return y end)g:RegisterElement('Label',
function(w,x)x=c:HSMerge({Font='Montserrat',Weight=
Enum.FontWeight.Medium,Text='Label',Padding=UDim.new(0,4),TextSize=13,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.
Center},x)local y=d:CSLabelCreate(w:GetContainer(),
x)y._CreateLabel=nil return y end)g:RegisterElement('Console',
function(w,x)x=c:HSMerge({Enabled=true,Value='',
TextWrapped=false,CornerRadius=UDim.new(0,2),Border=true,MaxLines=300,ReadOnly=
true,RichText=true,LineNumbers=false,AutoScroll=true,Callback=nil},x)local
y=d:CSConsoleCreate(w:GetContainer(),x)y.
_CreateConsole=nil y._CreateConsoleBorder=nil y._CreateConsoleLines=
nil return y end)g:RegisterElement('SliderFloat',function(w,x)
x=c:HSMerge({Label='SliderFloat',Minimum=0,Maximum=1,Value=0.5
,Format='%.2f',Callback=nil},x)local y=d:
CSSliderFloatCreate(w:GetContainer(),x)y._CreateSliderFloat=nil
y._CreateSliderGrab=nil y._TrackConnection=nil return y end)g:
RegisterElement('Checkbox',function(w,x)x=c:HSMerge(
{Label='Checkbox',Value=false,Callback=nil},x)local y=d:
CSCheckboxCreate(w:GetContainer(),x)y._CreateCheckbox=nil y.
_CreateTick=nil y._TrackConnection=nil return y end)g:
RegisterElement('Button',function(w,x)x=c:HSMerge({
Text='Button',Style='Primary',Callback=nil},x)local y=d:
CSButtonCreate(w:GetContainer(),x)y._CreateButton=nil y.
_SetButtonStyle=nil y._TrackConnection=nil return y end)g:
RegisterElement('Keybind',function(w,x)x=c:HSMerge({
Label='Keybind',Value=Enum.KeyCode.K,Callback=nil},x)local y=
d:CSKeybindCreate(w:GetContainer(),x)y.
_CreateKeybind=nil y._TrackConnection=nil return y end)g:
RegisterElement('Combo',function(w,x)x=c:HSMerge({
Label='Combo',Placeholder='Select...',Items=nil,Callback=nil},x)local
y=d:CSComboCreate(w:GetContainer(),x)y.
_CreateCombo=nil y._CreateDropdownMenu=nil y._TrackConnection=nil
return y end)g:RegisterElement('Separator',function(w,x)local
y=d:CSSeparatorCreate(w:GetContainer())y.
_CreateSeparator=nil return y end)g:RegisterElement('PopupModal',function
(w,x)end)g:RegisterElement('InputText',function(w,x)end)if
a then a.__FUI_ENV=g end return g
