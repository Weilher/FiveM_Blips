--[[
For "Sprite" and "Color" parameters :
https://docs.fivem.net/docs/game-references/blips/

"DisplayType" can be : 
0 = Doesn't show up, ever, anywhere.
2 = Shows on both main map and minimap. (Selectable on map)
8 = Shows on both main map and minimap. (Not selectable on map)
3 = Shows on main map only. (Selectable on map)
5 = Shows on minimap only.
]]

local Blips = {
    ["Fleeca Bank"] = {
        Sprite = 207,
        Color = 25, 
        Scale= 1.0,
        DisplayType = 2, 
        Coord = {
            vector3(151.54, -1035.25, 0.0),
            vector3(315.80, -274.11, 0.0),
            vector3(-349.41, -44.80, 0.0),
            vector3(-1215.06, -326.24, 0.0),
            vector3(-2968.35, 483.01, 0.0),
            vector3(1175.06, 2706.80, 0.0),
            vector3(-115.09, 6458.77, 0.0),
        }
    },
    ["Tequi-la-la"] = {
        Sprite = 93,
        Color = 46, 
        Scale= 1.0,
        DisplayType = 2, 
        Coord = { vector3(-564.93, 271.58, 83.02) }
    }
}

------ Don't touch below this line ! -----
Citizen.CreateThread(function()
    for blipName, var in pairs(Blips) do
        if var.Coord then
            if type(var.Coord) == "table" then
                for _, coord in ipairs(var.Coord) do
                    CreateBlip(blipName, var, coord)
                end
            else
                CreateBlip(blipName, var, var.Coord)
            end
        end
    end
end)

function CreateBlip(blipName, var, coord)
    var.blip = AddBlipForCoord(coord.x, coord.y, coord.z)
    SetBlipAsShortRange(var.blip, true)
    SetBlipSprite(var.blip, var.Sprite)
    SetBlipColour(var.blip, var.Color)
    SetBlipDisplay(var.blip, var.DisplayType)
    SetBlipScale(var.blip, var.Scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipName)
    EndTextCommandSetBlipName(var.blip)
end