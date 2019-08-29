
state("mesen", "0.9.8.0")
{
	byte level:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x316;
	byte virusCount:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xA4;
	byte scene:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x6FD;
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

state("punes64", "0.105") //d3d 0x142FF20
{
    byte level:       0x1430236;
    byte virusCount:  0x142FFC4;
    byte scene:       0x143061D;
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
