local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
    	PlayerData =  QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     	PlayerData.job = job
end)

RegisterNetEvent('QBCore:Player:SetPlayerData')
AddEventHandler('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
end)

-- target

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("lscustomsDuty", vector3(-341.38, -162.12, 44.59), 1, 1.2, {
		name = "lscustomsDuty",
		heading = 227,
		debugPoly = false,
		minZ=30.0,
		maxZ=45.0,
	}, {
		options = {
		    {  
			event = "qb-lscustoms:Duty",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "lscustoms",
		    },
		},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("lscustomsstorage", vector3(-349.59, -170.48, 39.01), 4.6, 1.2, {
        name="lscustomsstorage",
        heading=310,
        debugPoly=false,
        minZ=30.0,
        maxZ=45.0,
    }, {
            options = {
                {
                    event = "qb-lscustoms:Storage",
                    icon = "fas fa-box",
                    label = "Storage",
                    job = "lscustoms",
                },
            },
            distance = 1.5
        })

    exports['qb-target']:AddBoxZone("lscustoms_register", vector3(-339.92, -157.36, 44.59), 1.0, 0.4, {
        name="lscustoms_register",
        debugPoly=false,
        heading=312,
        minZ=31.0,
        maxZ=33.0,
    }, {
            options = {
                {
                    event = "qb-lscustoms:invoice",
                    parms = "1",
                    icon = "fas fa-credit-card",
                    label = "Charge Customer",
                    job = "lscustoms",
                },
            },
            distance = 1.5
        })
end)

-- Bill Stuff --
RegisterNetEvent("qb-lscustoms:invoice")
AddEventHandler("qb-lscustoms:invoice", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then 
            return 
        end
        TriggerServerEvent("qb-lscustoms:invoice:player", bill[1].input, bill[2].input)
    end
end)

