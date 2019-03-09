
state("mesen")
{
	byte left:       "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x6;
	byte level:      "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x88;
	byte control1:   "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x44;
	byte control2:   "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x22;
}

state("fceux")
{
	byte left:       0x3B1388, 0x0006;
	byte level:      0x3B1388, 0x0088;
	byte control1:   0x3B1388, 0x0044;
	byte control2:   0x3B1388, 0x0022;
	//byte boss_hp:    0x3B1388, 0x0798;
}

state("nestopia")
{
	byte left:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x6E;
	byte level:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xF0;
	byte control1: "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xAC;
	byte control2: "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x8A;
}

split
{
	if (current.level == 0 && current.control2 == 1 && old.control2 == 0) return true;
	if (current.level == 2 && current.control2 == 1 && old.control2 == 0) return true;
	if (current.level == 4 && current.control2 == 5 && old.control2 == 4) return true;
	if (current.level == 6 && current.control2 == 4 && old.control2 == 3) return true;
	if (current.level == 8 && current.control2 == 0 && old.control2 == 2) return true;
}

start
{
	return(current.level == 0 && current.control1 == 4 && old.control1 == 3);
}

reset
{
	return(current.control1 == 0 && current.level == 0 && current.control2 == 0 && current.left == 0);
}
