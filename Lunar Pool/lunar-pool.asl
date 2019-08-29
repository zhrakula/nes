
state("mesen", "0.9.8.0")
{
    byte level:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x187;
    byte count:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x18E;
    byte status: "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x1FF;
}

state("fceux")
{
	byte level:     0x3B1388, 0x0187;
	byte count:     0x3B1388, 0x018E;
	byte status:    0x3B1388, 0x01FF;
	//byte fail:      0x3B1388, 0x0070;
	//byte ball:      0x3B1388, 0x01C3;
}

state("nestopia", "1.40")
{
	byte level:    "nestopia.exe", 0x1B1290, 0xD4, 0x1EF;
	byte count:    "nestopia.exe", 0x1B1290, 0xD4, 0x1F6;
	byte status:   "nestopia.exe", 0x1B1290, 0xD4, 0x267;
}

state("nestopia", "x.xx") // 1.49 ue
{
	byte level:    "nestopia.exe", 0x171CB0, 0xDC, 0x1EF;
	byte count:    "nestopia.exe", 0x171CB0, 0xDC, 0x1F6;
	byte status:   "nestopia.exe", 0x171CB0, 0xDC, 0x267;
}

state("punes64", "0.105") //d3d 0x142FF20
{
    byte level:    0x14300A7;
    byte count:    0x14300AE;
    byte status:   0x143011F;
}

reset
{
	return (current.status == 232 && (current.count == 255 || current.count == 0));
}

split
{
	return (current.level == old.level + 1 && current.status != 234);
}

start
{
	return (current.level == 1 && old.status == 234 && current.status == 235);
}
