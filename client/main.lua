local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
isLoggedIn = true

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	if PlayerData.job.onduty then
	    if PlayerData.job.name == "lscustoms" then
		TriggerServerEvent("QBCore:ToggleDuty")
	    end
	end
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    if PlayerData.job.name == 'lscustoms' then
    	onDuty = duty
    end
end)

Citizen.CreateThread(function()
    lscustoms = AddBlipForCoord(-339.92, -157.36, 44.59)
    SetBlipSprite (lscustoms, 310)
    SetBlipDisplay(lscustoms, 4)
    SetBlipScale  (lscustoms, 0.75)
    SetBlipAsShortRange(lscustoms, true)
    SetBlipColour(lscustoms, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Los Santos Customs")
    EndTextCommandSetBlipName(lscustoms)
end) 

RegisterNetEvent("qb-lscustoms:Duty")
AddEventHandler("qb-lscustoms:Duty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-lscustoms:Storage")
AddEventHandler("qb-lscustoms:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "lscstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "lscstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

--RegisterKeyMapping('qb-lscustoms:invoice', 'Invoice', 'keyboard', 'K')