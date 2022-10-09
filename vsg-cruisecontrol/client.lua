local Tempomat = false
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if IsPedInAnyVehicle(GetPlayerPed(-1, false)) then
            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1, false))-1) then
                if GetEntitySpeed(GetPlayerPed(-1, false))*3.6 > vsg.minimumspeed then
                    if IsControlJustPressed(0, vsg.key) then
                        if Tempomat == false then
                            Tempomat = true
                            local Speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
                            local WriteSpeed = tostring(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1, false))) * 3.6)
                            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), Speed)
                            if string.len(WriteSpeed)>3 then
                                WriteSpeed = string.sub(WriteSpeed, 1, 5)
                            end
                            vsg.notify("Cruise Control activated for the Speed "..WriteSpeed.." km/h")
                        elseif Tempomat == true then
                            Tempomat = false
                            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
                            vsg.notify("Cruise Control Deactivated")
                        end
                    end
                end
            end
        end
    end
end)
