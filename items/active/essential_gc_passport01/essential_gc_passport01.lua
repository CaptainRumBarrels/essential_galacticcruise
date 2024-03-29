function init()
  if storage.consumed then
    item.consume(1)
    return
  end
  storage.consumed = false

  message.setHandler("holdingTransponder", function() return true end)
  message.setHandler("setTransponderConsumed", function() storage.consumed = true end)
  message.setHandler("consumeTransponder", function() item.consume(1) end)
end

function activate(fireMode, shiftHeld)
  player.warp("InstanceWorld:essential_gc_ship01passport")
  item.consume(1)
end

function uninit()
  if storage.consumed and item.count() > 0 then
    item.consume(1)
  end
end
