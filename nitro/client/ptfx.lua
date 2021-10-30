-- TODO: Get actual exhaust positions and rotations. This is based on bone
-- positions, but custom exhausts can have different positions or rotations.
function CreateVehicleExhaustBackfire(vehicle, scale)
  local exhaustNames = {
    "exhaust",    "exhaust_2",  "exhaust_3",  "exhaust_4",
    "exhaust_5",  "exhaust_6",  "exhaust_7",  "exhaust_8",
    "exhaust_9",  "exhaust_10", "exhaust_11", "exhaust_12",
    "exhaust_13", "exhaust_14", "exhaust_15", "exhaust_16"
  }

  for _, exhaustName in ipairs(exhaustNames) do
    local boneIndex = GetEntityBoneIndexByName(vehicle, exhaustName)

    if boneIndex ~= -1 then
      local pos = GetWorldPositionOfEntityBone(vehicle, boneIndex)
      local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)

      UseParticleFxAssetNextCall('core')
      StartParticleFxNonLoopedOnEntity('veh_backfire', vehicle, off.x, off.y, off.z, 0.0, 0.0, 0.0, 0.4, false, false, false)
    end
  end
end

function CreateVehiclePurgeSpray(vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale)
  UseParticleFxAssetNextCall('core')
  return StartParticleFxLoopedOnEntity('ent_sht_steam', vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, false, false, false)
end

