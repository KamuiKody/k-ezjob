QBCore = exports['qb-core']:GetCoreObject()
local Blip = {}
local onDuty = false
local hardcordedEvents ={
    ['duty'] = "k-ezjob:Duty",
    ['register'] = "k-ezjob:register",
    ['stash'] = "k-ezjob:stashes",
    ['job_stash'] = "k-ezjob:stashes",
    ['tray'] = "k-ezjob:stashes",
    ['shop'] = "k-ezjob:stashes",
    ['boss_menu'] = "qb-bossmenu:client:OpenMenu",
    ['clothing'] = 'qb-clothing:client:openOutfitMenu',
    ['stations'] = "k-ezjob:foodmenu"
}

RegisterNetEvent('QBCore:Client:UpdateObject', function()
	QBCore = exports['qb-core']:GetCoreObject()
end)

local function createZones()
    for k,t in pairs(Config.Locations) do
        for v,u in pairs(t) do
            local PlayerData = QBCore.Functions.GetPlayerData()
            if v ~= 'blip' and v ~= 'commission' then
                for i = 1,#u do
                    if v == 'duty' or v == 'stash' or v == 'job_stash' or v == 'clothing' then
                        exports['qb-target']:AddBoxZone(k.."_"..v.."_"..i, vector3(u[i].x, u[i].y, u[i].z), 1.5, 1.5, {
                            name=k.."_"..v.."_"..i,
                            heading=u[i].w,
                            minZ = u[i].z-1,
                            maxZ = u[i].z+1,
                            debugPoly=Config.Debug
                            }, {
                                options = {
                                    {
                                    event = hardcordedEvents[v],
                                    icon = Config.Icons[v],
                                    label = Config.Labels[v],
                                    store = k,
                                    index = i,
                                    type = v
                                    },
                                },
                                job = Config.Locations[k]['job_names'],
                                distance = 2.0
                            })
                    elseif v == 'tray' or v == 'register' then
                        exports['qb-target']:AddBoxZone(k.."_"..v.."_"..i, vector3(u[i].x, u[i].y, u[i].z), 1.5, 1.5, {
                            name=k.."_"..v.."_"..i,
                            heading=u[i].w,
                            minZ = u[i].z-1,
                            maxZ = u[i].z+1,
                            debugPoly=Config.Debug
                            }, {
                                options = {
                                    {
                                    event = hardcordedEvents[v],
                                    icon = Config.Icons[v],
                                    label = Config.Labels[v],
                                    store = k,
                                    index = i,
                                    type = v
                                    },
                                },
                                distance = 2.0
                            })
                    elseif v == 'boss_menu' and PlayerData.job.isboss then
                        exports['qb-target']:AddBoxZone(k.."_"..v.."_"..i, vector3(u[i].x, u[i].y, u[i].z), 1.5, 1.5, {
                            name=k.."_"..v.."_"..i,
                            heading=u[i].w,
                            minZ = u[i].z-1,
                            maxZ = u[i].z+1,
                            debugPoly=Config.Debug
                            }, {
                                options = {
                                    {
                                    event = hardcordedEvents[v],
                                    icon = Config.Icons[v],
                                    label = Config.Labels[v],
                                    store = k,
                                    type = v
                                    },
                                },
                                job = Config.Locations[k]['job_names'],
                                distance = 2.0
                            })
                    elseif v == 'stations' or v == 'shop' then
                        exports['qb-target']:AddBoxZone(k.."_"..v.."_"..i, vector3(u[i].coord.x, u[i].coord.y, u[i].coord.z), 1.5, 1.5, {
                            name=k.."_"..v.."_"..i,
                            heading=u[i].coord.w,
                            minZ = u[i].coord.z-1,
                            maxZ = u[i].coord.z+1,
                            debugPoly=Config.Debug
                            }, {
                                options = {
                                    {
                                    event = hardcordedEvents[v],
                                    icon = u[i].icon,
                                    label = u[i].label,
                                    store = k,
                                    type = v,
                                    index = i
                                    },
                                },
                                job = Config.Locations[k]['job_names'],
                                distance = 2.0
                            })                        
                    end
                end
            end
        end
    end
end

local function createBlips()
    for k,v in pairs(Config.Locations) do
        if v['blip'].active then
            Blip[k] = AddBlipForCoord(v['blip'].coords.x, v['blip'].coords.y, v['blip'].coords.z)
            SetBlipSprite(Blip[k], v['blip'].sprite)
            SetBlipDisplay(Blip[k], 4)
            SetBlipScale(Blip[k], v['blip'].scale)
            SetBlipAsShortRange(Blip[k], true)
            SetBlipColour(Blip[k], v['blip'].color)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v['blip'].label)
            EndTextCommandSetBlipName(Blip[k])
        end
    end
end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	QBCore = exports['qb-core']:GetCoreObject()
    local PlayerData = QBCore.Functions.GetPlayerData()
    createBlips()
    createZones()
	if PlayerData.job.onduty then
	    if not QBCore.Shared.Jobs[PlayerData.job.name].defaultDuty then
		    TriggerServerEvent("QBCore:ToggleDuty")
	    end
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    for i = 1, #Config.Locations do
        for k,v in pairs(Config.Locations[i]['job_names']) do
            if v == JobInfo.name then
                createZones()
            end
        end
    end
end)

RegisterNetEvent("k-ezjob:Duty", function(data)
    local available = true
    local PlayerData = QBCore.Functions.GetPlayerData()
    for i = 1,#Config.Locations[data.store]['job_names'] do
        if PlayerData.job.name ~= Config.Locations[data.store]['job_names'][i] then
            available = false
            return
        end
    end
    if available then
        onDuty = not onDuty
        TriggerServerEvent("QBCore:ToggleDuty")
    end
end)

