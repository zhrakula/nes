
state("mesen", "0.9.8.0")
{
	byte level:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xE9;
	byte location:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x33;
	byte lvl_cln:        "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xC9;
	byte boss_final_hp:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x3FC;
	byte start:          "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x1ED;
}

state("mesen", "0.9.9.0")
{
	byte level:          "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xE9;
	byte location:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x33;
	byte lvl_cln:        "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xC9;
	byte boss_final_hp:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x3FC;
	byte start:          "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x1ED;
}

state("fceux", "2.2.3")
{
	byte level:             0x3B1388, 0x00E9;
	byte location:          0x3B1388, 0x0033;
	byte lvl_cln:           0x3B1388, 0x00C9;
	byte boss_final_hp:     0x3B1388, 0x03FC;
	byte start:             0x3B1388, 0x01ED;
}

state("nestopia", "1.40")
{
	byte level:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x151;
	byte location:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x9B;
	byte lvl_cln:        "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x131;
	byte boss_final_hp:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x464;
	byte start:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x255;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

startup
{
    settings.Add("boss_before", false, "Split before boss");
}

start
{
	return (current.level == 0 && current.boss_final_hp == 0 && current.start == 252 && old.start == 0);
}

reset
{
	return (current.level == 0 && current.boss_final_hp == 0 && current.start == 0);
}

split
{
	if (settings["boss_before"]) {
		if (current.level == 0 && old.location == 11 && current.location == 12) return true;
		if (current.level == 1 && old.location == 11 && current.location == 12) return true;
		if (current.level == 2 && old.location == 14 && current.location == 15) return true;
		if (current.level == 3 && old.location == 10 && current.location == 11) return true;
		if (current.level == 4 && old.location == 16 && current.location == 17) return true;
	}
	if (current.lvl_cln == 1 && old.lvl_cln == 2) {
		if (current.level == 0 && current.location == 12) return true;
		if (current.level == 1 && current.location == 12) return true;
		if (current.level == 2 && current.location == 15) return true;
		if (current.level == 3 && current.location == 11) return true;
		if (current.level == 4 && current.location == 17) return true;
	}
	if (current.level == 5 && current.boss_final_hp == 0 && old.boss_final_hp > 0) return true;
}
