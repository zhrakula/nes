state("fceux")
{
	byte level:		0x3B1388, 0x0020;
	byte finish:	0x3B1388, 0x070E;
	byte die:		0x3B1388, 0x0057;
}

state("nestopia")
{	// nestopia 1.40
	// base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
	byte level:	"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x88;
	byte finish:	"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x776;
	byte die:	"nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xBF;
}

reset
{
	return(current.level == 0);
}

split
{
	return((current.level == old.level + 1 ) || (current.finish == 248 && old.finish == 17 && current.level == 50 && current.die == 0));
}

start
{
	return(current.level == 1 && old.level == 0);
}
