state("fceux") 
{
	byte level:    0x3B1388, 0x0088; 
	byte left:     0x3B1388, 0x00D7; 
	byte final:    0x3B1388, 0x00A4;
	sbyte boss_hp: 0x3B1388, 0x05E0;
} 

state("nestopia") 
{
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte level:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xF0;
	byte left:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x13F;
	byte final:      "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x10C;
	sbyte boss_hp:   "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x648;
} 

reset 
{	
	return(current.level == 0 && current.left == 0);
}

split
{
	return((current.level == old.level + 2) || (current.level == 34 && current.final == 2 && old.final != 2 && current.boss_hp < 0));
}

start
{	
	return(current.level == 0 && current.left > 0 && old.left == 0);
}
