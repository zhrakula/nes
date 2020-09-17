
state("mesen", "0.9.8.0")
{
	byte level:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x20;
	byte finish:    "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x70E;
	byte die:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x57;
}

state("mesen", "0.9.9.0")
{
	byte level:     "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x20;
	byte finish:    "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x70E;
	byte die:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x57;
}

state("fceux", "2.2.3")
{
	byte level:     0x3B1388, 0x0020;
	byte finish:    0x3B1388, 0x070E;
	byte die:       0x3B1388, 0x0057;
}

state("nestopia", "1.40")
{
	byte level:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x88;
	byte finish:   "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x776;
	byte die:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xBF;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

reset
{
	return(current.level == 0);
}

split
{
	return ((current.level == old.level + 1 ) || (current.finish == 248 && old.finish == 17 && current.level == 50 && current.die == 0));
}

start
{
	return(current.level == 1 && old.level == 0);
}
