
state("mesen", "0.9.8.0")
{
	sbyte boss_hp:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x682;
	byte start:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x2B;
	byte screen:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x4D4;
	byte stage:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x2D;
	byte blk:            "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x125;
}

state("mesen", "0.9.9.0")
{
	sbyte boss_hp:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x682;
	byte start:          "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x2B;
	byte screen:         "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x4D4;
	byte stage:          "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x2D;
	byte blk:            "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x125;
}

state("fceux", "2.2.3")
{
	sbyte boss_hp:      0x003B1388, 0x0682;
	byte start:         0x003B1388, 0x002B;
	byte screen:        0x003B1388, 0x04D4;
	byte stage:         0x003B1388, 0x002D; 
	byte blk:           0x003B1388, 0x0125;
}

state("nestopia", "1.40")
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	sbyte boss_hp:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x6EA;
	byte start:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x93;
	byte screen:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x53C;
	byte stage:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x95;
	byte blk:            "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x18D;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

split
{
	if (current.stage != old.stage && current.stage != 199 && current.stage != 25 && current.stage != 187 && current.stage != 35 && current.stage != 159 && current.stage != 255 && current.stage != 0)
		return(true);
	if (current.boss_hp <= 0 && current.blk == 39 && old.blk == 0 && current.stage == 229)
		return(true);
}

start
{
	return (current.start == 16 && current.screen == 60);
}

reset
{
	return (current.stage == 0 && current.screen == 0);
}

