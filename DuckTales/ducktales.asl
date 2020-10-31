
state("fceux", "2.2.3") 
{	
	byte room_id:		0x003B1388, 0x0052;
	byte ctrl_1:	    0x003B1388, 0x0324; 
	byte ctrl_2:		0x003B1388, 0x03C1; 
} 

state("mesen", "0.9.9.0")
{
	byte room_id:       "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x52;
	byte ctrl_1:        "MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x324;
	byte ctrl_2:     	"MesenCore.dll", 0x042E0F30, 0, 0x58, 0xC90, 0x58, 0x3C1;
}

state("mesen", "0.9.8.0")
{
	byte room_id:       "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x52;
	byte ctrl_1:        "MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x324;
	byte ctrl_2:     	"MesenCore.dll", 0x4327750, 0xB8, 0x78, 0x3C1;
}

state("nestopia", "1.40")
{
	byte room_id:		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xba;
	byte ctrl_1:		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x38C;
	byte ctrl_2:		"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x429;
} 

init
{
	version = modules.First().FileVersionInfo.FileVersion;
}

split
{
	if (old.ctrl_1 == 36 && current.ctrl_1 == 1)
		return true;
	else if (old.ctrl_2 == 0 && current.ctrl_2 == 129 && current.room_id == 163)
		return true;
}

start
{	
	return (old.ctrl_1 == 0 && current.ctrl_1 == 36);
}

reset 
{	
	return (current.ctrl_1 == 0 && current.room_id == 0);
}


