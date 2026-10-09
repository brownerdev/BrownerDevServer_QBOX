local dispatcherPed
local dispatcherBlip

local targetOptionName = 'kabo_delivery_dispatcher'

local function debugPrint(message)
    if not Config.Debug then return end

    print(('[kabo_delivery] %s'):format(message))
end

local function removeDispatcherBlip()
    if not dispatcherBlip then return end

    RemoveBlip(dispatcherBlip)
    dispatcherBlip = nil
end

local function removeDispatcherPed()
    if not dispatcherPed then return end

    exports.ox_target:removeLocalEntity(dispatcherPed, targetOptionName)

    if DoesEntityExist(dispatcherPed) then
        SetEntityAsMissionEntity(dispatcherPed, true, true)
        DeleteEntity(dispatcherPed)
    end

    dispatcherPed = nil
end

local function createDispatcherBlip(coords)
    local blipConfig = Config.DeliveryPed.blip

    if not blipConfig or not blipConfig.enabled then return end

    dispatcherBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(dispatcherBlip, blipConfig.sprite)
    SetBlipDisplay(dispatcherBlip, 4)
    SetBlipScale(dispatcherBlip, blipConfig.scale)
    SetBlipColour(dispatcherBlip, blipConfig.color)
    SetBlipAsShortRange(dispatcherBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipConfig.label)
    EndTextCommandSetBlipName(dispatcherBlip)
end

local function spawnDispatcherPed()
    local pedConfig = Config.DeliveryPed

    if not pedConfig or not pedConfig.enabled then
        debugPrint('Dispatcher ped is disabled in config.')
        return
    end

    if dispatcherPed and DoesEntityExist(dispatcherPed) then return end

    local loaded, modelOrError = pcall(lib.requestModel, pedConfig.model, pedConfig.modelLoadTimeout)

    if not loaded then
        debugPrint(('Failed to load dispatcher ped model %s: %s'):format(pedConfig.model, modelOrError))
        return
    end

    local model = modelOrError
    local coords = pedConfig.coords

    dispatcherPed = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, false)

    if not DoesEntityExist(dispatcherPed) then
        debugPrint('Failed to create dispatcher ped.')
        SetModelAsNoLongerNeeded(model)
        return
    end

    SetModelAsNoLongerNeeded(model)
    FreezeEntityPosition(dispatcherPed, true)
    SetEntityInvincible(dispatcherPed, true)
    SetBlockingOfNonTemporaryEvents(dispatcherPed, true)

    if pedConfig.scenario then
        TaskStartScenarioInPlace(dispatcherPed, pedConfig.scenario, 0, true)
    end

    exports.ox_target:addLocalEntity(dispatcherPed, {
        {
            name = targetOptionName,
            icon = pedConfig.target.icon,
            label = pedConfig.target.label,
            distance = pedConfig.target.distance,
            onSelect = function()
                TriggerEvent('kabo_delivery:client:openDispatcher')
            end
        }
    })

    createDispatcherBlip(coords)
    debugPrint('Dispatcher ped spawned.')
end

CreateThread(spawnDispatcherPed)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    removeDispatcherBlip()
    removeDispatcherPed()
end)
