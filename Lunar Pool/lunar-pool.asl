
state("mesen", "0.9.8.0")
{
    byte level:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x187;
    byte count:  "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x18E;
    byte status: "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x1FF;
}

state("mesen", "0.9.9.0")
{
    byte level:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x187;
    byte count:  "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x18E;
    byte status: "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x1FF;
}

state("fceux", "2.2.3")
{
	byte level:     0x3B1388, 0x0187;
	byte count:     0x3B1388, 0x018E;
	byte status:    0x3B1388, 0x01FF;
	//byte fail:      0x3B1388, 0x0070;
	//byte ball:      0x3B1388, 0x01C3;
}

state("nestopia", "1.40")
{
	byte level:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x1EF;
	byte count:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x1F6;
	byte status:   "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x267;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
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
