
/*
+++ RAM Map +++
game_mode       0x001C // 0 = normal, 1 = demo
screen_type     0x002C // 3 = level transition, 4 = playing, 8 = boss defeated
stage           0x0030
room            0x00CB
*/

state("mesen", "0.9.8.0")
{
    byte game_mode:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x001C;
    byte screen_type:   "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x002C;
    byte room:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x00CB;
    byte stage:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x0030;
}

state("mesen", "0.9.9.0")
{
    byte game_mode:     "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x001C;
    byte screen_type:   "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x002C;
    byte room:          "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x00CB;
    byte stage:         "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x0030;
}

state("fceux", "2.2.3") 
{
    byte game_mode:     0x003B1388, 0x001C;
    byte screen_type:   0x003B1388, 0x002C;
    byte room:          0x003B1388, 0x00CB;
    byte stage:         0x003B1388, 0x0030;
}

state("nestopia", "1.40")
{
    // base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
    byte game_mode:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x0084;
    byte screen_type:   "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x0094;
    byte room:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x0133;
    byte stage:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x0098;
}

init
{
    version = modules.First().FileVersionInfo.FileVersion;
}

reset
{
	return (current.screen_type == 0 && current.game_mode == 1);
}

split
{
    if (current.screen_type == 9 && old.screen_type != 9) return true;
    if (current.room == old.room + 1) return true;
}

start
{
    if (current.screen_type == 4 && old.screen_type == 3 && current.game_mode == 0 && current.stage == 0) return true;
}
