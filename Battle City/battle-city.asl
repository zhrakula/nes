
// "Start Timer at:" should be '-2.00'

state("mesen", "0.9.8.0")
{
	byte level:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x85;
	byte countTank: "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x80;
	byte screen:    "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x17E;
}

state("fceux")
{
	byte level:     0x3B1388, 0x0085;
	byte countTank: 0x3B1388, 0x0080;
	byte screen:    0x3B1388, 0x017E;
	//005B
}

state("nestopia")
{
	byte level:     "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xED;
	byte countTank: "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xE8;
	byte screen:    "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x1E6;
}

state("punes64", "0.105") //d3d 0x142FF20 
{
	byte level:     0x142FFA5;
	byte countTank: 0x142FFA0;
	byte screen:    0x143009E;
} 

startup
{
	settings.Add("main", false, "Note: 'Start Timer at' should be '-2.00'");
}

start
{
	return(current.level == 1 && old.screen == 116 && current.screen == 219);
}

reset
{
	return(current.screen == 161 || current.screen == 164 || current.screen == 139);
}

split
{
	return(current.screen == 88 && old.screen == 58 && current.countTank == 0);
}
