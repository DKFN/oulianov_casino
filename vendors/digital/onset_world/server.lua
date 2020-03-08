WorldLoaded = false

local DoorConfig = {
  [6]=180,
  [17]=180,
  [18]=180,
  [19]=180,
  [26]=180,
  [27]=180,
  [28]=180,
  [29]=180,
  [30]=180,
  [31]=180,
  [32]=180,
  [33]=180,
  [34]=180,
  [35]=0,
  [36]=270,
  [37]=270,
  [38]=270,
  [39]=270
}

function World_LoadWorld(filename, dimension)
  if IsPackageStarted('sandbox') then return error('ERROR: Not loading world since sandbox package is enabled, this package should only be used when sandbox is disabled.') end
  WorldLoaded = true

  print('Server: Attempting to load '..filename)

  local _table = File_LoadJSONTable(filename)
  if _table ~= nil then
    for _,v in pairs(_table) do
      if v['modelID'] ~= nil then
        World_CreateObject(v['modelID'], v['x'], v['y'], v['z'], v['rx'], v['ry'], v['rz'], v['sx'], v['sy'], v['sz'], dimension)
      else
        World_CreateDoor(v['doorID'], v['x'], v['y'], v['z'], v['yaw'])
      end
    end

    print('Server: '..filename..' loaded!')
  else
    print('Server: No world.json found in root server directory, one will be made next time the server saves.')
  end
end
-- AddEvent('OnPackageStart', World_LoadWorld)
AddEvent('Digital:World:LoadWorld', World_LoadWorld)

function World_CreateObject(objectID, x, y, z, rx, ry, rz, sx, sy, sz, dimension)
  local _object = CreateObject(objectID, x, y, z)
  if _object then
    if (rx ~= nil and sx ~= nil) then
      SetObjectRotation(_object, rx, ry, rz)
      SetObjectScale(_object, sx, sy, sz)
      SetObjectDimension(_object, dimension)
    end
  end
end

function World_CreateDoor(doorID, x, y, z, yaw, dimension)
  local _AddYaw = DoorConfig[tonumber(doorID)]
  if _AddYaw == nil then
    _AddYaw = 90
  end

  CreateDoor(doorID, x, y, z, yaw + _AddYaw)
  SetDoorDimension(doorID, dimension)
  
end
