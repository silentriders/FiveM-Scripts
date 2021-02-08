ESX = nil

TriggerEvent(Config.ESX, function(obj)
    ESX = obj
end)

RegisterServerEvent('ccs:^632vNqA@rkzlX5') -- Sell Items
AddEventHandler('ccs:^632vNqA@rkzlX5', function(itemName, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local ccs = Config.Pawnables[itemName]
    local xItem = xPlayer.getInventoryItem(itemName)


    if xItem.count < amount then
        TriggerClientEvent('t-notify:client:Custom', source, {
            style = 'info',
            message = 'You don\'t have enough Product for the dealer',
            duration = 5500,
            sound = true
        })
    end

    ccs = ESX.Math.Round(ccs * amount)

    xPlayer.addMoney(amount)
    xPlayer.removeInventoryItem(xItem.name, amount)

    TriggerClientEvent('t-notify:client:Custom', source, {
        style = 'info',
        message = 'you\'ve sold %sx %s for $%s' .. amount .. xItem.label .. ESX.Math.GroupDigits(ccs),
        duration = 5500,
        sound = true
    })
end)


RegisterServerEvent('ccs:R0#@UAp61s1WEe$') -- Rob Stuff
AddEventHandler('ccs:R0#@UAp61s1WEe$', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = xPlayer.getAccount('money')
    local tcash = 0.1 * cash 

    xPlayer.removeMoney(tcash)

    TriggerClientEvent('t-notify:client:Custom', source, {
        style = 'info',
        message = 'You have been robbed $' .. ESX.Math.GroupDigits(tcash),
        duration = 5500,
        sound = true
    })

end)