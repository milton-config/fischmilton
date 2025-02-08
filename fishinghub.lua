-- 🔹 Configuración
local player = game.Players.LocalPlayer
local backpack = player:FindFirstChild("Backpack")
local rodName = "Rod of the Depths"  -- Nombre de la caña
local fishName = "Aurora Totem"  -- Nombre del pez o ítem a duplicar
local duplicateCount = 50  -- Cantidad de peces duplicados
local fishingEnabled = false  -- Estado de la pesca automática

-- 🔹 Crear GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Position = UDim2.new(0, 10, 0, 10)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 2

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Text = "Fishing Hub 🎣"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

-- 🔹 Botón de Auto-Pesca
local AutoFishButton = Instance.new("TextButton")
AutoFishButton.Parent = Frame
AutoFishButton.Size = UDim2.new(1, 0, 0, 40)
AutoFishButton.Position = UDim2.new(0, 0, 0, 50)
AutoFishButton.Text = "Activar Auto-Pesca 🎣"
AutoFishButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
AutoFishButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 🔹 Botón de Duplicar Peces
local DuplicateFishButton = Instance.new("TextButton")
DuplicateFishButton.Parent = Frame
DuplicateFishButton.Size = UDim2.new(1, 0, 0, 40)
DuplicateFishButton.Position = UDim2.new(0, 0, 0, 100)
DuplicateFishButton.Text = "Duplicar Peces 🐟"
DuplicateFishButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
DuplicateFishButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 🔹 Botón de Generar Totems
local GenerateTotemsButton = Instance.new("TextButton")
GenerateTotemsButton.Parent = Frame
GenerateTotemsButton.Size = UDim2.new(1, 0, 0, 40)
GenerateTotemsButton.Position = UDim2.new(0, 0, 0, 150)
GenerateTotemsButton.Text = "Generar Aurora Totems ✨"
GenerateTotemsButton.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
GenerateTotemsButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 🔹 Función para Auto-Pesca
local function autoFish()
    while fishingEnabled do
        wait(math.random(2, 4))
        local rod = backpack:FindFirstChild(rodName) or player.Character:FindFirstChild(rodName)
        if rod then
            rod:Activate()
        end
    end
end

-- 🔹 Activar/Desactivar Auto-Pesca
AutoFishButton.MouseButton1Click:Connect(function()
    fishingEnabled = not fishingEnabled
    AutoFishButton.Text = fishingEnabled and "Desactivar Auto-Pesca ❌" or "Activar Auto-Pesca 🎣"
    if fishingEnabled then
        spawn(autoFish)
    end
end)

-- 🔹 Duplicar Peces
DuplicateFishButton.MouseButton1Click:Connect(function()
    local fish = backpack:FindFirstChild(fishName)
    if fish then
        for i = 1, duplicateCount do
            local newFish = fish:Clone()
            newFish.Parent = backpack
        end
        print("🐟 Se han duplicado " .. duplicateCount .. " peces.")
    else
        print("⚠️ No tienes peces en el inventario.")
    end
end)

-- 🔹 Generar Aurora Totems
GenerateTotemsButton.MouseButton1Click:Connect(function()
    local newTotem = Instance.new("Tool")
    newTotem.Name = fishName
    newTotem.Parent = backpack
    print("✨ Aurora Totem añadido al inventario.")
end)