RegisterNetEvent("k-ezjob:register", function(data)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local doPay = true
    local menu = {}
    for k,v in pairs(Config.Locations[data.store]['job_names']) do
        if v == PlayerData.job.name then
            doPay = false
        end
    end
    QBCore.Functions.TriggerCallback("k-ezjob:cb:register", function(Registers)
        local amount = 0
        local biller = 0
        for k in pairs(Registers) do 
            if k == data.store then
                for i = 1,#Registers[k] do
                    if i == data.index then
                        biller = Registers[k][i].biller
                        amount = Registers[k][i].amount
                    end
                end
            end
        end
        if doPay then
            menu = {
                {
                    header = "Pay: $"..amount,
                    isMenuHeader = true
                },
                {
                    header = "Use Cash",
                    params = {
                        isServer = true,
                        event = "k-ezjob:pay",
                        args = {
                            amount = amount,
                            biller = biller,
                            store = data.store,
                            index = data.index,
                            type = 'cash'
                        }
                    }
                },
                {
                    header = "Use Bank",
                    params = {
                        isServer = true,
                        event = "k-ezjob:pay",
                        args = {
                            amount = amount,
                            biller = biller,
                            store = data.store,
                            index = data.index,
                            type = 'bank'
                        }
                    }
                }
            }
        else
            menu = {
                {
                    header = "On Register: $"..amount,
                    isMenuHeader = true
                },
                {
                    header = "Set Amount",
                    params = {
                        event = "k-ezjob:registerdata",
                        args = {
                            biller = QBCore.Functions.GetPlayerData().source,
                            store = data.store,
                            index = data.index,
                            type = 'set'
                        }
                    }
                },
                {
                    header = "Clear Amount",
                    params = {
                        event = "k-ezjob:registerdata",
                        args = {
                            biller = QBCore.Functions.GetPlayerData().source,
                            store = data.store,
                            index = data.index,
                            type = 'clear'
                        }
                    }
                }
            }
        end
        exports['qb-menu']:openMenu(menu)
    end)
end)

RegisterNetEvent("k-ezjob:registerdata", function(data)
    local price = 0
    if data.type == 'set' then
        dialog = exports['qb-input']:ShowInput({
            header = "Set Total",
            submitText = "Bill",
            inputs = {
                {
                    text = "Amount ($)",
                    name = "billprice", 
                    type = "number", 
                    isRequired = true, 
                    default = 0
                }
            }
        })
        price = tonumber(dialog['billprice'])
    end
    local args = {amount = price, index = data.index, store = data.store, biller = data.biller}
    TriggerServerEvent("k-ezjob:server:setregister", args)
end)

RegisterNetEvent("k-ezjob:stashes", function(data)
    local shop = data.store
    local stashType = data.type
    local items = {}
    local type = 'stash'
    local cid = nil
    if stashType == 'stash' then
        items = {
            maxweight = Config.Stash[stashType].weight,
            slots = Config.Stash[stashType].slots,
        }
        cid = QBCore.Functions.GetPlayerData().citizenid
    elseif stashType == 'shop' then
        type = 'shop'
        items = {
            label = shop,
            slots = 30,
            items = {}
        }
        for _,v in pairs(Config.Locations[shop][stashType]) do
            if #(GetEntityCoords(PlayerPedId()) - vector3(v['coord'].x,v['coord'].y,v['coord'].z)) < 5 then
                local slot = 0
                for _,k in pairs(v['items']) do
                    slot = slot + 1
                    items.items[#items.items+1] = {
                        name = k.name,
                        price = k.price,
                        amount = k.amount,
                        info = k.info,
                        type = "item",
                        slot = slot,
                    }
                end
                items.slots = slot
            end
        end
    else
        items = {
            maxweight = Config.Stash[stashType].weight,
            slots = Config.Stash[stashType].slots,
        }
        stashType = stashType.."_"..data.index
    end
    if cid then
        stashType = stashType.."_"..cid
    end
    TriggerEvent("inventory:client:SetCurrentStash", shop.."_"..stashType)
    TriggerServerEvent("inventory:server:OpenInventory", type, shop.."_"..stashType, items)
end)

RegisterNetEvent("k-ezjob:foodmenu", function(data)
    local menu = {}
    for k,v in pairs(Config.Locations[data.store]['stations'][data.index]['recipes']) do
        local disabled = false
        for u in pairs(v.cost) do
            if not QBCore.Functions.HasItem(u) then
                disabled = true
            end
        end
        menu[#menu+1] = {
            header = QBCore.Shared.Items[k].label,
            disabled = disabled,
            params = {
                event = "k-ezjob:client:station",
                args = {
                    shop = data.store,
                    index = data.index,
                    item = k
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent("k-ezjob:client:station", function(data)
    local reward = Config.Locations[data.shop]['stations'][data.index]['recipes'][data.item]
    QBCore.Functions.TriggerCallback("k-ezjob:server:cb:recipe", function(cb)
        if cb then
            if reward.emote then
                TriggerEvent('animations:client:EmoteCommandStart', {reward.emote})
                QBCore.Functions.Progressbar("station_progress"..reward.item, reward.label, reward.time, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[reward.item], "add")
                end)
            else
                QBCore.Functions.Progressbar("station_progress"..reward.item, reward.label, reward.time, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                    },{
                    animDict = reward.dict,
                    anim = reward.anim,
                    flags = reward.flags,
                    }, {
                    model = reward.prop,
                    bone = 28422,
                    coords = reward.pos,
                    rotation = reward.rot,
                    }, {}, function()
                    StopAnimTask(PlayerPedId(), reward.dict, reward.anim, 1.0)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[reward.item], "add")
                end)
            end
        end
    end, {reward, data.item})
end)