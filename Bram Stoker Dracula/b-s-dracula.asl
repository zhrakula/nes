

state("fceux", "2.2.3")
{
	byte control:   0x3B1388, 0x0249;
	//byte level:     0x3B1388, 0x027B;
	//byte start:     0x3B1388, 0x054F;
}

state("nestopia", "x.xx") // 1.49 ue
{
	byte control:    "nestopia.exe", 0x171CB0, 0xDC, 0x2B1;
}

state("nestopia", "1.40")
{
	byte control:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x2B1;
}

state("mesen", "0.9.8.0")
{
	byte control:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x249;
}

state("mesen", "0.9.9.0")
{
	byte control:     "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x249;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

split
{
	return(current.control == 3 && old.control == 4);
}
