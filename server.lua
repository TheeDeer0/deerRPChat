-- PLEASE DO NOT EDIT THE BELOW LINES, UNLESS YOU KNOW WHAT YOU ARE DOING!
local QBCore = nil
if config.QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

AddEventHandler('chatMessage', function(source, name, message)
    CancelEvent()
end)

local function isSourceAllowed(source, permissions)
    local hasPermission = false
    if permissions.identifiers then
        local identifiers = GetPlayerIdentifiers(source)
        for _, identifier in pairs(permissions.identifiers) do
            if tableFind(identifiers, identifier) then
                hasPermission = true
            end
        end
    end

    if permissions.aceGroups then
        for _, aceGroup in pairs(permissions.acePermissions) do
            if IsPlayerAceAllowed(source, aceGroup) then
                hasPermission = true
            end
        end
    end

    if Config.QbCore and QBCore ~= nil then
        local Player = QBCore.Functions.GetPlayer(source)
        if permissions.jobs then
            for _, job in pairs(permissions.jobs) do
                if Player.PlayerData.job.name == job then
                    hasPermission = true
                end
            end
        end

        if permissions.jobTypes then
            for _, jobType in pairs(permissions.jobTypes) do
                if Player.PlayerData.job.jobType == jobType then
                    hasPermission = true
                end
            end
        end
    end

    return hasPermission
end

function getNameFormat(src,data)
    local userFormats = {}
    for i,format in pairs(data.nameFormatting) do
        if format.permission ~= false and IsPlayerAceAllowed(src,format.permission) then
            table.insert(userFormats,format)
        elseif format.permission == false then
            table.insert(userFormats,format)
        end
    end
    table.sort(userFormats, function(a,b) return b.priority > a.priority end)
    if userFormats[1] ~= nil then return userFormats[1].format else return '' end
end

function sendMessage(source,msg,data)
    data.sourceFormat = getNameFormat(source,data)
    data.sourceName = GetPlayerName(source)
    if data.permission ~= false and not data.sendToAll then
        for _,plr in pairs(GetPlayers()) do 
            if IsPlayerAceAllowed(plr,data.permission) then
                TriggerClientEvent('deerRPChat:sendMessage', plr, source, msg, data)
            end
        end
    else
        TriggerClientEvent('deerRPChat:sendMessage', -1, source, msg, data)
    end
end

function createCommand(data)
    RegisterCommand(data.command, function(source, args, raw)
        local msg = table.concat(args, ' ')
        if data.permission ~= false then
            local hasPermission = isSourceAllowed(source, data.permissions)
            if not hasPermission then
                TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, 'You do not have permission to use this chat.')
                return
            end
        end
        if msg == '' then return end
        return sendMessage(source,msg,data)
    end)
end

Citizen.CreateThread(function() 
    for _, gc in pairs(config.chatTypes) do
        createCommand(gc)
    end
end)
