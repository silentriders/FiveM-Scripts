Config = {}

--Esx Trigger event
Config.ESX = 'esx:getSharedObject'

local time = 1000 -- 1 Second


Config.ShopBlip = true -- Do you want to show the blip on the map (true/false)
Config.SellTime = 10 * time -- 10 Seconds
Config.RobChance = 10


-- Things you can sell at the Pawnshop
Config.Pawnables = {
    oldpc = math.random(10, 20),
    rolex = math.random (55, 110),
    IPhone = math.random(150, 250)
}

Config.Shop = {
    pawnshop = {coords = vector3(423.66, -1889.97, 26.36), name = 'Cash Converter', colour = 81, spirte = 467, radius = 25.0}
}