
state("fceux")
{
	byte level:     0x3B1388, 0x0187;
	byte count:     0x3B1388, 0x018E;
	byte status:    0x3B1388, 0x01FF;
	//byte fail:      0x3B1388, 0x0070;
	//byte ball:      0x3B1388, 0x01C3;
}

state("nestopia")
{
	byte level:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x1EF;
	byte count:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x1F6;
	byte status:   "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x267;
	//byte fail:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xD8;
}

reset
{
	return (current.status == 232 && current.count == 255); // need hard reset
}

split
{
	return (current.level == old.level + 1 && current.status != 234);
}

start
{
	return (current.level == 1 && old.status == 234 && current.status == 235);
}
