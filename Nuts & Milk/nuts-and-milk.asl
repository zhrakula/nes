
state("mesen")
{
	byte level:     "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x20;
	byte finish:    "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x70E;
	byte die:       "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x57;
}

state("fceux")
{
	byte level:     0x3B1388, 0x0020;
	byte finish:    0x3B1388, 0x070E;
	byte die:       0x3B1388, 0x0057;
}

state("nestopia")
{
	byte level:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x88;
	byte finish:   "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x776;
	byte die:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xBF;
}

reset
{
	return(current.level == 0);
}

split
{
	return((current.level == old.level + 1 ) || (current.finish == 248 && old.finish == 17 && current.level == 50 && current.die == 0));
}

start
{
	return(current.level == 1 && old.level == 0);
}
