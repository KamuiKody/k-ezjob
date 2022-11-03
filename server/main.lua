local QBCore = exports['qb-core']:GetCoreObject()
local Registers = {}

RegisterNetEvent('QBCore:Server:UpdateObject', function()
	if source ~= '' then return false end
	QBCore = exports['qb-core']:GetCoreObject()
end)

RegisterNetEvent('k-ezjob:ImportUpdate', function()
	--if source ~= '' then return false end
	Imports = Imports
    addStuff()
end)

RegisterServerEvent("k-ezjob:pay", function(data)
    if data.amount == 0 then return end
    local src = source
    local billed = QBCore.Functions.GetPlayer(src)
    if data.type == 'bank' then
        if Config.BankCards then
            if next(Config.BankCards) then
                local trigger = false
                for k,v in pairs(Config.BankCards) do
                    local card = billed.Functions.GetItemByName(v)
                    if card then
                        if card.amount > 0 then
                            trigger = true
                        end
                    end
                end
                if not trigger then
                    TriggerClientEvent('QBCore:Notify', src, 'You must have a card on you to do this.')
                    return
                end
            end
        end
    end
    if billed.Functions.RemoveMoney(data.type,data.amount) then    
        local commission = (data.amount * Config.Locations[data.store]['commission'])
        if data.biller then
            if data.biller ~= 0 then
                local biller = QBCore.Functions.GetPlayer(data.biller)
                biller.Functions.AddMoney('bank', commission)
            end
        end
        exports['qb-management']:AddMoney(data.store, (data.amount - commission))
        Registers[data.store] = {
            [data.index] = {
                amount = 0,
                biller = 0
            }
        }
    else
        TriggerClientEvent('QBCore:Notify', src, 'You must have enough money for this.')
    end
end)

RegisterServerEvent("k-ezjob:server:setregister", function(data)
    Registers[data.store]= {
        [data.index] = {
            amount = data.amount,
            biller = data.biller
        }
    }
end)

QBCore.Functions.CreateCallback("k-ezjob:server:cb:recipe", function(source, cb, reward)
    local canMake = true
    local Player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(reward.cost) do
        local item = Player.Functions.GetItemByName(k)
        print(v)
        local amount = Player.Functions.GetItemByName(item.name).amount
        if not item or amount < v then
            TriggerClientEvent('QBCore:Notify', source, 'You need '..v..' of '..QBCore.Shared.Items[k].label, 'error', 5000) 
            canMake = false                
            return
        end
    end
    if canMake then
        local removed = true
        for k, v in pairs(reward.cost) do
            if Player.Functions.RemoveItem(k, v) then
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[k], "remove")
            else
                TriggerClientEvent('QBCore:Notify', source, 'You need '..v..' of '..QBCore.Shared.Items[k].label, 'error', 5000) 
                removed = false
                return
            end
        end
        if removed then
            if Player.Functions.AddItem(reward.item, reward.received) then
                cb(true)
            end            
        else
            cb(false)
        end    
    else
        cb(false)    
    end
end)

AddEventHandler('onResourceStart', function(resource) 
    if GetCurrentResourceName() ~= resource then return end
    addStuff()
end)

function addStuff()
    Wait(4000)
    for k in pairs(Config.Locations) do
        for v in pairs(Config.Locations[k]['register']) do
            print(k,v)
            Registers[k] = {
                [v] = {
                    biller = 0,
                    amount = 0
                }
            }
        end
    end
    if Config.UseExports then
        QBCore.Debug(Imports.Items)	
        for k,v in pairs(Imports.Items) do	
            exports['qb-core']:AddItem(k,v)
        end
        for k,v in pairs(Imports.Jobs) do		
            exports['qb-core']:AddJob(k,v)
        end
        for k,v in pairs(Imports.Cityhall) do			
            exports['qb-cityhall']:AddCityJob(k,v)
        end
        for k,v in pairs(Imports.Boss) do		
            checkDB(k,v)
        end        
        for k,v in pairs(Imports.Items) do
            if v['alcohol'] then
                if tonumber(v['alcohol']) > 0 then
                    QBCore.Functions.CreateUseableItem(k , function(source, item)
                        local src = source
                        local Player = QBCore.Functions.GetPlayer(src)
                        if not Player.Functions.RemoveItem(k,1) then return end
                        TriggerClientEvent('k-creator:UseItem', src, item.name, 'alcohol', tonumber(v['alcohol']))
                    end)
                end
            end
            if v['hunger'] then
                if tonumber(v['hunger'])> 0 then
                    QBCore.Functions.CreateUseableItem(k , function(source, item)
                        local src = source
                        local Player = QBCore.Functions.GetPlayer(src)
                        if not Player.Functions.RemoveItem(k,1) then return end
                        TriggerClientEvent('k-creator:UseItem', src, item.name, 'hunger', tonumber(v['hunger']))
                    end)
                end
            end
            if v['thirst'] then
                if tonumber(v['thirst'])> 0 then
                    QBCore.Functions.CreateUseableItem(k , function(source, item)
                        local src = source
                        local Player = QBCore.Functions.GetPlayer(src)
                        if not Player.Functions.RemoveItem(k,1) then return end
                        TriggerClientEvent('k-creator:UseItem', src, item.name, 'thirst', tonumber(v['thirst']))
                    end)
                end
            end
        end
        TriggerClientEvent('QBCore:Client:UpdateObject', -1)
        TriggerEvent('QBCore:Sever:UpdateObject')
    end
end


QBCore.Functions.CreateCallback("k-ezjob:cb:register", function(source, cb)
    Wait(0)
    local Register = Registers
    cb(Register)
end)

if Config.UseExports then

    function checkDB(job,startbank)
        local call = MySQL.query.await('SELECT job_name,amount FROM management_funds WHERE type = "boss"', {})
        local created = false
        for _,v in pairs(call) do
            if v.job_name == job then
                created = true
                break
            end
        end
        if not created then
            MySQL.ready(function()
                MySQL.Sync.execute('INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES (@job, @amount, @type)', {
                    ['job'] = job,
                    ['amount'] = startbank,
                    ['type'] = 'boss'
                })
            end)
        end
    end

end