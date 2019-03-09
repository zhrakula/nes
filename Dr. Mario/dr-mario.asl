
state("mesen")
{
	byte level:       "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x316;
	byte virusCount:  "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0xA4;
	byte scene:       "MesenCore.dll", 0x4311838, 0x118, 0xB8, 0x90, 0x1D8, 0x08, 0x6FD;
}

state("fceux")
{
	byte level:       0x3B1388, 0x0316;
	byte virusCount:  0x3B1388, 0x00A4;
	byte scene:       0x3B1388, 0x06FD;
}

state("nestopia")
{
	byte level:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x37E;
	byte virusCount:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x10C;
	byte scene:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x765;
}

reset
{
	return(current.virusCount == 0 && current.level == 0 && current.scene == 6);
}

split
{
	return(current.virusCount == 0 && old.virusCount > 0 && current.scene != 6 && current.scene != 0);
}

start
{
	return(current.level == 0 && current.virusCount == 4);
}
