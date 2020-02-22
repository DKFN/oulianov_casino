-- Data stored as "hash"
OMG._Cache = {}
local _cache = {
  players = {},
  objects = {},
  vehicles = {},
  doors = {}
}

--[[
  Col is the name of the collection type
  elem is the element to make matched
  idx is the hash idx

  EG OMG._Cache.Store(gamemodes, "OGKGG", playerid)
]]--
function OMG._Cache.Store(col, elem, idx)
  _cache[col][idx] = elem
end

function OMG._Cache.Remove(col, idx)
  _cache[col][idx] = _.remove(_cache[col][idx], function(e) return e == e end)
end

function OMG._Cache.Get(col, idx)
  print("CACHE : ".._.str(cache))
  return _cache[col][idx]
end

function OMG._Cache.Invalidate(col)
  _cache[col] = {}
end

function OMG.Refresh(col, newcol)
  -- _.cache[col] = _.groupBy(newCol, )
end