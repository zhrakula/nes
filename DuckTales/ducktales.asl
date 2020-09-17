
// Based on https://github.com/saturnin55/DucktalesNESAutoSplitter by saturnin55

state("fceux", "2.2.3") 
{
 	byte zone_id:		0x003B1388, 0x0020;
	byte room_id:		0x003B1388, 0x0052;
	byte areas:			0x003B1388, 0x00a0;
	byte ctrl_flag:		0x003B1388, 0x00e3; 
} 

state("nestopia", "1.40")
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte zone_id:		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x88; 	// 0x0020
	byte room_id:		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xba; 	// 0x0052
	byte areas:			"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x108;	// 0x00a0;
	byte ctrl_flag:		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x14b;	// 0x00e3
} 

state("mesen", "0.9.9.0")
{
	byte zone_id:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x20;
	byte room_id:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x52;
	byte areas:         "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xA0;
	byte ctrl_flag:     "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0xE3;
}

state("mesen", "0.9.8.0")
{
	byte zone_id:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x20;
	byte room_id:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x52;
	byte areas:         "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xA0;
	byte ctrl_flag:     "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0xE3;
}

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

split
{
	if(old.areas != current.areas && (current.room_id == old.room_id))
		return(true);
	if(current.areas == 0x1f && current.zone_id == 0xa3 && current.room_id == 0xa3 && current.ctrl_flag == 1)
		return(true);
}

start
{	
	return (old.zone_id == 0x73 && current.zone_id != 0x73);
}

reset 
{	
	return (current.zone_id == 0 && current.room_id == 0);
}

startup
{
	settings.Add("main2", false, "- Note : Set 'Start Timer at' to -0.60 in the 'Edit Splits' screen");
}


