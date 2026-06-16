--This Code Generate by ldx SetInstanceAsClipboard
--Thanks for using ldx SetInstanceAsClipboard we will improving this feature even more in the furture
--join ldx community at https://discord.gg/WmsssRkgd2
local ldxinstance = {}

LIEXGUI = Instance.new("ScreenGui")
LIEXGUI.Name = [[LIEXGUI]]
LIEXGUI.Parent = gethui()
LIEXGUI.Enabled = true
LIEXGUI.ResetOnSpawn = true
local config = {
    textcolor = Color3.fromRGB(0,0,0),
    tabbackground = Color3.fromRGB(0,0,0),
    tabtransparency = 0.1
}
ldxinstance['varMain1'] = Instance.new("Frame")
ldxinstance['varMain1'].Name = [[Main]]
ldxinstance['varMain1'].Parent = LIEXGUI
ldxinstance['varMain1'].Size = UDim2.new(0.6000000238418579,150,0.800000011920929,0)
ldxinstance['varMain1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varMain1'].Position = UDim2.new(0.19986312091350555,0,0.0997067466378212,0)
ldxinstance['varMain1'].Visible = true
ldxinstance['varMain1'].ZIndex = 1
ldxinstance['varMain1'].ClipsDescendants = false
ldxinstance['varMain1'].Draggable = true
ldxinstance['varMain1'].Active = true
ldxinstance['varMain1'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varMain1'].Interactable = true

ldxinstance['varIcon2'] = Instance.new("ImageButton")
ldxinstance['varIcon2'].Parent = LIEXGUI
ldxinstance['varIcon2'].Image = config.logo or "rbxassetid://0"
ldxinstance['varIcon2'].Draggable = true
ldxinstance['varIcon2'].Active = false
ldxinstance['varIcon2'].Visible = false
ldxinstance['varIcon2'].Size = UDim2.new(0,48,0,48)
ldxinstance['varIcon2'].Position = UDim2.new(0.5,-20,0.14,0)
ldxinstance['varCorner1'] = Instance.new("UICorner")
ldxinstance['varCorner1'].Parent = ldxinstance['varIcon2']
ldxinstance['varCorner1'].CornerRadius = UDim.new(0,8)
ldxinstance['varUIStroke2'] = Instance.new("UIStroke")
ldxinstance['varUIStroke2'].Parent = ldxinstance['varIcon2']
ldxinstance['varUIStroke2'].Thickness = config.borderthickness or 1
ldxinstance['varUIStroke2'].Color = border or Color3.new(0,0,0)

ldxinstance['varLeft Side1'] = Instance.new("ScrollingFrame")
ldxinstance['varLeft Side1'].Name = [[Left Side]]
ldxinstance['varLeft Side1'].Parent = ldxinstance['varMain1']
ldxinstance['varLeft Side1'].Size = UDim2.new(0,195,1,-90)
ldxinstance['varLeft Side1'].Transparency = 1
ldxinstance['varLeft Side1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varLeft Side1'].BackgroundTransparency = 1
ldxinstance['varLeft Side1'].Position = UDim2.new(0.004563084337860346,0,0.08064515888690948,10)
ldxinstance['varLeft Side1'].Visible = true
ldxinstance['varLeft Side1'].ZIndex = 1
ldxinstance['varLeft Side1'].ClipsDescendants = true
ldxinstance['varLeft Side1'].CanvasSize = UDim2.new(0,0,2,0)
ldxinstance['varLeft Side1'].CanvasPosition = Vector2.new(0,0)
ldxinstance['varLeft Side1'].ScrollBarThickness = 7
ldxinstance['varLeft Side1'].Draggable = false
ldxinstance['varLeft Side1'].ScrollingEnabled = true
ldxinstance['varLeft Side1'].ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ldxinstance['varLeft Side1'].AutomaticCanvasSize = Enum.AutomaticSize.None
ldxinstance['varLeft Side1'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varLeft Side1'].Interactable = true
ldxinstance['varLeft Side1'].VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
ldxinstance['varLeft Side1'].VerticalScrollBarInset = Enum.ScrollBarInset.None
ldxinstance['varLeft Side1'].ScrollingDirection = Enum.ScrollingDirection.Y
ldxinstance['varLeft Side1'].TopImage = [[rbxasset://textures/ui/Scroll/scroll-top.png]]
ldxinstance['varLeft Side1'].ScrollBarImageColor3 = Color3.fromRGB(23, 23, 23)
ldxinstance['varLeft Side1'].ScrollBarImageTransparency = 0
ldxinstance['varLeft Side1'].MidImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]]
ldxinstance['varLeft Side1'].HorizontalScrollBarInset = Enum.ScrollBarInset.None
ldxinstance['varLeft Side1'].ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ldxinstance['varLeft Side1'].BottomImage = [[rbxasset://textures/ui/Scroll/scroll-bottom.png]]
ldxinstance['varLeft Side1'].AutomaticCanvasSize = Enum.AutomaticSize.Y

ldxinstance['varUICorner2'] = Instance.new("UICorner")
ldxinstance['varUICorner2'].Name = [[UICorner]]
ldxinstance['varUICorner2'].Parent = ldxinstance['varMain1']
ldxinstance['varUICorner2'].CornerRadius = UDim.new(0,8)

ldxinstance['varRight Side3'] = Instance.new("Frame")
ldxinstance['varRight Side3'].Name = [[Right Side]]
ldxinstance['varRight Side3'].Parent = ldxinstance['varMain1']
ldxinstance['varRight Side3'].Size = UDim2.new(1,-210,1,-90)
ldxinstance['varRight Side3'].Transparency = 1
ldxinstance['varRight Side3'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varRight Side3'].BackgroundTransparency = 1
ldxinstance['varRight Side3'].Position = UDim2.new(0.004999999888241291,198,0.08100000023841858,10)
ldxinstance['varRight Side3'].Visible = true
ldxinstance['varRight Side3'].ZIndex = 1
ldxinstance['varRight Side3'].ClipsDescendants = false
ldxinstance['varRight Side3'].Draggable = false
ldxinstance['varRight Side3'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varRight Side3'].Interactable = true

ldxinstance['varreserved4'] = Instance.new("Folder")
ldxinstance['varreserved4'].Name = [[reserved]]
ldxinstance['varreserved4'].Parent = ldxinstance['varMain1']

ldxinstance['varPannel1'] = Instance.new("ScrollingFrame")
ldxinstance['varPannel1'].Name = [[Pannel]]
ldxinstance['varPannel1'].Parent = getldxstorage()
ldxinstance['varPannel1'].Size = UDim2.new(1,0,1,-10)
ldxinstance['varPannel1'].Transparency = 1
ldxinstance['varPannel1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varPannel1'].BackgroundTransparency = 1
ldxinstance['varPannel1'].Position = UDim2.new(-0.001368667115457356,0,0.009164196439087391,0)
ldxinstance['varPannel1'].Visible = true
ldxinstance['varPannel1'].ZIndex = 1
ldxinstance['varPannel1'].ClipsDescendants = true
ldxinstance['varPannel1'].CanvasSize = UDim2.new(0,0,0,0)
ldxinstance['varPannel1'].CanvasPosition = Vector2.new(0,0)
ldxinstance['varPannel1'].ScrollBarThickness = 7
ldxinstance['varPannel1'].Draggable = false
ldxinstance['varPannel1'].ScrollingEnabled = true 
ldxinstance['varPannel1'].ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ldxinstance['varPannel1'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varPannel1'].Interactable = true
ldxinstance['varPannel1'].VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
ldxinstance['varPannel1'].VerticalScrollBarInset = Enum.ScrollBarInset.None
ldxinstance['varPannel1'].ScrollingDirection = Enum.ScrollingDirection.Y
ldxinstance['varPannel1'].TopImage = [[rbxasset://textures/ui/Scroll/scroll-top.png]]
ldxinstance['varPannel1'].ScrollBarImageColor3 = Color3.fromRGB(23, 23, 23)
ldxinstance['varPannel1'].ScrollBarImageTransparency = 0
ldxinstance['varPannel1'].MidImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]]
ldxinstance['varPannel1'].HorizontalScrollBarInset = Enum.ScrollBarInset.None
ldxinstance['varPannel1'].ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ldxinstance['varPannel1'].BottomImage = [[rbxasset://textures/ui/Scroll/scroll-bottom.png]]
ldxinstance['varPannel1'].AutomaticCanvasSize = Enum.AutomaticSize.Y

ldxinstance['varUIListLayout1'] = Instance.new("UIListLayout")
ldxinstance['varUIListLayout1'].Name = [[UIListLayout]]
ldxinstance['varUIListLayout1'].Parent = ldxinstance['varPannel1']
ldxinstance['varUIListLayout1'].Padding = UDim.new(0,10)
ldxinstance['varUIListLayout1'].SortOrder = Enum.SortOrder.LayoutOrder
ldxinstance['varUIListLayout1'].VerticalFlex = Enum.UIFlexAlignment.None
ldxinstance['varUIListLayout1'].HorizontalFlex = Enum.UIFlexAlignment.None
ldxinstance['varUIListLayout1'].HorizontalAlignment = Enum.HorizontalAlignment.Left
ldxinstance['varUIListLayout1'].VerticalAlignment = Enum.VerticalAlignment.Top
ldxinstance['varUIListLayout1'].ItemLineAlignment = Enum.ItemLineAlignment.Automatic
ldxinstance['varUIListLayout1'].Wraps = false

ldxinstance['varGroup2'] = Instance.new("Frame")
ldxinstance['varGroup2'].Name = [[Group]]
ldxinstance['varGroup2'].Parent = getldxstorage()
ldxinstance['varGroup2'].Size = UDim2.new(1,0,-0.02800000086426735,10)
ldxinstance['varGroup2'].BackgroundColor3 = Color3.fromRGB(0,255,60)
ldxinstance['varGroup2'].Position = UDim2.new(-4.719699120414589e-08,0,0,0)
ldxinstance['varGroup2'].Visible = true
ldxinstance['varGroup2'].ZIndex = 1
ldxinstance['varGroup2'].ClipsDescendants = false
ldxinstance['varGroup2'].Draggable = false
ldxinstance['varGroup2'].AutomaticSize = Enum.AutomaticSize.Y
ldxinstance['varGroup2'].Interactable = true

ldxinstance['varUIListLayout1'] = Instance.new("UIListLayout")
ldxinstance['varUIListLayout1'].Name = [[UIListLayout]]
ldxinstance['varUIListLayout1'].Parent = ldxinstance['varGroup2']
ldxinstance['varUIListLayout1'].Padding = UDim.new(0,6)
ldxinstance['varUIListLayout1'].VerticalFlex = Enum.UIFlexAlignment.None
ldxinstance['varUIListLayout1'].HorizontalFlex = Enum.UIFlexAlignment.None
ldxinstance['varUIListLayout1'].SortOrder = Enum.SortOrder.LayoutOrder
ldxinstance['varUIListLayout1'].HorizontalAlignment = Enum.HorizontalAlignment.Left
ldxinstance['varUIListLayout1'].VerticalAlignment = Enum.VerticalAlignment.Top
ldxinstance['varUIListLayout1'].ItemLineAlignment = Enum.ItemLineAlignment.Automatic
ldxinstance['varUIListLayout1'].Wraps = false

ldxinstance['varUIPadding2'] = Instance.new("UIPadding")
ldxinstance['varUIPadding2'].Name = [[UIPadding]]
ldxinstance['varUIPadding2'].Parent = ldxinstance['varGroup2']
ldxinstance['varUIPadding2'].PaddingBottom = UDim.new(0,5)
ldxinstance['varUIPadding2'].PaddingLeft = UDim.new(0,5)
ldxinstance['varUIPadding2'].PaddingRight = UDim.new(0,5)
ldxinstance['varUIPadding2'].PaddingTop = UDim.new(0,5)

ldxinstance['varUICorner3'] = Instance.new("UICorner")
ldxinstance['varUICorner3'].Name = [[UICorner]]
ldxinstance['varUICorner3'].Parent = ldxinstance['varGroup2']
ldxinstance['varUICorner3'].CornerRadius = UDim.new(0,8)

ldxinstance['varTitle4'] = Instance.new("TextLabel")
ldxinstance['varTitle4'].Name = [[Title]]
ldxinstance['varTitle4'].Parent = ldxinstance['varGroup2']
ldxinstance['varTitle4'].Size = UDim2.new(1,0,0,30)
ldxinstance['varTitle4'].Transparency = 1
ldxinstance['varTitle4'].Text = [[Label]]
ldxinstance['varTitle4'].TextColor3 = config.textcolor
ldxinstance['varTitle4'].TextTransparency = 0
ldxinstance['varTitle4'].TextSize = 20
ldxinstance['varTitle4'].TextScaled = false
ldxinstance['varTitle4'].TextWrapped = true
ldxinstance['varTitle4'].Font = Enum.Font.SourceSansBold
ldxinstance['varTitle4'].RichText = true
ldxinstance['varTitle4'].LineHeight = 1
ldxinstance['varTitle4'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varTitle4'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varTitle4'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle4'].BackgroundTransparency = 1
ldxinstance['varTitle4'].Position = UDim2.new(0,0,0.06299212574958801,0)
ldxinstance['varTitle4'].Visible = true
ldxinstance['varTitle4'].ZIndex = 1
ldxinstance['varTitle4'].ClipsDescendants = false
ldxinstance['varTitle4'].Draggable = false
ldxinstance['varTitle4'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varTitle4'].Interactable = true

ldxinstance['varButton5'] = Instance.new("TextButton")
ldxinstance['varButton5'].Name = [[Button]]
ldxinstance['varButton5'].Parent = getldxstorage()
ldxinstance['varButton5'].Size = UDim2.new(1,0,0,40)
ldxinstance['varButton5'].Text = [[Button]]
ldxinstance['varButton5'].TextColor3 = config.textcolor
ldxinstance['varButton5'].TextTransparency = 0
ldxinstance['varButton5'].TextSize = 14
ldxinstance['varButton5'].TextScaled = false
ldxinstance['varButton5'].TextWrapped = false
ldxinstance['varButton5'].Font = Enum.Font.SourceSans
ldxinstance['varButton5'].RichText = false
ldxinstance['varButton5'].LineHeight = 1
ldxinstance['varButton5'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varButton5'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varButton5'].BackgroundColor3 = Color3.fromRGB(255,0,4)
ldxinstance['varButton5'].Position = UDim2.new(0,0,0.017737116664648056,0)
ldxinstance['varButton5'].Visible = true
ldxinstance['varButton5'].ZIndex = 1
ldxinstance['varButton5'].ClipsDescendants = false
ldxinstance['varButton5'].LayoutOrder = 1
ldxinstance['varButton5'].Draggable = false
ldxinstance['varButton5'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varButton5'].Interactable = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varButton5']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varInput6'] = Instance.new("Frame")
ldxinstance['varInput6'].Name = [[Input]]
ldxinstance['varInput6'].Parent = getldxstorage()
ldxinstance['varInput6'].Size = UDim2.new(1,0,0,40)
ldxinstance['varInput6'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varInput6'].Position = UDim2.new(-4.793838570549269e-08,0,0.8617886304855347,0)
ldxinstance['varInput6'].Visible = true
ldxinstance['varInput6'].ZIndex = 1
ldxinstance['varInput6'].ClipsDescendants = false
ldxinstance['varInput6'].Draggable = false
ldxinstance['varInput6'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varInput6'].Interactable = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varInput6']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varName2'] = Instance.new("TextLabel")
ldxinstance['varName2'].Name = [[Name]]
ldxinstance['varName2'].Parent = ldxinstance['varInput6']
ldxinstance['varName2'].Size = UDim2.new(1,-170,1,0)
ldxinstance['varName2'].Transparency = 1
ldxinstance['varName2'].Text = [[Label]]
ldxinstance['varName2'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varName2'].TextTransparency = 0
ldxinstance['varName2'].TextSize = 14
ldxinstance['varName2'].TextScaled = false
ldxinstance['varName2'].TextWrapped = true
ldxinstance['varName2'].Font = Enum.Font.SourceSans
ldxinstance['varName2'].RichText = false
ldxinstance['varName2'].LineHeight = 1
ldxinstance['varName2'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varName2'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varName2'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varName2'].BackgroundTransparency = 1
ldxinstance['varName2'].Position = UDim2.new(-0,10,0,0)
ldxinstance['varName2'].Visible = true
ldxinstance['varName2'].ZIndex = 1
ldxinstance['varName2'].ClipsDescendants = false
ldxinstance['varName2'].Draggable = false
ldxinstance['varName2'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varName2'].Interactable = true

ldxinstance['varColumn3'] = Instance.new("TextBox")
ldxinstance['varColumn3'].Name = [[Column]]
ldxinstance['varColumn3'].Parent = ldxinstance['varInput6']
ldxinstance['varColumn3'].Size = UDim2.new(0,145,1,-5)
ldxinstance['varColumn3'].Text = [[]]
ldxinstance['varColumn3'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varColumn3'].TextTransparency = 0
ldxinstance['varColumn3'].TextSize = 14
ldxinstance['varColumn3'].TextScaled = false
ldxinstance['varColumn3'].TextWrapped = false
ldxinstance['varColumn3'].Font = Enum.Font.SourceSans
ldxinstance['varColumn3'].RichText = false
ldxinstance['varColumn3'].LineHeight = 1
ldxinstance['varColumn3'].PlaceholderText = [[Input]]
ldxinstance['varColumn3'].PlaceholderColor3 = Color3.fromRGB(127,127,127)
ldxinstance['varColumn3'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varColumn3'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varColumn3'].BackgroundColor3 = Color3.fromRGB(255,0,4)
ldxinstance['varColumn3'].Position = UDim2.new(1,-149,0,2)
ldxinstance['varColumn3'].Visible = true
ldxinstance['varColumn3'].ZIndex = 1
ldxinstance['varColumn3'].ClipsDescendants = false
ldxinstance['varColumn3'].Draggable = false
ldxinstance['varColumn3'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varColumn3'].Interactable = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varColumn3']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varToggle7'] = Instance.new("Frame")
ldxinstance['varToggle7'].Name = [[Toggle]]
ldxinstance['varToggle7'].Parent = getldxstorage()
ldxinstance['varToggle7'].Size = UDim2.new(1,0,0,40)
ldxinstance['varToggle7'].BackgroundColor3 = Color3.fromRGB(251,255,0)
ldxinstance['varToggle7'].Position = UDim2.new(-4.793838570549269e-08,0,0.8617886304855347,0)
ldxinstance['varToggle7'].Visible = true
ldxinstance['varToggle7'].ZIndex = 1
ldxinstance['varToggle7'].ClipsDescendants = false
ldxinstance['varToggle7'].Draggable = false
ldxinstance['varToggle7'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varToggle7'].Interactable = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varToggle7']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varName2'] = Instance.new("TextLabel")
ldxinstance['varName2'].Name = [[Text]]
ldxinstance['varName2'].Parent = ldxinstance['varToggle7']
ldxinstance['varName2'].Size = UDim2.new(1,-170,1,0)
ldxinstance['varName2'].Transparency = 1
ldxinstance['varName2'].Text = [[Label]]
ldxinstance['varName2'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varName2'].TextTransparency = 0
ldxinstance['varName2'].TextSize = 14
ldxinstance['varName2'].TextScaled = false
ldxinstance['varName2'].TextWrapped = true
ldxinstance['varName2'].Font = Enum.Font.SourceSans
ldxinstance['varName2'].RichText = false
ldxinstance['varName2'].LineHeight = 1
ldxinstance['varName2'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varName2'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varName2'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varName2'].BackgroundTransparency = 1
ldxinstance['varName2'].Position = UDim2.new(-0,10,0,0)
ldxinstance['varName2'].Visible = true
ldxinstance['varName2'].ZIndex = 1
ldxinstance['varName2'].ClipsDescendants = false
ldxinstance['varName2'].Draggable = false
ldxinstance['varName2'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varName2'].Interactable = true

ldxinstance['varToggle3'] = Instance.new("TextButton")
ldxinstance['varToggle3'].Name = [[Toggle]]
ldxinstance['varToggle3'].Parent = ldxinstance['varToggle7']
ldxinstance['varToggle3'].Size = UDim2.new(0,55,1,-15)
ldxinstance['varToggle3'].Text = [[]]
ldxinstance['varToggle3'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varToggle3'].TextTransparency = 0
ldxinstance['varToggle3'].TextSize = 14
ldxinstance['varToggle3'].TextScaled = false
ldxinstance['varToggle3'].TextWrapped = false
ldxinstance['varToggle3'].Font = Enum.Font.SourceSans
ldxinstance['varToggle3'].RichText = false
ldxinstance['varToggle3'].LineHeight = 1
ldxinstance['varToggle3'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varToggle3'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varToggle3'].BackgroundColor3 = Color3.fromRGB(0,255,0)
ldxinstance['varToggle3'].Position = UDim2.new(1,-60,0,7)
ldxinstance['varToggle3'].Visible = true
ldxinstance['varToggle3'].ZIndex = 1
ldxinstance['varToggle3'].ClipsDescendants = false
ldxinstance['varToggle3'].Draggable = false
ldxinstance['varToggle3'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varToggle3'].Interactable = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varToggle3']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(1,0)

ldxinstance['varFrame2'] = Instance.new("Frame")
ldxinstance['varFrame2'].Name = [[Frame]]
ldxinstance['varFrame2'].Parent = ldxinstance['varToggle3']
ldxinstance['varFrame2'].Size = UDim2.new(0,30,0,30)
ldxinstance['varFrame2'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varFrame2'].Position = UDim2.new(0,25,0,-2)
ldxinstance['varFrame2'].Visible = true
ldxinstance['varFrame2'].ZIndex = 1
ldxinstance['varFrame2'].ClipsDescendants = false
ldxinstance['varFrame2'].Draggable = false
ldxinstance['varFrame2'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varFrame2'].Interactable = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varFrame2']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(1,0)

ldxinstance['varOption8'] = Instance.new("TextButton")
ldxinstance['varOption8'].Name = [[Option]]
ldxinstance['varOption8'].Parent = getldxstorage()
ldxinstance['varOption8'].Size = UDim2.new(1,0,0,40)
ldxinstance['varOption8'].Text = [[Option]]
ldxinstance['varOption8'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varOption8'].TextTransparency = 0
ldxinstance['varOption8'].TextSize = 14
ldxinstance['varOption8'].TextScaled = false
ldxinstance['varOption8'].TextWrapped = false
ldxinstance['varOption8'].Font = Enum.Font.SourceSans
ldxinstance['varOption8'].RichText = false
ldxinstance['varOption8'].LineHeight = 1
ldxinstance['varOption8'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varOption8'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varOption8'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varOption8'].Visible = true
ldxinstance['varOption8'].ZIndex = 1
ldxinstance['varOption8'].ClipsDescendants = false
ldxinstance['varOption8'].Draggable = false
ldxinstance['varOption8'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varOption8'].Interactable = true

ldxinstance['varScrollingFrame1'] = Instance.new("ScrollingFrame")
ldxinstance['varScrollingFrame1'].Name = [[ScrollingFrame]]
ldxinstance['varScrollingFrame1'].Parent = ldxinstance['varOption8']
ldxinstance['varScrollingFrame1'].Size = UDim2.new(1,0,1,0)
ldxinstance['varScrollingFrame1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varScrollingFrame1'].Visible = false
ldxinstance['varScrollingFrame1'].ZIndex = 1
ldxinstance['varScrollingFrame1'].ClipsDescendants = true
ldxinstance['varScrollingFrame1'].CanvasSize = UDim2.new(0,0,2,0)
ldxinstance['varScrollingFrame1'].CanvasPosition = Vector2.new(0,0)
ldxinstance['varScrollingFrame1'].ScrollBarThickness = 7
ldxinstance['varScrollingFrame1'].Draggable = false
ldxinstance['varScrollingFrame1'].ScrollingEnabled = true
ldxinstance['varScrollingFrame1'].ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ldxinstance['varScrollingFrame1'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varScrollingFrame1'].Interactable = true
ldxinstance['varScrollingFrame1'].VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
ldxinstance['varScrollingFrame1'].VerticalScrollBarInset = Enum.ScrollBarInset.None
ldxinstance['varScrollingFrame1'].ScrollingDirection = Enum.ScrollingDirection.XY
ldxinstance['varScrollingFrame1'].TopImage = [[rbxasset://textures/ui/Scroll/scroll-top.png]]
ldxinstance['varScrollingFrame1'].ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varScrollingFrame1'].ScrollBarImageTransparency = 0
ldxinstance['varScrollingFrame1'].MidImage = [[rbxasset://textures/ui/Scroll/scroll-middle.png]]
ldxinstance['varScrollingFrame1'].HorizontalScrollBarInset = Enum.ScrollBarInset.None
ldxinstance['varScrollingFrame1'].ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ldxinstance['varScrollingFrame1'].BottomImage = [[rbxasset://textures/ui/Scroll/scroll-bottom.png]]
ldxinstance['varScrollingFrame1'].AutomaticCanvasSize = Enum.AutomaticSize.Y

ldxinstance['varUICorner2'] = Instance.new("UICorner")
ldxinstance['varUICorner2'].Name = [[UICorner]]
ldxinstance['varUICorner2'].Parent = ldxinstance['varOption8']
ldxinstance['varUICorner2'].CornerRadius = UDim.new(0,8)

ldxinstance['varUIPadding3'] = Instance.new("UIPadding")
ldxinstance['varUIPadding3'].Name = [[UIPadding]]
ldxinstance['varUIPadding3'].Parent = ldxinstance['varPannel1']
ldxinstance['varUIPadding3'].PaddingBottom = UDim.new(0,10)
ldxinstance['varUIPadding3'].PaddingLeft = UDim.new(0,5)
ldxinstance['varUIPadding3'].PaddingRight = UDim.new(0,12)
ldxinstance['varUIPadding3'].PaddingTop = UDim.new(0,0)

ldxinstance['varTop Bar5'] = Instance.new("Frame")
ldxinstance['varTop Bar5'].Name = [[Top Bar]]
ldxinstance['varTop Bar5'].Parent = ldxinstance['varMain1']
ldxinstance['varTop Bar5'].Size = UDim2.new(1,0,0,50)
ldxinstance['varTop Bar5'].Transparency = 1
ldxinstance['varTop Bar5'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTop Bar5'].BackgroundTransparency = 1
ldxinstance['varTop Bar5'].Visible = true
ldxinstance['varTop Bar5'].ZIndex = 1
ldxinstance['varTop Bar5'].ClipsDescendants = false
ldxinstance['varTop Bar5'].Draggable = false
ldxinstance['varTop Bar5'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varTop Bar5'].Interactable = true
local exit = Instance.new("TextButton")
exit.Text = "<b>X</b>"
exit.TextColor3 = Color3.fromRGB(217,36,5)
exit.Parent = ldxinstance['varTop Bar5']
exit.Size = UDim2.new(0,30,0,30)
exit.BackgroundTransparency = 1
exit.Position = UDim2.new(1,-35,0,5)
exit.TextScaled = true
exit.RichText = true
exit.MouseButton1Click:Connect(function()
    LIEXGUI:Destroy()
end)
local minimize = Instance.new("TextButton")
minimize.Text = "<b>-</b>"
minimize.TextColor3 = Color3.fromRGB(217,36,5)
minimize.Parent = ldxinstance['varTop Bar5']
minimize.Size = UDim2.new(0,30,0,30)
minimize.BackgroundTransparency = 1
minimize.Position = UDim2.new(1,-60,0,5)
minimize.TextScaled = true
minimize.RichText = true
local showgui = true
minimize.MouseButton1Click:Connect(function()
    showgui = not showgui
    ldxinstance['varIcon2'].Visible = not showgui
    ldxinstance['varIcon2'].Active = not showgui
    ldxinstance['varMain1'].Visible = showgui
    ldxinstance['varMain1'].Active = showgui
end)
ldxinstance['varIcon2'].MouseButton1Click:Connect(function()
    showgui = not showgui
    ldxinstance['varIcon2'].Visible = not showgui
    ldxinstance['varIcon2'].Active = not showgui
    ldxinstance['varMain1'].Visible = showgui
    ldxinstance['varMain1'].Active = showgui
end)

ldxinstance['varTitle1'] = Instance.new("TextLabel")
ldxinstance['varTitle1'].Name = [[Title]]
ldxinstance['varTitle1'].Parent = ldxinstance['varTop Bar5']
ldxinstance['varTitle1'].Size = UDim2.new(1,-10,0,30)
ldxinstance['varTitle1'].Transparency = 1
ldxinstance['varTitle1'].Text = [[Label]]
ldxinstance['varTitle1'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varTitle1'].TextTransparency = 0
ldxinstance['varTitle1'].TextSize = 20
ldxinstance['varTitle1'].TextScaled = false
ldxinstance['varTitle1'].TextWrapped = false
ldxinstance['varTitle1'].Font = Enum.Font.SourceSansBold
ldxinstance['varTitle1'].RichText = true
ldxinstance['varTitle1'].LineHeight = 1
ldxinstance['varTitle1'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varTitle1'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varTitle1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle1'].BackgroundTransparency = 1
ldxinstance['varTitle1'].Position = UDim2.new(0,10,0,0)
ldxinstance['varTitle1'].Visible = true
ldxinstance['varTitle1'].ZIndex = 1
ldxinstance['varTitle1'].ClipsDescendants = false
ldxinstance['varTitle1'].Draggable = false
ldxinstance['varTitle1'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varTitle1'].Interactable = true
local guititle = ldxinstance['varTitle1']

ldxinstance['vardesc2'] = Instance.new("TextLabel")
ldxinstance['vardesc2'].Name = [[desc]]
ldxinstance['vardesc2'].Parent = ldxinstance['varTop Bar5']
ldxinstance['vardesc2'].Size = UDim2.new(0.10000000149011612,195,0,18)
ldxinstance['vardesc2'].Transparency = 1
ldxinstance['vardesc2'].Text = [[Label]]
ldxinstance['vardesc2'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['vardesc2'].TextTransparency = 0
ldxinstance['vardesc2'].TextSize = 14
ldxinstance['vardesc2'].TextScaled = false
ldxinstance['vardesc2'].TextWrapped = true
ldxinstance['vardesc2'].Font = Enum.Font.SourceSans
ldxinstance['vardesc2'].RichText = true
ldxinstance['vardesc2'].LineHeight = 1
ldxinstance['vardesc2'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['vardesc2'].TextYAlignment = Enum.TextYAlignment.Top
ldxinstance['vardesc2'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['vardesc2'].BackgroundTransparency = 1
ldxinstance['vardesc2'].Position = UDim2.new(0,10,0,24)
ldxinstance['vardesc2'].Visible = true
ldxinstance['vardesc2'].ZIndex = 1
ldxinstance['vardesc2'].ClipsDescendants = false
ldxinstance['vardesc2'].Draggable = false
ldxinstance['vardesc2'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['vardesc2'].Interactable = true
local desc = ldxinstance['vardesc2']
ldxinstance['varBottom6'] = Instance.new("Frame")
ldxinstance['varBottom6'].Name = [[Bottom]]
ldxinstance['varBottom6'].Parent = ldxinstance['varMain1']
ldxinstance['varBottom6'].Size = UDim2.new(1,0,0,50)
ldxinstance['varBottom6'].Transparency = 1
ldxinstance['varBottom6'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varBottom6'].BackgroundTransparency = 1
ldxinstance['varBottom6'].Position = UDim2.new(0,0,1,-60)
ldxinstance['varBottom6'].Visible = true
ldxinstance['varBottom6'].ZIndex = 1
ldxinstance['varBottom6'].ClipsDescendants = false
ldxinstance['varBottom6'].Draggable = false
ldxinstance['varBottom6'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varBottom6'].Interactable = true

ldxinstance['varTitle1'] = Instance.new("TextLabel")
ldxinstance['varTitle1'].Name = [[Title]]
ldxinstance['varTitle1'].Parent = ldxinstance['varBottom6']
ldxinstance['varTitle1'].Size = UDim2.new(0.10000000149011612,195,0,30)
ldxinstance['varTitle1'].Transparency = 1
ldxinstance['varTitle1'].Text = [[Label]]
ldxinstance['varTitle1'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['varTitle1'].TextTransparency = 0
ldxinstance['varTitle1'].TextSize = 20
ldxinstance['varTitle1'].TextScaled = false
ldxinstance['varTitle1'].TextWrapped = false
ldxinstance['varTitle1'].Font = Enum.Font.SourceSansBold
ldxinstance['varTitle1'].RichText = true
ldxinstance['varTitle1'].LineHeight = 1
ldxinstance['varTitle1'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varTitle1'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varTitle1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle1'].BackgroundTransparency = 1
ldxinstance['varTitle1'].Position = UDim2.new(0,70,0,0)
ldxinstance['varTitle1'].Visible = true
ldxinstance['varTitle1'].ZIndex = 1
ldxinstance['varTitle1'].ClipsDescendants = false
ldxinstance['varTitle1'].Draggable = false
ldxinstance['varTitle1'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varTitle1'].Interactable = true

ldxinstance['vardesc2'] = Instance.new("TextLabel")
ldxinstance['vardesc2'].Name = [[desc]]
ldxinstance['vardesc2'].Parent = ldxinstance['varBottom6']
ldxinstance['vardesc2'].Size = UDim2.new(0.10000000149011612,195,0,18)
ldxinstance['vardesc2'].Transparency = 1
ldxinstance['vardesc2'].Text = [[Label]]
ldxinstance['vardesc2'].TextColor3 = Color3.fromRGB(0,0,0)
ldxinstance['vardesc2'].TextTransparency = 0
ldxinstance['vardesc2'].TextSize = 14
ldxinstance['vardesc2'].TextScaled = false
ldxinstance['vardesc2'].TextWrapped = true
ldxinstance['vardesc2'].Font = Enum.Font.SourceSans
ldxinstance['vardesc2'].RichText = true
ldxinstance['vardesc2'].LineHeight = 1
ldxinstance['vardesc2'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['vardesc2'].TextYAlignment = Enum.TextYAlignment.Top
ldxinstance['vardesc2'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['vardesc2'].BackgroundTransparency = 1
ldxinstance['vardesc2'].Position = UDim2.new(0,70,0,24)
ldxinstance['vardesc2'].Visible = true
ldxinstance['vardesc2'].ZIndex = 1
ldxinstance['vardesc2'].ClipsDescendants = false
ldxinstance['vardesc2'].Draggable = false
ldxinstance['vardesc2'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['vardesc2'].Interactable = true
local btmtitle,btmdesc = ldxinstance['varTitle1'],ldxinstance['vardesc2']

ldxinstance['varInfo3'] = Instance.new("ImageButton")
ldxinstance['varInfo3'].Name = [[Info]]
ldxinstance['varInfo3'].Parent = ldxinstance['varBottom6']
ldxinstance['varInfo3'].Size = UDim2.new(0,50,0,50)
ldxinstance['varInfo3'].Image = [[rbxasset://textures/ui/GuiImagePlaceholder.png]]
ldxinstance['varInfo3'].ImageColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varInfo3'].ScaleType = Enum.ScaleType.Stretch
ldxinstance['varInfo3'].SliceCenter = Rect.new(0,0,0,0)
ldxinstance['varInfo3'].SliceScale = 1
ldxinstance['varInfo3'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varInfo3'].Position = UDim2.new(0,10,0,0)
ldxinstance['varInfo3'].Visible = true
ldxinstance['varInfo3'].ZIndex = 1
ldxinstance['varInfo3'].ClipsDescendants = false
ldxinstance['varInfo3'].Draggable = false
ldxinstance['varInfo3'].AutomaticSize = Enum.AutomaticSize.None
ldxinstance['varInfo3'].Interactable = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varInfo3']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)
--additional because i used depercated version of ldx sitc
local linetop,border,middle
linetop = Instance.new("Frame")
linetop.Parent = ldxinstance['varTop Bar5']
linetop.Size = UDim2.new(1,-10,0,1)
linetop.Position =  UDim2.new(0,5,1,-10)
linetop.BackgroundColor3 = Color3.fromRGB(0,0,0)

task.wait()
local gui = {}
gui.Main = {}
gui.__index = gui

function gui.new(name)
    local self = setmetatable({}, gui)
    table.insert(gui.Main,self)
    self.Type = "Window"
    self.Instance = ldxinstance.varPannel1:Clone()
    self.Instance.Name = name
    self.Instance.Parent = ldxinstance['varRight Side3']
    print(self.Instance, "Window")
    return self
end

function gui.Set(tbl)
    guititle.Text = tbl.title or guititle.Text
    desc.Text = tbl.desc or desc.Text 
    btmtitle.Text = tbl.title or btmtitle.Text 
    btmdesc.Text = tbl.desc or btmdesc.Text 
    ldxinstance['varMain1'].BackgroundColor3 = tbl.background or ldxinstance['varMain1'].BackgroundColor3
    ldxinstance['varMain1'].Transparency = tbl.transparency or ldxinstance['varMain1'].Transparency
    config.textcolor = tbl.textcolor
    config.tabbackground = tbl.tabbackground
    config.tabtransparency = tbl.tabtransparency
    ldxinstance['varIcon2'].Image = tbl.logo
    for i,v in ipairs(LIEXGUI:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
            v.TextColor3 = tbl.textcolor or v.TextColor3
        end
    end
end
function gui:AddTab(name)
    local selftab = setmetatable({}, gui)
    selftab.Instance = ldxinstance.varGroup2:Clone()
    selftab.Instance.Name = name
    print(selftab.Instance, "tabAdded")
    selftab.Instance.Title.Text = name
    selftab.Instance.Title.TextColor3 = config.textcolor or Color3.new(0,0,0)
    selftab.Instance.Parent = self.Instance

    function selftab:Button(data)
        local button = ldxinstance['varButton5']:Clone()
        button.Text = data.Text
        print(button, "button added")
        button.Parent = selftab.Instance
        button.TextColor3 = config.textcolor or Color3.new(0,0,0) 
        button.MouseButton1Click:Connect(function()
            if data.OnClick then
                data.OnClick()
            end
        end)
        return button
    end

    function selftab:Text(text,name)
        local txt = Instance.new(text)
        txt.Parent = selftab.Instance
        txt.Name = name or "Label"
        txt.Text = text
        return txt
    end
    function selftab:Toggle(data)
        local toggle = ldxinstance['varToggle7']:Clone()
        toggle.Parent = selftab.Instance
        toggle.Text.Text = data.Text or "Toggle"
        toggle.Text.TextColor3 = config.textcolor or Color3.new(0,0,0)
        local on = false
        print("toggle Added",toggle)
        toggle.Toggle.MouseButton1Click:Connect(function()
            on = not on
            if data.Callback then
                data.Callback(on)
            end
        end)
        return toggle
    end

    function selftab:Input(name,placeholder,Callback)
        local input = ldxinstance['varInput6']:Clone()
        input.Parent = selftab.Instance
        input.Column.PlaceholderText = name
        input.Column.FocusLost:Connect(function(ep)
            Callback.value = input.Column.Text
            Callback.enterPress = ep
            if Callback.OnInput then
                Callback.OnInput()
            end
        end)
        return input
    end
    function selftab:Option()
        local input = ldxinstance['varOption8']:Clone()
    end
    return selftab
end

function gui:Open()
    for i,v in pairs(gui.Main) do
        v.Instance.Visible = false
        v.Instance.Active = false
    end
    self.Instance.Visible = true
    self.Instance.Active = true
end

local button = {
    Text = "Click Me",
    OnClick = function() print("Clicked") end
}
local input = {
    value = nil,
    enterPress = false,
    OnInput = function() return end
}
gui.Set({
    title = "LIUDEX Z",
    textcolor = Color3.fromRGB(255,255,255),
    desc = "Developed By Jorell",
    background = Color3.fromRGB(48,10,105),
    transparency = 0.2,
    tabbackground = Color3.fromRGB(66,23,137),
    tabtransparency = 0.1,
    logo = "rbxassetid://131858077876191" --or you can use getcustomasset to
})
local main = gui.new("Main")
local farm = main:AddTab("Farm")
farm:Button(button)
local loop = false
farm:Toggle({Text = "Raknet",Callback = function(on) loop = on  print(on) end})
import.RunService.Heartbeat:Connect(function()
    if loop then
        print("active")
    end
end)
