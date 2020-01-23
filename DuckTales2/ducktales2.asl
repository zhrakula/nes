
state("mesen", "0.9.8.0")
{
	byte boss_hp:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xB9;
	byte start:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xCE;
	byte stage:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xC8;
	byte treasure:      "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x306;
}

state("fceux")
{
	byte boss_hp:       0x003B1388, 0x00B9;
	byte start:         0x003B1388, 0x00CE;
	byte stage:         0x003B1388, 0x00C8;
	byte treasure:      0x003B1388, 0x0306;
}

state("nestopia", "1.40")
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte boss_hp:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x121;
	byte start:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x136;
	byte stage:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x130;
	byte treasure:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x36E;
}

split
{
	if (current.stage == 6 && old.boss_hp == 1 && current.boss_hp == 0)
		return(true);
	if (current.treasure == 1 && old.treasure == 0)
		return(true);
}

start
{
	return (old.start == 0 && current.start == 2);
}

reset
{
	return (current.start == 0);
}

