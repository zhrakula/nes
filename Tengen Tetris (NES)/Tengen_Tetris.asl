state("fceux")
{
	byte lines100:     0x3B1388, 0x0425; // 0x30 - 0x39
	//byte lines010:     0x3B1388, 0x0426;
	//byte lines001:     0x3B1388, 0x0427;
	sbyte scene:    0x3B1388, 0x0029; // -6 - start screen, 0 - game
}

state("nestopia")
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte lines100:  "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x48D;
	sbyte scene:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x91;
}

reset
{
	return (current.scene == -6);
}

split
{
	return ((current.scene == 3 && old.scene != 3) || (current.lines100 >= 0x31));
}

start
{
	return(old.scene == -1 && current.scene == 0);
}
