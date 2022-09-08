local ped = nil

local phoneProp = 0
local phoneModel = "phone"
local CACHED_PROPS = {}
local currentStatus = 'out'
local lastDict = nil
local lastAnim = nil

local lib = {
    ['cellphone@'] = {
        ['out'] = {
            ['text'] = 'cellphone_text_in',
            ['call'] = 'cellphone_call_listen_base'
        },
        ['text'] = {
            ['out'] = 'cellphone_text_out',
            ['call'] = 'cellphone_text_to_call'
        },
        ['call'] = {
            ['out'] = 'cellphone_call_out',
            ['text'] = 'cellphone_call_to_text'
        }
    },
    ['anim@cellphone@in_car@ps'] = {
        ['out'] = {
            ['text'] = 'cellphone_text_in',
            ['call'] = 'cellphone_call_in'
        },
        ['text'] = {
            ['out'] = 'cellphone_text_out',
            ['text'] = 'cellphone_text_in',
            ['call'] = 'cellphone_text_to_call'
        },
        ['call'] = {
            ['out'] = 'cellphone_horizontal_exit',
            ['text'] = 'cellphone_call_to_text',
            ['call'] = 'cellphone_text_to_call'
        }
    }
}

function newPhoneProp()
    ped = PlayerPedId()
    deletePhone()
    RequestModel(phoneModel)
    while not HasModelLoaded(phoneModel) do
        Wait(500) 
    end
    phoneProp = CreateObject(phoneModel, 1.0, 1.0, 1.0, 1, 1, 0)
    local bone = GetPedBoneIndex(ped, 28422)
    AttachEntityToEntity(phoneProp, ped, bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1,
                         1, 0, 0, 2, 1)
    table.insert(CACHED_PROPS, phoneProp)
end

function onCoverChange()
    if #CACHED_PROPS > 2 then doCleanup() end
    newPhoneProp()
end

function deletePhone()
    if phoneProp ~= 0 then
        Citizen.InvokeNative(0xAE3CBE5BF394C9C9,
                             Citizen.PointerValueIntInitialized(phoneProp))
        phoneProp = 0
    end
end

function doCleanup()
    for k, v in pairs(CACHED_PROPS) do
        if DoesEntityExist(v) then
            Citizen.InvokeNative(0xAE3CBE5BF394C9C9,
                                 Citizen.PointerValueIntInitialized(v))
        end
    end

    CACHED_PROPS = {}
end

function PhonePlayAnim(status)
    if currentStatus == status then return end

    ped = PlayerPedId()

    GiveWeaponToPed(PlayerPedId(), 0xA2719263, 0, 0, 1)

    local dict = "cellphone@"

    if IsPedInAnyVehicle(ped, false) then dict = "anim@cellphone@in_car@ps" end

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(1) end

    local anim = lib[dict][currentStatus][status]
    if currentStatus ~= 'out' then StopAnimTask(ped, lastDict, lastAnim, 1.0) end

    TaskPlayAnim(ped, dict, anim, 3.0, -1, -1, 50, 0, false, false, false)

    if status ~= 'out' and currentStatus == 'out' then
        Wait(380)
        newPhoneProp()
    end

    lastDict = dict
    lastAnim = anim
    currentStatus = status

    if status == 'out' then
        Wait(180)
        deletePhone()
        StopAnimTask(ped, lastDict, lastAnim, 1.0)
    end
end

function PhonePlayOut() PhonePlayAnim('out') end

function PhonePlayText() PhonePlayAnim('text') end

function PhonePlayCall() PhonePlayAnim('call') end

function PhonePlayIn() if currentStatus == 'out' then PhonePlayText() end end

AddEventHandler("onResourceStop", function(res)
    if res == GetCurrentResourceName() then
        deletePhone()
        doCleanup()
        PhonePlayOut()
    end
end)

function getAnimationStatus() return currentStatus end
