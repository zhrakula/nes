
state("mesen")
{
	byte level:          "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0xE9;
	byte lvl_cln:        "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0xC9;
	byte boss_final_hp:  "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x3FC;
	byte start:          "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x1ED;
}

state("fceux")
{
	byte level:             0x3B1388, 0x00E9;
	byte lvl_cln:           0x3B1388, 0x00C9;
	byte boss_final_hp:     0x3B1388, 0x03FC;
	byte start:             0x3B1388, 0x01ED;
}

state("nestopia")
{
	byte level:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x151;
	byte lvl_cln:        "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x131;
	byte boss_final_hp:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x464;
	byte start:          "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x255;
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
	if (current.lvl_cln == 1 && old.lvl_cln == 2) return true;
	if (current.level == 5 && current.boss_final_hp == 0 && old.boss_final_hp > 0) return true;
}
