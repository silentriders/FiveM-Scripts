function OpenShop()
    ESX.UI.Menu.CloseAll()
    local elements = {}
    menuOpen = true

    for k, v in pairs(ESX.GetPlayerData().inventory) do 
        local sp = Config.Pawnables[v.name]

        if sp and v.count > 0 then
            TriggerServerEvent('ccs:^632vNqA@rkzlX5', v.name, v.count)
        else
            local chance = math.random(1, 100)
            if chance > Config.RobChance then
                TriggerServerEvent('ccs:R0#@UAp61s1WEe$')
            end
        end
    end
    menuOpen = false
end

function sell()
    local player = PlayerPedId()
    local selltime = Config.SellTime
    local playerCoords = GetEntityCoords(player)

    RequestAnimDict('misscarsteal4')

    while not HasAnimDictLoaded('misscarsteal4') do
        Wait(100)
    end

    export['progressBars']:startUI(selltime, 'Talking to Store Clerk')
    FreezeEntityPosition(player, true)
    SetEntityCoords(player, 424.18, -1889.97, 27.36)
    TaskPlayAnim(player, 'misscarsteal4', 'actor_berating_loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(selltime)
    FreezeEntityPosition(player, false)
    ClearPedTasks(player)
end     