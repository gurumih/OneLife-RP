-- Minimap up
CreateThread(function()
    local ratio = GetScreenAspectRatio()
    local posX = -0.0045
    local posY = 0.002
    if tonumber(string.format("%.2f", ratio)) >= 2.3 then
        posX = -0.185
        posY = 0.0202
        print('Detected ultra-wide monitor, adjusted minimap')
    else 
        posX = -0.003
        posY = -0.014
    end
    SetMinimapComponentPosition('minimap', 'L', 'B', posX, posY, 0.150, 0.188888)
    SetMinimapComponentPosition('minimap_mask', 'L', 'B', posX + 0.0155, posY + 0.03, 0.111, 0.159)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', posX - 0.0255, posY + 0.02, 0.266, 0.237)
    SetBlipAlpha(GetNorthRadarBlip(), 0)
    SetRadarBigmapEnabled(false, false)
    DisplayRadar(true)
end)