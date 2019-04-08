
function printInfo()

  charge = emu.read(0x0091, emu.memType.cpu, true)
  x_pos = emu.read(0x04D0, emu.memType.cpu, false)

  if (emu.read(0x0099, emu.memType.cpu, false) == 31 and emu.read(0x007B, emu.memType.cpu, false) == 13) then
    boss_hp = emu.read(0x05D3, emu.memType.cpu, true)
  else
    boss_hp = emu.read(0x05D2, emu.memType.cpu, true)
  end

  if (charge > 62) then
    charge = 5
  elseif (charge > 32) then
    charge = 3
  else
    charge = 1
  end

  if ((x_pos - 47) % 3 == 0) then
    color = 0xFF0000
  else
    color = 0x00FF00
  end


  if emu.getMouseState().right then
    is_showed = not is_showed
  end

  if (is_showed) then

    emu.drawRectangle(0, 181, 256, 12, 0x000000, true, 1)
    emu.drawString(18, 184, "BOSSHP: " .. boss_hp, 0xffffff, 0xFF000000, 1)
    emu.drawString(96, 184, "DAMAGE: " .. charge .. " / " .. emu.read(0x05DE, emu.memType.cpu, true), 0xffffff, 0xFF000000, 1)
    emu.drawString(196, 184, "X: " .. x_pos, color, 0xFF000000, 1)
    emu.drawRectangle(96, 210, 16, 2, 0xFFFF00, true, 1)
    emu.drawRectangle(112, 210, 16, 2, 0xFF4500, true, 1)
    emu.drawRectangle(128, 210, 16, 2, 0xFF0000, true, 1)

    if (emu.read(0x0099, emu.memType.cpu, false) == 25 and emu.read(0x007B, emu.memType.cpu, false) == 9) then
      emu.drawRectangle(47, 164, 162, 1, 0x00FF00, true, 1)
      for i = 47, 208, 3 do
         emu.drawRectangle(i, 164, 1, 1, 0xFF0000, true, 1)
      end
    end
  end

end

is_showed = true

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(printInfo, emu.eventType.endFrame);

--Display a startup message
emu.displayMessage("Script", "Boss Fight Lua script loaded.")
