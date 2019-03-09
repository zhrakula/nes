
state("mesen")
{
	byte level:     "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x85;
	byte countTank: "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x80;
	byte screen:    "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x16E;
}

state("fceux")
{
	byte level:     0x3B1388, 0x0085;
	byte countTank: 0x3B1388, 0x0080;
	byte screen:    0x3B1388, 0x016E;
}

state("nestopia")
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte level:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xED;
	byte countTank: "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xE8;
	byte screen:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x1D6;
}

startup
{

}

start
{
	return(current.level == 1 && old.screen == 116 && current.screen == 219);
}

reset
{
	return(current.screen == 161 || current.screen == 164);
}

split
{
	return(current.screen == 88 && old.screen == 58 && current.countTank == 0);
}
