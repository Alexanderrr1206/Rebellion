--[[-----------------------------------
© Loaf Scripts 2020 All Rights Reserved
--]]-----------------------------------

TriggerEvent("esx_society:registerSociety", Config.Job.Name, "Realtor", "society_" .. Config.Job.Name, "society_" .. Config.Job.Name, "society_" .. Config.Job.Name, {type = "private"})

ESX = nil
TriggerEvent(Config.ESX.Server, function(obj) ESX = obj end)

RegisterNetEvent("loaf_rea:remove_house")
AddEventHandler("loaf_rea:remove_house", function(houseid)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.job.name == Config.Job.Name and tonumber(xPlayer.job.grade) >= Config.Job.Create then
        MySQL.Async.fetchScalar("SELECT `houseid` FROM `loaf_bought_houses` WHERE `houseid`=@houseid",{["@houseid"]=houseid}, function(result)
            if result == nil then
                MySQL.Async.execute("DELETE FROM `loaf_houses` WHERE `id`=@houseid", {["@houseid"]=houseid}, function(changed)
                    if changed and changed > 0 then
                        TriggerEvent("loaf_housing:update_houses")
                    else
                        TriggerClientEvent("esx:showNotification", xPlayer.source, Strings.InvalidHouse)
                    end
                end)
            else
                TriggerClientEvent("esx:showNotification", xPlayer.source, Strings.SomeoneOwns)
            end
        end)
    end
end)

RegisterNetEvent("loaf_rea:create_house")
AddEventHandler("loaf_rea:create_house", function(label, property_type, door, category, id, garage_enter, garage_exit, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.job.name == Config.Job.Name and tonumber(xPlayer.job.grade) >= Config.Job.Create then
        if door and category and id and type(door) == "vector4" and type(category) == "string" and type(id) == "number" then
            door = json.encode({x = door.x, y = door.y, z = door.z, h = door.w})
            local entrance, exit = {}, {}
            if garage_enter and garage_exit then
                entrance = {x = garage_enter.x, y = garage_enter.y, z = garage_enter.z}
                exit = {x = garage_exit.x, y = garage_exit.y, z = garage_exit.z, h = garage_exit.w}
            end

            MySQL.Async.fetchScalar("SELECT MAX(`id`) FROM `loaf_houses`", {}, function(houseid)
                local next_house = (houseid or 0) + 1
                MySQL.Async.execute([[
                    INSERT INTO `loaf_houses` 
                    (`id`, `label`, `property_type`, `shell_type`, `entrance`, `garage_entrance`, `garage_exit`, `shell_id`, `price`) 
                    VALUES 
                    (@id, @label, @type, @shell, @door, @entrance, @exit, @shellid, @price)
                ]], {
                    ["@id"] = next_house,
                    ["@label"] = label,
                    ["@type"] = property_type,
                    ["@shell"] = category,
                    ["@door"] = door,
                    ["@entrance"] = json.encode(entrance),
                    ["@exit"] = json.encode(exit),
                    ["@shellid"] = id,
                    ["@price"] = price
                }, function(insert)
                    if insert then
                        TriggerEvent("loaf_housing:update_houses")
                    end
                end)
            end)
        end
    end
end)

RegisterNetEvent("loaf_rea:transfer_house")
AddEventHandler("loaf_rea:transfer_house", function(player, houseid, interior)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer and xPlayer.job.name == Config.Job.Name then
        TriggerEvent("loaf_housing:assignHouse", player, houseid, interior, function(sold)
            if not sold then
                TriggerClientEvent("esx:showNotification", xPlayer.source, Strings.NotSold)
            end
        end)
    end
end)