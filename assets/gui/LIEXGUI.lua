--This Code Generate by ldx SetInstanceAsClipboard
--Thanks for using ldx SetInstanceAsClipboard we will improving this feature even more in the furture
--join ldx community at https://discord.gg/WmsssRkgd2
local ldxinstance = {}

LIEX = Instance.new("ScreenGui")
LIEX.Name = [[LIEX]]
LIEX.Parent = gethui()
LIEX.ResetOnSpawn = true

ldxinstance['varIntro1'] = Instance.new("Frame")
ldxinstance['varIntro1'].Name = [[Intro]]
ldxinstance['varIntro1'].Parent = LIEX
ldxinstance['varIntro1'].Size = UDim2.new(0.3499999940395355,0,0.05999999865889549,250)
ldxinstance['varIntro1'].Transparency = 1
ldxinstance['varIntro1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varIntro1'].BackgroundTransparency = 1
ldxinstance['varIntro1'].Position = UDim2.new(0.3240000009536743,0,0.5600000023841858,-175)
ldxinstance['varIntro1'].Visible = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varIntro1']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varUIStroke2'] = Instance.new("UIStroke")
ldxinstance['varUIStroke2'].Name = [[UIStroke]]
ldxinstance['varUIStroke2'].Parent = ldxinstance['varIntro1']
ldxinstance['varUIStroke2'].Color = Color3.fromRGB(189,172,255)
ldxinstance['varUIStroke2'].Transparency = 1
ldxinstance['varUIStroke2'].Enabled = true
ldxinstance['varUIStroke2'].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
ldxinstance['varUIStroke2'].ZIndex = 1

ldxinstance['varUIGradient3'] = Instance.new("UIGradient")
ldxinstance['varUIGradient3'].Name = [[UIGradient]]
ldxinstance['varUIGradient3'].Parent = ldxinstance['varIntro1']
ldxinstance['varUIGradient3'].Rotation = -120
ldxinstance['varUIGradient3'].Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(62, 13, 166)),ColorSequenceKeypoint.new(0.5, Color3.fromRGB(44, 0, 148)),ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 27, 92))})
ldxinstance['varUIGradient3'].Rotation = 90 
ldxinstance['varUIGradient3'].Offset = Vector2.new(0,0)
ldxinstance['varUIGradient3'].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,0)})
ldxinstance['varUIGradient3'].Enabled = true

