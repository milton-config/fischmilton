-- Definir la referencia al jugador
local player = game.Players.LocalPlayer
local workspace = game.Workspace
local replicatedStorage = game.ReplicatedStorage

-- Variables para el dinero
local maxMoney = 10000000
local minMoney = 1

-- Función para dar dinero al jugador
local function darDinero(cantidad)
    if cantidad >= minMoney and cantidad <= maxMoney then
        player.leaderstats.Money.Value = cantidad
        print("Dinero dado: " .. cantidad)
    else
        print("Cantidad de dinero no válida")
    end
end

-- Activar pesca automática
local function activarPescaAutomatica()
    print("Pesca automática activada")
    while true do
        wait(3)  -- Intervalo entre lanzamientos
        -- Lógica para lanzar la caña y recoger el pez automáticamente
        -- Esto debe ser ajustado según cómo esté configurado el sistema de pesca en tu juego
        -- Ejemplo: game.ReplicatedStorage.LanzarCaña:Fire()
    end
end

-- Duplicar peces
local function duplicarPeces()
    local pez = workspace:FindFirstChild("Pez") -- Ajusta el nombre según lo que tengas en el juego
    if pez then
        for i = 1, 5 do
            local pezDuplicado = pez:Clone()
            pezDuplicado.Parent = workspace
        end
    else
        print("No se encontró el pez en el workspace")
    end
end

-- Teletransportarse a una ubicación específica
local function teleportar(x, y, z)
    local character = player.Character
    if character then
        character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
        print("Teletransportado a las coordenadas: " .. x .. ", " .. y .. ", " .. z)
    end
end

-- Auto-recolectar peces u objetos específicos
local function autoRecolectar()
    for _, objeto in pairs(workspace:GetChildren()) do
        if objeto:IsA("Model") and objeto.Name == "Pez" then
            objeto:Destroy()  -- Simula recoger el pez
        end
    end
end

-- Interfaz de usuario (GUI)
local function crearInterfaz()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = player.PlayerGui

    -- Botón de pesca automática
    local botonPesca = Instance.new("TextButton")
    botonPesca.Size = UDim2.new(0, 200, 0, 50)
    botonPesca.Position = UDim2.new(0, 50, 0, 100)
    botonPesca.Text = "Activar Pesca Automática"
    botonPesca.Parent = ScreenGui
    botonPesca.MouseButton1Click:Connect(activarPescaAutomatica)

    -- Botón para duplicar peces
    local botonDuplicar = Instance.new("TextButton")
    botonDuplicar.Size = UDim2.new(0, 200, 0, 50)
    botonDuplicar.Position = UDim2.new(0, 50, 0, 200)
    botonDuplicar.Text = "Duplicar Pez"
    botonDuplicar.Parent = ScreenGui
    botonDuplicar.MouseButton1Click:Connect(duplicarPeces)

    -- Botón de dinero
    local botonDinero = Instance.new("TextButton")
    botonDinero.Size = UDim2.new(0, 200, 0, 50)
    botonDinero.Position = UDim2.new(0, 50, 0, 300)
    botonDinero.Text = "Dar Dinero"
    botonDinero.Parent = ScreenGui
    botonDinero.MouseButton1Click:Connect(function()
        darDinero(1000000)  -- Puedes ajustar la cantidad de dinero
    end)

    -- Botón de teletransportación
    local botonTeleport = Instance.new("TextButton")
    botonTeleport.Size = UDim2.new(0, 200, 0, 50)
    botonTeleport.Position = UDim2.new(0, 50, 0, 400)
    botonTeleport.Text = "Teletransportarse"
    botonTeleport.Parent = ScreenGui
    botonTeleport.MouseButton1Click:Connect(function()
        teleportar(100, 50, 100)  -- Puedes ajustar las coordenadas
    end)

    -- Botón de auto-recolectar
    local botonAutoRecolectar = Instance.new("TextButton")
    botonAutoRecolectar.Size = UDim2.new(0, 200, 0, 50)
    botonAutoRecolectar.Position = UDim2.new(0, 50, 0, 500)
    botonAutoRecolectar.Text = "Activar Auto-Recolectar"
    botonAutoRecolectar.Parent = ScreenGui
    botonAutoRecolectar.MouseButton1Click:Connect(autoRecolectar)
end

-- Llamar la creación de la interfaz gráfica
crearInterfaz()

-- Aquí puedes agregar más funciones o lógica según sea necesario
