-- CustomChar.lua
-- Script base do EB do Fono, pronto pra ModuleScript

local module = {}

-- Função que troca o personagem do jogador pelo modelo padrão
function module.Trocar(player)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local CharacterModel = ReplicatedStorage:FindFirstChild("DefaultCustomChar") -- modelo padrão

    if not CharacterModel then
        warn("Custom character model não encontrado em ReplicatedStorage!")
        return
    end

    local clone = CharacterModel:Clone()
    clone.Name = player.Name

    -- deleta o personagem atual
    if player.Character then
        player.Character:Destroy()
    end

    clone.Parent = workspace
    player.Character = clone

    -- posiciona o personagem e carrega animações
    local humanoid = clone:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if clone:FindFirstChild("HumanoidRootPart") then
            clone.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
        end
        humanoid:LoadDefaultAnimations()
    end
end

return module
