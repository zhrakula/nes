
state("mesen", "0.9.8.0")
{
	byte level:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x85;
	byte countTank: "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x80;
	byte screen:    "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x16E;
}

state("mesen", "0.9.9.0")
{
	byte level:     "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x85;
	byte countTank: "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x80;
	byte screen:    "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x16E;
}

state("fceux", "2.2.3")
{
	byte level:     0x3B1388, 0x0085;
	byte countTank: 0x3B1388, 0x0080;
	byte screen:    0x3B1388, 0x016E;
}

state("nestopia", "1.40")
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte level:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xED;
	byte countTank: "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xE8;
	byte screen:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x1D6;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
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