ldxinstance['varTitle4'] = Instance.new("TextLabel")
ldxinstance['varTitle4'].Name = [[Title]]
ldxinstance['varTitle4'].Parent = ldxinstance['varIntro1']
ldxinstance['varTitle4'].Size = UDim2.new(1,0,0,100)
ldxinstance['varTitle4'].Transparency = 1
ldxinstance['varTitle4'].Text = [[LIEX]]
ldxinstance['varTitle4'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle4'].TextTransparency = 1
ldxinstance['varTitle4'].TextSize = 14
ldxinstance['varTitle4'].TextScaled = true
ldxinstance['varTitle4'].TextWrapped = true
ldxinstance['varTitle4'].Font = Enum.Font.Unknown
ldxinstance['varTitle4'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varTitle4'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varTitle4'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle4'].BackgroundTransparency = 1
ldxinstance['varTitle4'].Position = UDim2.new(0.001955607673153281,0,0.2887391746044159,0)
ldxinstance['varTitle4'].Visible = true

ldxinstance['varAnimation Script5'] = Instance.new("LocalScript")
ldxinstance['varAnimation Script5'].Name = [[Animation Script]]
ldxinstance['varAnimation Script5'].Parent = ldxinstance['varIntro1']
ldxinstance['varAnimation Script5'].Enabled = true
ldxinstance['varAnimation Script5'].RunContext = Enum.RunContext.Legacy

ldxinstance['varDesc6'] = Instance.new("TextLabel")
ldxinstance['varDesc6'].Name = [[Desc]]
ldxinstance['varDesc6'].Parent = ldxinstance['varIntro1']
ldxinstance['varDesc6'].Size = UDim2.new(0.5,0,0,40)
ldxinstance['varDesc6'].Transparency = 1
ldxinstance['varDesc6'].Text = [[<b>Developed By <i><u>Jorell</u></i></b>]]
ldxinstance['varDesc6'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varDesc6'].TextTransparency = 1
ldxinstance['varDesc6'].TextSize = 25
ldxinstance['varDesc6'].Font = Enum.Font.SourceSans
ldxinstance['varDesc6'].RichText = true
ldxinstance['varDesc6'].TextScaled = true
ldxinstance['varDesc6'].LineHeight = 1
ldxinstance['varDesc6'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varDesc6'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varDesc6'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varDesc6'].BackgroundTransparency = 1
ldxinstance['varDesc6'].Position = UDim2.new(0.257,0,0.2,100)
ldxinstance['varDesc6'].Visible = true
ldxinstance['varDesc6'].ZIndex = 1

ldxinstance['varMain2'] = Instance.new("Frame")
ldxinstance['varMain2'].Name = [[Main]]
ldxinstance['varMain2'].Parent = LIEX
ldxinstance['varMain2'].Size = UDim2.new(0.3499999940395355,0,0.05999999865889549,250)
ldxinstance['varMain2'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varMain2'].BackgroundColor3 = Color3.fromRGB(38,5,122)
ldxinstance['varMain2'].Position = UDim2.new(0.3240000009536743,0,0.5600000023841858,-175)
ldxinstance['varMain2'].Visible = false
ldxinstance['varMain2'].Draggable = true
ldxinstance['varMain2'].Active = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varMain2']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varUIStroke2'] = Instance.new("UIStroke")
ldxinstance['varUIStroke2'].Name = [[UIStroke]]
ldxinstance['varUIStroke2'].Parent = ldxinstance['varMain2']
ldxinstance['varUIStroke2'].Color = Color3.fromRGB(189,172,255)
ldxinstance['varUIStroke2'].Enabled = true
ldxinstance['varUIStroke2'].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
ldxinstance['varUIStroke2'].ZIndex = 1

ldxinstance['varCommandPannel3'] = Instance.new("TextBox")
ldxinstance['varCommandPannel3'].Name = [[CommandPannel]]
ldxinstance['varCommandPannel3'].Parent = ldxinstance['varMain2']
ldxinstance['varCommandPannel3'].Size = UDim2.new(1,-10,0,165)
ldxinstance['varCommandPannel3'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varCommandPannel3'].Transparency = 1
ldxinstance['varCommandPannel3'].Text = [[]]
ldxinstance['varCommandPannel3'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varCommandPannel3'].TextTransparency = 0
ldxinstance['varCommandPannel3'].TextSize = 14
ldxinstance['varCommandPannel3'].TextWrapped = true
ldxinstance['varCommandPannel3'].Visible = true
ldxinstance['varCommandPannel3'].Font = Enum.Font.Arcade
ldxinstance['varCommandPannel3'].RichText = true
ldxinstance['varCommandPannel3'].LineHeight = 1
ldxinstance['varCommandPannel3'].PlaceholderText = [[Example: /cht @all Lorem Ipsum
Enter Your Command Here...]]
ldxinstance['varCommandPannel3'].PlaceholderColor3 = Color3.fromRGB(127,127,127)
ldxinstance['varCommandPannel3'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varCommandPannel3'].TextYAlignment = Enum.TextYAlignment.Top
ldxinstance['varCommandPannel3'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varCommandPannel3'].BackgroundTransparency = 1
ldxinstance['varCommandPannel3'].Position = UDim2.new(0,5,0,120)

ldxinstance['varHandler1'] = Instance.new("LocalScript")
ldxinstance['varHandler1'].Name = [[Handler]]
ldxinstance['varHandler1'].Parent = ldxinstance['varCommandPannel3']
ldxinstance['varHandler1'].Enabled = true
ldxinstance['varHandler1'].RunContext = Enum.RunContext.Legacy

ldxinstance['varTitle4'] = Instance.new("Frame")
ldxinstance['varTitle4'].Name = [[Title]]
ldxinstance['varTitle4'].Parent = ldxinstance['varMain2']
ldxinstance['varTitle4'].Size = UDim2.new(1,0,0,52)
ldxinstance['varTitle4'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varTitle4'].Transparency = 1
ldxinstance['varTitle4'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle4'].BackgroundTransparency = 1
ldxinstance['varTitle4'].Position = UDim2.new(0,0,0,0)
ldxinstance['varTitle4'].Visible = true
ldxinstance['varTitle4'].ZIndex = 1

ldxinstance['varTitle1'] = Instance.new("TextLabel")
ldxinstance['varTitle1'].Name = [[Title]]
ldxinstance['varTitle1'].Parent = ldxinstance['varTitle4']
ldxinstance['varTitle1'].Size = UDim2.new(1,0,0,35)
ldxinstance['varTitle1'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varTitle1'].Transparency = 1
ldxinstance['varTitle1'].Text = [[<b>LIEX</b>]]
ldxinstance['varTitle1'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle1'].TextTransparency = 0
ldxinstance['varTitle1'].TextSize = 18
ldxinstance['varTitle1'].TextWrapped = true
ldxinstance['varTitle1'].Font = Enum.Font.SourceSans
ldxinstance['varTitle1'].RichText = true
ldxinstance['varTitle1'].LineHeight = 1
ldxinstance['varTitle1'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varTitle1'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varTitle1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varTitle1'].BackgroundTransparency = 1
ldxinstance['varTitle1'].Position = UDim2.new(0,0,0,0)
ldxinstance['varTitle1'].Visible = true
ldxinstance['varTitle1'].ZIndex = 1

ldxinstance['varUIPadding2'] = Instance.new("UIPadding")
ldxinstance['varUIPadding2'].Name = [[UIPadding]]
ldxinstance['varUIPadding2'].PaddingLeft = UDim.new(0,8)
ldxinstance['varUIPadding2'].Parent = ldxinstance['varTitle4']

ldxinstance['varDesc3'] = Instance.new("TextLabel")
ldxinstance['varDesc3'].Name = [[Desc]]
ldxinstance['varDesc3'].Parent = ldxinstance['varTitle4']
ldxinstance['varDesc3'].Size = UDim2.new(1,0,0,15)
ldxinstance['varDesc3'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varDesc3'].Transparency = 1
ldxinstance['varDesc3'].Text = [[LIEX Developed By <u><i>Veldenoire & Marflow</i></u>]]
ldxinstance['varDesc3'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varDesc3'].TextTransparency = 0
ldxinstance['varDesc3'].TextSize = 14
ldxinstance['varDesc3'].TextWrapped = true
ldxinstance['varDesc3'].Font = Enum.Font.SourceSans
ldxinstance['varDesc3'].RichText = true
ldxinstance['varDesc3'].LineHeight = 1
ldxinstance['varDesc3'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varDesc3'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varDesc3'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varDesc3'].BackgroundTransparency = 1
ldxinstance['varDesc3'].Position = UDim2.new(0,0,0,30)
ldxinstance['varDesc3'].Visible = true
ldxinstance['varDesc3'].ZIndex = 1

ldxinstance['varMinimize4'] = Instance.new("TextButton")
ldxinstance['varMinimize4'].Name = [[Minimize]]
ldxinstance['varMinimize4'].Parent = ldxinstance['varTitle4']
ldxinstance['varMinimize4'].Size = UDim2.new(0,30,0,30)
ldxinstance['varMinimize4'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varMinimize4'].Transparency = 1
ldxinstance['varMinimize4'].Text = [[<b>-</b>]]
ldxinstance['varMinimize4'].TextColor3 = Color3.fromRGB(220,220,220)
ldxinstance['varMinimize4'].TextTransparency = 0
ldxinstance['varMinimize4'].TextSize = 14
ldxinstance['varMinimize4'].TextScaled = true
ldxinstance['varMinimize4'].TextWrapped = true
ldxinstance['varMinimize4'].Font = Enum.Font.SourceSans
ldxinstance['varMinimize4'].RichText = true
ldxinstance['varMinimize4'].LineHeight = 1
ldxinstance['varMinimize4'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varMinimize4'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varMinimize4'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varMinimize4'].BackgroundTransparency = 1
ldxinstance['varMinimize4'].Position = UDim2.new(1,-34,0,5)
ldxinstance['varMinimize4'].Visible = true
ldxinstance['varMinimize4'].ZIndex = 1

ldxinstance['varline5'] = Instance.new("Frame")
ldxinstance['varline5'].Name = [[line]]
ldxinstance['varline5'].Parent = ldxinstance['varMain2']
ldxinstance['varline5'].Size = UDim2.new(1,-2,0,2)
ldxinstance['varline5'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varline5'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varline5'].Position = UDim2.new(0,1,0,52)
ldxinstance['varline5'].Visible = true
ldxinstance['varline5'].ZIndex = 1

ldxinstance['varCommand6'] = Instance.new("TextButton")
ldxinstance['varCommand6'].Name = [[Command]]
ldxinstance['varCommand6'].Parent = ldxinstance['varMain2']
ldxinstance['varCommand6'].Size = UDim2.new(0.47999998927116394,0,0,35)
ldxinstance['varCommand6'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varCommand6'].Text = [[Command]]
ldxinstance['varCommand6'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varCommand6'].TextTransparency = 0
ldxinstance['varCommand6'].TextSize = 14
ldxinstance['varCommand6'].Font = Enum.Font.SourceSans
ldxinstance['varCommand6'].LineHeight = 1
ldxinstance['varCommand6'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varCommand6'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varCommand6'].BackgroundColor3 = Color3.fromRGB(64,0,202)
ldxinstance['varCommand6'].Position = UDim2.new(0,5,0,65)
ldxinstance['varCommand6'].Visible = true
ldxinstance['varCommand6'].ZIndex = 1

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varCommand6']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varUIStroke2'] = Instance.new("UIStroke")
ldxinstance['varUIStroke2'].Name = [[UIStroke]]
ldxinstance['varUIStroke2'].Parent = ldxinstance['varCommand6']
ldxinstance['varUIStroke2'].Color = Color3.fromRGB(255,255,255)
ldxinstance['varUIStroke2'].Enabled = true
ldxinstance['varUIStroke2'].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ldxinstance['varUIStroke2'].ZIndex = 1

ldxinstance['varLogs7'] = Instance.new("TextButton")
ldxinstance['varLogs7'].Name = [[Logs]]
ldxinstance['varLogs7'].Parent = ldxinstance['varMain2']
ldxinstance['varLogs7'].Size = UDim2.new(0.47999998927116394,0,0,35)
ldxinstance['varLogs7'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varLogs7'].Text = [[Logs]]
ldxinstance['varLogs7'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varLogs7'].TextTransparency = 0
ldxinstance['varLogs7'].TextSize = 14
ldxinstance['varLogs7'].Font = Enum.Font.SourceSans
ldxinstance['varLogs7'].LineHeight = 1
ldxinstance['varLogs7'].TextXAlignment = Enum.TextXAlignment.Center
ldxinstance['varLogs7'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varLogs7'].BackgroundColor3 = Color3.fromRGB(64,0,202)
ldxinstance['varLogs7'].Position = UDim2.new(0.5199999809265137,-5,0,65)
ldxinstance['varLogs7'].Visible = true
ldxinstance['varLogs7'].ZIndex = 1

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varLogs7']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varUIStroke2'] = Instance.new("UIStroke")
ldxinstance['varUIStroke2'].Name = [[UIStroke]]
ldxinstance['varUIStroke2'].Parent = ldxinstance['varLogs7']
ldxinstance['varUIStroke2'].Color = Color3.fromRGB(255,255,255)
ldxinstance['varUIStroke2'].Enabled = true
ldxinstance['varUIStroke2'].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ldxinstance['varUIStroke2'].ZIndex = 1

ldxinstance['varDescript8'] = Instance.new("TextLabel")
ldxinstance['varDescript8'].Name = [[Descript]]
ldxinstance['varDescript8'].Parent = ldxinstance['varMain2']
ldxinstance['varDescript8'].Size = UDim2.new(0,202,0,14)
ldxinstance['varDescript8'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varDescript8'].Transparency = 1
ldxinstance['varDescript8'].Text = [[Output:]]
ldxinstance['varDescript8'].TextColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varDescript8'].TextTransparency = 0
ldxinstance['varDescript8'].TextSize = 14
ldxinstance['varDescript8'].Font = Enum.Font.SourceSans
ldxinstance['varDescript8'].LineHeight = 1
ldxinstance['varDescript8'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varDescript8'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varDescript8'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varDescript8'].BackgroundTransparency = 1
ldxinstance['varDescript8'].Position = UDim2.new(0,5,0,105)
ldxinstance['varDescript8'].Visible = true
ldxinstance['varDescript8'].ZIndex = 1

ldxinstance['varLogsOutput9'] = Instance.new("ScrollingFrame")
ldxinstance['varLogsOutput9'].Name = [[LogsOutput]]
ldxinstance['varLogsOutput9'].Parent = ldxinstance['varMain2']
ldxinstance['varLogsOutput9'].Size = UDim2.new(1,-10,0,165)
ldxinstance['varLogsOutput9'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varLogsOutput9'].Transparency = 1
ldxinstance['varLogsOutput9'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varLogsOutput9'].BackgroundTransparency = 1
ldxinstance['varLogsOutput9'].Position = UDim2.new(0,5,0,120)
ldxinstance['varLogsOutput9'].Visible = false
ldxinstance['varLogsOutput9'].ZIndex = 1
ldxinstance['varLogsOutput9'].ClipsDescendants = true
ldxinstance['varLogsOutput9'].CanvasSize = UDim2.new(0,0,0,17)
ldxinstance['varLogsOutput9'].CanvasPosition = Vector2.new(0,0)
ldxinstance['varLogsOutput9'].ScrollBarThickness = 12
ldxinstance['varLogsOutput9'].ScrollingEnabled = true
ldxinstance['varLogsOutput9'].ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ldxinstance['varLogsOutput9'].AutomaticCanvasSize = Enum.AutomaticSize.None

ldxinstance['varUIListLayout1'] = Instance.new("UIListLayout")
ldxinstance['varUIListLayout1'].Name = [[UIListLayout]]
ldxinstance['varUIListLayout1'].Parent = ldxinstance['varLogsOutput9']

ldxinstance['varIcon3'] = Instance.new("ImageButton")
ldxinstance['varIcon3'].Name = [[Icon]]
ldxinstance['varIcon3'].Parent = LIEX
ldxinstance['varIcon3'].Size = UDim2.new(0,48,0,48)
ldxinstance['varIcon3'].Image = [[rbxassetid://131858077876191]]
ldxinstance['varIcon3'].ImageColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varIcon3'].ScaleType = Enum.ScaleType.Stretch
ldxinstance['varIcon3'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varIcon3'].Position = UDim2.new(0.035592060536146164,0,0.4178885519504547,0)
ldxinstance['varIcon3'].Visible = false
ldxinstance['varIcon3'].Draggable = true
ldxinstance['varIcon3'].Active = true

ldxinstance['varUICorner1'] = Instance.new("UICorner")
ldxinstance['varUICorner1'].Name = [[UICorner]]
ldxinstance['varUICorner1'].Parent = ldxinstance['varIcon3']
ldxinstance['varUICorner1'].CornerRadius = UDim.new(0,8)

ldxinstance['varUIStroke2'] = Instance.new("UIStroke")
ldxinstance['varUIStroke2'].Name = [[UIStroke]]
ldxinstance['varUIStroke2'].Parent = ldxinstance['varIcon3']
ldxinstance['varUIStroke2'].Color = Color3.fromRGB(115,0,255)
ldxinstance['varUIStroke2'].Enabled = true
ldxinstance['varUIStroke2'].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
ldxinstance['varUIStroke2'].ZIndex = 1

ldxinstance['varReserved4'] = Instance.new("Folder")
ldxinstance['varReserved4'].Name = [[Reserved]]
ldxinstance['varReserved4'].Parent = LIEX

ldxinstance['varerror1'] = Instance.new("TextLabel")
ldxinstance['varerror1'].Name = [[error]]
ldxinstance['varerror1'].Parent = ldxinstance['varReserved4']
ldxinstance['varerror1'].Size = UDim2.new(0.8999999761581421,0,0,16)
ldxinstance['varerror1'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varerror1'].Transparency = 1
ldxinstance['varerror1'].Text = [[Error]]
ldxinstance['varerror1'].TextColor3 = Color3.fromRGB(207,24,24)
ldxinstance['varerror1'].TextTransparency = 0
ldxinstance['varerror1'].TextSize = 14
ldxinstance['varerror1'].TextScaled = true
ldxinstance['varerror1'].TextWrapped = true
ldxinstance['varerror1'].Font = Enum.Font.SourceSans
ldxinstance['varerror1'].LineHeight = 1
ldxinstance['varerror1'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varerror1'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varerror1'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varerror1'].BackgroundTransparency = 1
ldxinstance['varerror1'].Position = UDim2.new(0,0,0,0)
ldxinstance['varerror1'].Visible = false
ldxinstance['varerror1'].ZIndex = 1

ldxinstance['varsuccess2'] = Instance.new("TextLabel") 
ldxinstance['varsuccess2'].Name = [[success]]
ldxinstance['varsuccess2'].Parent = ldxinstance['varReserved4']
ldxinstance['varsuccess2'].Size = UDim2.new(0.8999999761581421,0,0,16)
ldxinstance['varsuccess2'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varsuccess2'].Transparency = 1
ldxinstance['varsuccess2'].Text = [[Success]]
ldxinstance['varsuccess2'].TextColor3 = Color3.fromRGB(38,207,35)
ldxinstance['varsuccess2'].TextTransparency = 0
ldxinstance['varsuccess2'].TextSize = 14
ldxinstance['varsuccess2'].TextScaled = true
ldxinstance['varsuccess2'].TextWrapped = true
ldxinstance['varsuccess2'].Font = Enum.Font.SourceSans
ldxinstance['varsuccess2'].LineHeight = 1
ldxinstance['varsuccess2'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varsuccess2'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varsuccess2'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varsuccess2'].BackgroundTransparency = 1
ldxinstance['varsuccess2'].Position = UDim2.new(0,0,0,0)
ldxinstance['varsuccess2'].Visible = false

ldxinstance['varglobalprint3'] = Instance.new("TextLabel")
ldxinstance['varglobalprint3'].Name = [[globalprint]]
ldxinstance['varglobalprint3'].Parent = ldxinstance['varReserved4']
ldxinstance['varglobalprint3'].Size = UDim2.new(0.8999999761581421,0,0,16)
ldxinstance['varglobalprint3'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varglobalprint3'].Transparency = 1
ldxinstance['varglobalprint3'].Text = [[Print]]
ldxinstance['varglobalprint3'].TextColor3 = Color3.fromRGB(88,58,207)
ldxinstance['varglobalprint3'].TextTransparency = 0
ldxinstance['varglobalprint3'].TextSize = 14
ldxinstance['varglobalprint3'].TextScaled = true
ldxinstance['varglobalprint3'].TextWrapped = true
ldxinstance['varglobalprint3'].Font = Enum.Font.SourceSans
ldxinstance['varglobalprint3'].LineHeight = 1
ldxinstance['varglobalprint3'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varglobalprint3'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varglobalprint3'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varglobalprint3'].BackgroundTransparency = 1
ldxinstance['varglobalprint3'].Position = UDim2.new(0,0,0,0)
ldxinstance['varglobalprint3'].Visible = false

ldxinstance['varwarn4'] = Instance.new("TextLabel")
ldxinstance['varwarn4'].Name = [[warn]]
ldxinstance['varwarn4'].Parent = ldxinstance['varReserved4']
ldxinstance['varwarn4'].Size = UDim2.new(0.8999999761581421,0,0,16)
ldxinstance['varwarn4'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varwarn4'].Transparency = 1
ldxinstance['varwarn4'].Text = [[Print]]
ldxinstance['varwarn4'].TextColor3 = Color3.fromRGB(188,207,16)
ldxinstance['varwarn4'].TextTransparency = 0
ldxinstance['varwarn4'].TextSize = 14
ldxinstance['varwarn4'].TextScaled = true
ldxinstance['varwarn4'].TextWrapped = true
ldxinstance['varwarn4'].Font = Enum.Font.SourceSans
ldxinstance['varwarn4'].LineHeight = 1
ldxinstance['varwarn4'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varwarn4'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varwarn4'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varwarn4'].BackgroundTransparency = 1
ldxinstance['varwarn4'].Position = UDim2.new(0,0,0,0)
ldxinstance['varwarn4'].Visible = false
ldxinstance['varwarn4'].ZIndex = 1

ldxinstance['varclient5'] = Instance.new("TextLabel")
ldxinstance['varclient5'].Name = [[client]]
ldxinstance['varclient5'].Parent = ldxinstance['varReserved4']
ldxinstance['varclient5'].Size = UDim2.new(0.8999999761581421,0,0,16)
ldxinstance['varclient5'].AnchorPoint = Vector2.new(0,0)
ldxinstance['varclient5'].Transparency = 1
ldxinstance['varclient5'].Text = [[Print]]
ldxinstance['varclient5'].TextColor3 = Color3.fromRGB(41,58,207)
ldxinstance['varclient5'].TextSize = 14
ldxinstance['varclient5'].TextScaled = true
ldxinstance['varclient5'].TextWrapped = true
ldxinstance['varclient5'].Font = Enum.Font.SourceSans
ldxinstance['varclient5'].TextXAlignment = Enum.TextXAlignment.Left
ldxinstance['varclient5'].TextYAlignment = Enum.TextYAlignment.Center
ldxinstance['varclient5'].BackgroundColor3 = Color3.fromRGB(255,255,255)
ldxinstance['varclient5'].BackgroundTransparency = 1
ldxinstance['varclient5'].Position = UDim2.new(0,0,0,0)
ldxinstance['varclient5'].Visible = false
local socket = loadstring(game:HttpGet("https://raw.githubusercontent.com/Asepthegoat/LIUDEX-Z/refs/heads/main/script/LIEX.lua"))()
task.wait(0.2)

local Frame = gethui().LIEX.Intro["Animation Script"].Parent
local text = Frame:WaitForChild("Title")
local textpos = text.Position
local Desc = Frame:WaitForChild("Desc")
local ts = game:GetService("TweenService")
local info = TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
local info2 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local tween = ts:Create(Frame, info2, {BackgroundTransparency = 0})
local tween2 = ts:Create(Frame, info, {BackgroundTransparency = 1})
local texttween = ts:Create(text,TweenInfo.new(0.8,Enum.EasingStyle.Cubic,Enum.EasingDirection.In,0,false,0),{TextTransparency = 0})
local texttween2 = ts:Create(text,TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.In,0,false,0),{TextTransparency = 1})
local texttween3 = ts:Create(text,TweenInfo.new(0.4,Enum.EasingStyle.Cubic,Enum.EasingDirection.In,0,false,0),{Position = UDim2.new(textpos.X.Scale,textpos.X.Offset,textpos.Y.Scale,textpos.Y.Offset - 20)})
local stroke = Frame:WaitForChild("UIStroke")
local stroketween = ts:Create(stroke,TweenInfo.new(0.8,Enum.EasingStyle.Cubic,Enum.EasingDirection.In,0,false,0),{Transparency = 0})
local stroketween2 = ts:Create(stroke,TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.In,0,false,0),{Transparency = 1})
local desctween = ts:Create(Desc,TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.In,0,false,0),{TextTransparency = 0})
local desctween2 = ts:Create(Desc,TweenInfo.new(0.5,Enum.EasingStyle.Cubic,Enum.EasingDirection.In,0,false,0),{TextTransparency = 1})
task.wait(1)
tween:Play()
texttween:Play()
stroketween:Play()

task.wait(1.5)
texttween3:Play()
task.wait(0.49)
desctween:Play()
task.wait(1.9)
tween2:Play()
texttween2:Play()
stroketween2:Play()
desctween2:Play()
task.wait(1.1)
local main = Frame.Parent:WaitForChild("Main")
main.Visible = true
task.wait()
Frame:Destroy()

local clog = 1
function addlog(type,msg)
	local log = ldxinstance['varLogsOutput9']
	
	local warnout = ldxinstance['varwarn4'] 
	local globalout = ldxinstance['varglobalprint3']
	local succ = ldxinstance['varsuccess2'] 
	local err = ldxinstance['varerror1']
	if type == "print" then
		local printout = warnout:Clone()
		printout.Parent = log
		printout.Visible = true
		printout.TextTransparency = 0
		printout.Text = msg
	elseif type == "send" then
		local sendout = warnout:Clone()
		sendout.Parent = log
		sendout.Visible = true
		sendout.TextTransparency = 0
		sendout.Text = msg
	elseif type == "recive" then
		local succ = succ:Clone()
		succ.Parent = log
		succ.Visible = true
		succ.TextTransparency = 0
		succ.Text = msg
	elseif type == "global" then
		local printout = globalout:Clone()
		printout.Parent = log
		printout.Visible = true
		printout.TextTransparency = 0
		printout.Text = msg
	end
end

function executedcommand(cmd,op,...)
	local args = {...}
	for i,v in pairs(args) do
		if typeof(v) == "string" then
			if v:match("^@self$") then
				print("filt")
    			args[i] = getplayer().Name
			elseif v:match("%$(.-)$") then
				print("filt")
				args[i] = findPlayer(v:match("%$(.-)$")).Name
			end
		end
	end
	print("filt end")
	RemoteSocket.RemoteCom[cmd]:FireSocket(op,unpack(args))
	addlog("send","sending:" .. table.concat(args," ",1))
end

local Pannel = gethui().LIEX.Main.CommandPannel.Handler.Parent
local uis = game:GetService("UserInputService")
local minim = Pannel.Parent:WaitForChild("Title"):WaitForChild("Minimize")
local icon = minim.Parent.Parent.Parent:WaitForChild("Icon")
minim.MouseButton1Click:Connect(function()
	Pannel.Parent.Visible = not Pannel.Parent.Visible
	icon.Visible = not Pannel.Parent.Visible
end)

icon.MouseButton1Click:Connect(function()
	Pannel.Parent.Visible = not Pannel.Parent.Visible
	icon.Visible = not Pannel.Parent.Visible
end)

ldxinstance['varLogs7'].MouseButton1Click:Connect(function()
	ldxinstance['varCommandPannel3'].Visible = false
	ldxinstance['varCommandPannel3'].Active = false
	ldxinstance['varLogsOutput9'].Visible = true
	ldxinstance['varLogsOutput9'].Active = true
end)

ldxinstance['varCommand6'].MouseButton1Click:Connect(function()
	ldxinstance['varLogsOutput9'].Visible = false
	ldxinstance['varLogsOutput9'].Active = false
	ldxinstance['varCommandPannel3'].Visible = true
	ldxinstance['varCommandPannel3'].Active = true
end)

socket.OnMessage:Connect(function(msg)
	local args = string.split(msg," | ")
	local op = args[3]
	if op == "@all" or op == "@global" then
		addlog("global",msg)
	elseif op == "@self" or op:match("@server") then
		addlog("print",msg)
	elseif op:match("%$(.-)$") then
		addlog("recive",msg)
	end
end)
Pannel.FocusLost:Connect(function(eP)
	if eP then
	print(Pannel.Text)
	local function smartSplit(text)
	local result = {}
	local current = ""
	local inQuotes = false

	for i = 1, #text do
		local char = text:sub(i,i)

		if char == '"' then
			inQuotes = not inQuotes
		elseif char == " " and not inQuotes then
			if current ~= "" then
				table.insert(result, current)
				current = ""
			end
		else
			current = current .. char
		end
	end

	if current ~= "" then
		table.insert(result, current)
	end

	return result
end

local str = smartSplit(Pannel.Text)
	local cmd = str[1]
	print(cmd)
	if cmd:sub(1,1) == "/" then
		cmd = cmd:sub(2)
		executedcommand(cmd,str[2],unpack(str,3))
	end
		Pannel.Text = ""
	end
end)

uis.InputBegan:Connect(function(input, gP)
	if gP then return end
	if input.KeyCode == Enum.KeyCode.F2 then
		Pannel.Visible = not Pannel.Visible
	end
end)
