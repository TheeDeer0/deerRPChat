-- PLEASE DO NOT EDIT THE BELOW LINES, UNLESS YOU KNOW WHAT YOU ARE DOING!

RegisterNetEvent('deerRPChat:sendMessage')
AddEventHandler('deerRPChat:sendMessage', function(msgSrc, msg, data)
    if data.proximity ~= false then
        if PlayerId() == GetPlayerFromServerId(msgSrc) then
            TriggerEvent('chat:addMessage',{
                color = {data.color.r, data.color.g, data.color.b},
                multiline = true,
                args = {data.prefix..' '..data.sourceFormat..data.sourceName,msg}
            })
        elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(PlayerId())), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(msgSrc))), true) < data.proximity then
            TriggerEvent('chat:addMessage',{
                color = {data.color.r, data.color.g, data.color.b},
                multiline = true,
                args = {data.prefix..' '..data.sourceFormat..data.sourceName,msg}
            })
        end
    else
        TriggerEvent('chat:addMessage',{
            color = {data.color.r, data.color.g, data.color.b},
            multiline = true,
            args = {data.prefix..' '..data.sourceFormat..data.sourceName,msg}
        })
    end
end)

